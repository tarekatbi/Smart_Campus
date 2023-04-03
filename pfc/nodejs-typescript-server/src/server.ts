import { dbConnectionConfig } from "./config/db";
import dotenv from "dotenv";
import { createTheServer } from "./app";
import {
  seedInstructors,
  seedPoints,
  generateFakeStudents,
  seedTextbooks,
  seedStudentData,
  generateFakeUsers,
  seedUsersData,
  seedRatings,
} from "./config/seed_db";
import studentData from "./data/students2.json";

dotenv.config();

const main = async () => {
  const connection = await dbConnectionConfig();

  /* THE FOLLOWING INSCTRUCTIONS MUST BE RAN ONLY ONCE */
  //await seedPoints();
  //await seedTextbooks();
  // await seedInstructors();
  // generateFakeStudents();
  //await seedStudentData();
  //await generateFakeUsers();
  //await seedUsersData();
  //await seedRatings();

  /*-------------------------------------------------- */
  //verify connection
  if (!connection.isConnected) console.log("Cannot connect to database");
  else {
    const app = createTheServer();
    console.log("connected to the database");

    app.listen(process.env.PORT, () => {
      console.log("Server is running in PORT " + process.env.PORT);
    });
  }
};

main().catch((err) => {
  console.error(err);
});

export default main;
