import { Student } from "../entities/Student";
import { User } from "../entities/User";
import { getRepository, Repository } from "typeorm";
import { PointOfInterest } from "../entities/Point_of_interest";
import { InstructorDataType, TextbookDataType } from "../config/seed_db";
import { Instructor } from "../entities/Instructor";
import { Textbook } from "../entities/Textbook";
import { Reservation } from "../entities/Reservation";
import { Rating } from "../entities/Rating";
import bcrypt from "bcrypt";

//custom datatypes to verify user input
export interface UserType {
  matricule: string;
  password: string;
  matricule_bac: string;
  cle_secrete: string;
}
export interface PointOfInterestDataType {
  titre: string;
  latitude: number;
  longitude: number;
  details: string[];
  contact_info: string | "";
  cover: string[];
  floors: boolean;
}
export interface StudentType {
  first_name: string;
  last_name: string;
  field: string;
  birth_date: string;
  email: string;
  phone_number: number;
  cle_secrete: string;
  matricule_bac: string;
}
export interface RatingType {
  textbook_id: number;
  user_id: number;
  rating: number;
}

/**
 * Function that creates & saves a student
 */
export const createAndSaveStudent = async (input: StudentType) => {
  try {
    const newStudent = new Student();
    const studentRepo: Repository<Student> = getRepository(Student);

    //asigning values to the new instance
    newStudent.first_name = input.first_name;
    newStudent.last_name = input.last_name;
    newStudent.birth_date = new Date(input.birth_date);
    newStudent.cle_secrete = input.cle_secrete;
    newStudent.email = input.email;
    newStudent.field = input.field;
    newStudent.phone_number = input.phone_number;
    newStudent.matricule_bac = input.matricule_bac;

    const createdStudent = await studentRepo.save(newStudent);
    return createdStudent;
  } catch (error) {
    console.log(
      "error while creating the student instance db_manager.ts",
      error
    );
    return undefined;
  }
};

/**
 * Function that creates & saves a user instance
 * @param u : User
 * @param studentId : Student instance
 * @param repo : Reopsitory
 * @returns new User's Id | undefined
 */
export const createAndSaveUser = async (
  u: UserType,
  studentId: Student
): Promise<number | undefined> => {
  try {
    const user: User = new User();

    user.cle_secrete = u.cle_secrete;
    user.matricule = u.matricule;
    user.matricule_bac = u.matricule_bac;
    user.password = await bcrypt.hash(u.password, 10);
    user.student_id = studentId;

    const created_user = await getRepository(User).save(user);
    return created_user.id;
  } catch (error) {
    return undefined;
  }
};
/**
 * Function that creates and saves a point of interest
 * @param poi : Point of interest
 * @param repo : Repository
 * @returns Point of interest instance | undefined
 */
export const createAndSavePointOfInterest = async (
  poi: PointOfInterestDataType,
  repo: Repository<PointOfInterest>
): Promise<string | boolean | undefined> => {
  try {
    const newPoint: PointOfInterest = new PointOfInterest();

    //assinging the values to create a new point of interest
    newPoint.titre = poi.titre;
    newPoint.latitude = poi.latitude;
    newPoint.longitude = poi.longitude;
    newPoint.details = poi.details;
    newPoint.contact_info = poi.contact_info;
    newPoint.cover = poi.cover;
    newPoint.icon = "college";
    newPoint.floors = poi.floors;

    const newCreatedPoint: PointOfInterest = await repo.save(newPoint);
    //return a false boolean value to indicate failure of adding a new point of interest
    if (!newCreatedPoint) return false;

    return newCreatedPoint.titre;
  } catch (error) {
    return undefined;
  }
};
/**
 *
 * @param instructor
 * @param repo
 * @returns
 */
export const createAndSaveInstructor = async (
  instructor: InstructorDataType,
  repo: Repository<Instructor>
): Promise<Instructor | undefined> => {
  try {
    const newInstructor = new Instructor();

    newInstructor.first_name = instructor.first_name;
    newInstructor.last_name = instructor.last_name;
    newInstructor.email = instructor.email;
    newInstructor.field = instructor.field;
    newInstructor.rank = instructor.rank;

    const seededInstance = await repo.save(newInstructor);
    return seededInstance;
  } catch (error) {
    return undefined;
  }
};

/**
 * Function which creates & saves a textbook
 * @param textbook
 * @param repo
 * @returns
 */
export const createAndSaveTextbook = async (
  textbook: TextbookDataType,
  repo: Repository<Textbook>
): Promise<Textbook | undefined> => {
  try {
    const newTextbook = new Textbook();
    newTextbook.title = textbook.title;
    newTextbook.author = textbook.author;
    newTextbook.categories = textbook.categories;
    newTextbook.cover_image_link = textbook.cover_image_link
      ? textbook.cover_image_link
      : "";
    newTextbook.desc = textbook.desc ? textbook.desc : "";
    newTextbook.nb_copies = textbook.nb_copies;
    newTextbook.page_count = textbook.page_count;
    newTextbook.field = textbook.field;

    const newlyCreatedTextbook = await repo.save(newTextbook);
    return newlyCreatedTextbook;
  } catch (error) {
    console.log("Failed to seed the textbook instance", error);
    return undefined;
  }
};

/**
 * Function which creates saves a reservation
 * @param user_id
 * @param textbook_id
 * @param repo
 * @param textbookRepo
 * @param nbcopies
 * @returns
 */
export const createAndSaveReservation = async (
  user: User,
  textbook_id: number,
  nbcopies: number
): Promise<Reservation | undefined> => {
  try {
    const txt = await getRepository(Textbook).findOne({
      where: { id: textbook_id },
    });

    const cRes = await getRepository(Reservation).save({
      textbooks: txt,
      user: user,
    });

    //decrement the number of the copies of the textbook
    await getRepository(Textbook).update(
      { id: textbook_id },
      { nb_copies: nbcopies - 1 }
    );
    return cRes;
  } catch (error) {
    console.log(error);
    return undefined;
  }
};

/**
 * Function which creates a new Rating for x user.
 */
export const createAndSaveRating = async (
  input: RatingType
): Promise<Rating | undefined> => {
  try {
    const newRating = new Rating();
    const found_textbook = await getRepository(Textbook).findOne({
      where: { id: input.textbook_id },
    });
    const found_user: User | undefined = await getRepository(User).findOne({
      where: { id: input.user_id },
    });

    newRating.textbooks = found_textbook!;
    newRating.user = found_user!;
    newRating.rating = input.rating;

    return await getRepository(Rating).save(newRating);
  } catch (error) {
    console.log("Error while creating the rating ");
    return undefined;
  }
};
