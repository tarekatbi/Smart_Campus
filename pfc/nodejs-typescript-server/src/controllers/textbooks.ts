import { RequestHandler, Request, Response } from "express";
import {
  createQueryBuilder,
  getConnection,
  getRepository,
  In,
  Repository,
} from "typeorm";
import { Student } from "../entities/Student";
import { User } from "../entities/User";
import { Textbook } from "../entities/Textbook";
import { Reservation } from "../entities/Reservation";
import { createAndSaveReservation } from "../services/db_manager";

// session data declaration
declare module "express-session" {
  export interface SessionData {
    user: number;
  }
}
/**
 * Function which fetches for the reserved books by the student
 * @param req : Request
 * @param res : Resoponse
 * @returns
 */
export const reservedTextbooks: RequestHandler = async (
  req: Request,
  res: Response
): Promise<Response> => {
  try {
    //access the user's id from the session
    const user: User | undefined = res.locals.user;
    //search for their presence in the reserved table
    const studentReservations: Reservation[] = await getRepository(
      Reservation
    ).find({
      where: { user },
      relations: ["textbooks"],
    });

    // return no books has been reserved otherwise
    if (!studentReservations) return res.status(404);

    //return the reserved books
    return res.status(200).json({ data: studentReservations });
  } catch (error) {
    console.log(error);
    return res.status(500);
  }
};

/**
 * Function that fetches all the textbooks
 * @param req
 * @param res
 * @returns
 */
export const getAllTextbooks = async (
  req: Request,
  res: Response
): Promise<Response> => {
  try {
    const textbookList: Textbook[] = await getRepository(Textbook).find({});
    return res.status(200).json({ textbookList });
  } catch (error) {
    console.log(error);
    return res.status(500);
  }
};

/**
 * Function that fetches a specific textbook by its ID
 * @param req Request
 * @param res response
 * @returns JSON
 */
export const isReserved = async (req: Request, res: Response) => {
  try {
    const id = parseInt(req.params.textBookId);

    const textbook: Textbook | undefined = await getRepository(
      Textbook
    ).findOne({ where: { id } });
    //find the specific textbook
    const reserved_textbook: Reservation | undefined = await getRepository(
      Reservation
    ).findOne({
      where: { user: res.locals.user!, textbooks: textbook },
    });
    if (reserved_textbook != undefined)
      return res.status(200).json({ hasBeenReserved: true });
    return res.status(404).json({ hasBeenReserved: false });
  } catch (error) {
    console.log(error);
    return res.status(500);
  }
};

/**
 * Function which creates a reservation by the the current logged in user
 * @param req
 * @param res
 */
export const postReservation = async (req: Request, res: Response) => {
  try {
    const id: number = parseInt(req.params.textBookId);
    //find the textbook by its id
    const foundTextbook: Textbook | undefined = await getRepository(
      Textbook
    ).findOne({
      where: { id },
    });
    //check if number of copies != 0
    if (foundTextbook?.nb_copies === 0) {
      return res.status(400).json({ msg: "No copies left to be reserved" });
    }

    // create new reservation of the book by the user and decrement the number of copies
    else {
      const createdReservation = await createAndSaveReservation(
        res.locals.user!,
        id,
        foundTextbook!.nb_copies
      );
      if (!createdReservation)
        return res.status(404).json({ error: "Could not reserve the book" });
      return res.status(200).json({ msg: "reservation made successfully" });
    }
    // else return a 404 status : all the copies are reserved 1
  } catch (error) {
    console.log(error);
    res.status(500);
  }
};

/**
 * Function that retreives specified textbook from the database using its ID
 */
export const getOneTextbook = async (
  req: Request,
  res: Response
): Promise<Response> => {
  try {
    const textbook_id: number = parseInt(req.params.textbook_id);
    const found_textbook: Textbook | undefined = await getRepository(
      Textbook
    ).findOne({
      where: { id: textbook_id },
    });

    //checking if the textbook was found
    if (!found_textbook)
      return res
        .status(404)
        .json({ message: `Textbook with ID :${textbook_id} was not found` });
    return res.status(200).json({ found_textbook });
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ error: "Server error while fetching the textbook" });
  }
};

/***
 * Function that retreives most reserved textbooks
 */

export const similarBytag = async (req: Request, res: Response) => {
  //SELECT campus_univ.reservation.textbook_id,Count(campus_univ.reservation.textbook_id) FROM campus_univ.reservation group by campus_univ.reservation.textbook_id;
  try {
    const tags = req.params.tag;
    console.log(tags);
    const similarBytag = await getRepository(Textbook).find({
      where: { categories: In([tags]) },
      take: 3,
    });
    console.log(similarBytag);

    return res.status(200).json({ data: similarBytag });
  } catch (error) {
    console.log(error);
    return res.status(500).json({ error: "Server error - popular route" });
  }
};
