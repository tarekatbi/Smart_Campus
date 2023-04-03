import { seedPoints } from "../src/config/seed_db";
import request from "supertest";
import { dbConnectionConfig } from "../src/config/db";
import { createTheServer } from "../src/app";

//connecting to the database before running the tests
beforeAll(async () => {
  const connection = await dbConnectionConfig();
  await seedPoints();
  //verify connection
  if (!connection.isConnected) console.log("Cannot connect to database");
});

describe("GET /map/map_data ", () => {
  it("request the campus map's data", async () => {
    const app = createTheServer();
    const response = await request(app).get("/api/map/map_data");
    expect(response.statusCode).toEqual(200);
  });
});

describe("GET /map/get_points", () => {
  it("request all the end points", async () => {
    const app = createTheServer();
    const response = await request(app).get("/api/map/get_points");
    expect(response.statusCode).toEqual(200);
  });
});

describe("POST /map/add_marker", () => {
  const app = createTheServer();
  describe("given the user is not logged in ", () => {
    it("acess denied ", async () => {});
  });
  describe("given the user is logged in", () => {
    it("wrong informations  ", async () => {
      const { body, statusCode } = await request(app)
        .post("/api/map/add_marker")
        .send({
          information: "Sanitaire 2",
          details: "sanitaire du département x",
          latitude: 35.221333,
          longitude: -0.63221,
        });
      expect(statusCode).toEqual(200);
    });
  });
});
