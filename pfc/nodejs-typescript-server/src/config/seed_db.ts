import fs from "fs";
import crypto from "crypto";
import { PointOfInterest } from "../entities/Point_of_interest";
import { getRepository, Repository } from "typeorm";
import campusMapData from "../data/campus_map.json";
import instructorData from "../data/instructors.json";
import {
  createAndSaveInstructor,
  createAndSavePointOfInterest,
  createAndSaveRating,
  createAndSaveStudent,
  createAndSaveTextbook,
  createAndSaveUser,
} from "../services/db_manager";
import { Instructor } from "../entities/Instructor";
import { InstructorRank } from "../entities/Instructor";
import { Textbook } from "../entities/Textbook";
import textbooksData from "../data/textbook_data_raw.json";
import { Student } from "../entities/Student";
import { User } from "../entities/User";
import names from "../data/names.json";
import studentData from "../data/students2.json";
import usersData from "../data/users2.json";
import { StudentType, UserType, RatingType } from "../services/db_manager";
import { Rating } from "../entities/Rating";
import ratingData from "../data/rating.json";
export interface PointOfInterestDataType {
  titre: string;
  latitude: number;
  longitude: number;
  details: string[];
  contact_info: string | "";
  icon: string | "";
  cover: string[];
  floors: boolean;
}
export interface InstructorDataType {
  first_name: string;
  last_name: string;
  email: string;
  field: string;
  phone_number: number;
  rank: InstructorRank;
  textbooks?: Textbook;
}
export interface TextbookDataType {
  title: string;
  author: string[];
  categories: string[];
  field: string;
  nb_copies: number;
  desc: string | undefined;
  page_count: number;
  cover_image_link: string | undefined;
  author_instructor?: Instructor;
}

export interface IRating {
  user_id: number;
  textbook_id: number;
  rating: number;
}
//TODO: Think about refactoring this code

/**
 * Function that seeds the points of interest json data into database
 */
export const seedPoints = async () => {
  const poisRepo = getRepository(PointOfInterest);

  //delete all markers in the table if they already exist
  await poisRepo.delete({});

  //looping through the JSON data and inserting it
  const campusMapJsonData = campusMapData["features"];
  campusMapJsonData.forEach(async (point) => {
    //if the object is of type point add it to the table
    if (point.geometry.type.toLocaleLowerCase() === "point") {
      //create a new object of type point
      const newPointToAdd: PointOfInterestDataType = {
        floors: point.floors!,
        titre: <string>point.properties.name,
        longitude: <number>point.geometry.coordinates[0],
        latitude: <number>point.geometry.coordinates[1],
        contact_info: point.contact ? point.contact : "",
        details: point.desc ? point.desc : [""],
        icon: "",
        cover: point.photos ? point.photos : [""],
      };

      //add the point to the database + await to be saved
      await createAndSavePointOfInterest(newPointToAdd, poisRepo);
    }
  });
  console.log("Points of interest has been seeded to the database");
};

/**
 * Function that seeds the instructors data from the json file to the database
 */
export const seedInstructors = async () => {
  //TODO: comment the ambigius segments of the code
  const instructorRepo: Repository<Instructor> = getRepository(Instructor);

  //delete all markers in the table if they already exist
  await instructorRepo.delete({});

  //looping through the data and inserting the instances to the database
  instructorData.forEach(async (instructor) => {
    //create a new instructor instance with the new values
    const newInstructorInstance: InstructorDataType = {
      ...instructor,
    };
    await createAndSaveInstructor(newInstructorInstance, instructorRepo);
  });
  console.log("Instructor data has been seeded to the database");
};

/**
 * Function which seeds the textbook JSON data into the database
 */
