import express from "express";
const cors = require("cors");
import { createSession } from "./config/createSession";
import authRoute from "./routes/auth";
import mapRoute from "./routes/map";
import userRoute from "./routes/user";
import recommenderRoute from "./routes/library_rec_system";
import textbookRoute from "./routes/textbooks";

/**
 * Function that creates an express server app with middlewares & setting
 * @returns Express App
 */
export function createTheServer() {
  const app = express();
  //Middlewares
  app.use(createSession());
  app.use(express.json());
  app.use(cors());

  //Routes
  app.use("/api/auth", authRoute);
  app.use("/api/map", mapRoute);
  app.use("/api/users", userRoute);
  app.use("/api/recommender", recommenderRoute);
  app.use("/api/textbooks", textbookRoute);

  return app;
}
