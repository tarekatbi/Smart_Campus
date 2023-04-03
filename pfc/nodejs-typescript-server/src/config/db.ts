import { Connection, createConnection } from "typeorm";
import dotenv from "dotenv";
import { Session } from "../entities/Session";
import { User } from "../entities/User";
import { Student } from "../entities/Student";
import { PointOfInterest } from "../entities/Point_of_interest";
import { Instructor } from "../entities/Instructor";
import { Class } from "../entities/Class";
import { Textbook } from "../entities/Textbook";
import { Reservation } from "../entities/Reservation";
import { Rating } from "../entities/Rating";

dotenv.config();

export const dbConnectionConfig = () => {
  return createConnection({
    type: "mysql",
    host: process.env.HOSTED_DB_HOST,
    port: 3306,
    username: process.env.HOSTED_DB_USERNAME,
    password: process.env.HOSTED_DB_PASSWORD,
    database: process.env.HOSTED_DB_NAME,
    entities: [
      Session,
      User,
      Student,
      PointOfInterest,
      Instructor,
      Class,
      Textbook,
      Reservation,
      Rating,
    ],
    synchronize: true,
    logging: true,
  });
};