export const seedTextbooks = async () => {
  //looping through the array of data and inserting it into the database
  const textbookRepo: Repository<Textbook> = getRepository(Textbook);

  //delete all the textbook rows if they already exist
  await textbookRepo.delete({});

  textbooksData.forEach(async (textbook) => {
    const personalizedTextbook: TextbookDataType = {
      title: textbook.title,
      author: textbook.authors,
      categories: textbook.categories,
      page_count: textbook.pageCount,
      cover_image_link: textbook.thumbnailUrl,
      //generating a radom number from 1-10
      nb_copies: Math.floor(Math.random() * 10) + 1,
      desc: textbook.shortDescription,
      field: "Computer Science",
    };
    //await the creations and save of the instances
    await createAndSaveTextbook(personalizedTextbook, textbookRepo);
  });
};

/**
 * Function which generates fake student data and writes it into a json file.
 */
export const generateFakeStudents = () => {
  //reading from the file first -- to open it

  //creating fake students
  const students = [];
  for (let index = 0; index < 50; index++) {
    students.push({
      first_name: names[Math.floor(Math.random() * names.length) - 1],
      birth_date: `2001-${Math.floor(Math.random() * 12) + 1}-${
        Math.floor(Math.random() * 31) + 1
      }`,
      field: "computer science",
      last_name: names[Math.floor(Math.random() * names.length) - 1],
      email: `${names[Math.floor(Math.random() * names.length) - 1]}@gmail.com`,
      matricule_bac: (Math.floor(Math.random() * 50000) + 10000).toString(),
      cle_secrete: crypto.randomBytes(4).toString("hex"),
      phone_number: (Math.floor(Math.random() * 50000) + 10000) as number,
    } as StudentType);
  }

  //parsing json into text
  const data = JSON.stringify(students);
  console.log(students);

  //writing into the json file
  fs.writeFileSync("src/data/students.json", data);
};
export const generateFakeUsers = async () => {
  //retrive all the students from the database
  const all_students = await getRepository(Student).find({});
  const users: UserType[] = [];
  //create for every student a user account with a password
  all_students.forEach((student) => {
    users.push({
      matricule: student.id.toString(),
      password: crypto.randomBytes(8).toString("hex"),
      matricule_bac: student.matricule_bac,
      cle_secrete: student.cle_secrete,
    } as UserType);
  });

  //writing the data into the JSON file
  const data = JSON.stringify(users);
  fs.writeFileSync("src/data/users.json", data);
};

/**
 * Function which seeds fake student data with their corresponding user account max limit (50 set)
 */
export const seedStudentData = async () => {
  //loop through the json file
  studentData.forEach(async (input) => {
    const data = await createAndSaveStudent(input);
    if (data)
      console.log(
        `${input.first_name} ${input.last_name} added successfully\n`
      );
  });
};

/**
 * Function which seeds the user's.
 */
export const seedUsersData = async () => {
  //loop through the json file
  usersData.forEach(async (user) => {
    //find the associated student
    const found_student: Student | undefined = await getRepository(
      Student
    ).findOne({
      where: { cle_secrete: user.cle_secrete },
    });

    const created_user: number | undefined = await createAndSaveUser(
      user,
      found_student!
    );
    if (created_user) console.log(`${user.matricule} has been created`);
  });
};

/**
 * Function which seeds the ratings into the database.
 */
export const seedRatings = async () => {
  try {
    // //empty the entire database
    // await getRepository(Rating).delete({});
    // //retrieve all the texbooks necessary
    // const textbooks: Textbook[] = await getRepository(Textbook).find({});
    // const users: User[] = await getRepository(User).find({});
    // console.log(textbooks);

    //lopping through the users and adding the relationship
    ratingData.forEach(async (rating) => {
      //create a rating to every user in the Rating table
      const created_rating = await createAndSaveRating({
        user_id: rating["user_id"],
        textbook_id: rating["textbook_id"],
        rating: rating["rate "],
      });

      if (created_rating instanceof Rating)
        console.log(`${created_rating.id} Successfully added`);
    });
  } catch (error) {
    console.error(error);
  }
};
