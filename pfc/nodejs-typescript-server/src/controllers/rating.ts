import { Request, Response } from "express";
import { Textbook } from "../entities/Textbook";
import { User } from "../entities/User";
import { createAndSaveRating, RatingType } from "../services/db_manager";
import { Rating } from "../entities/Rating";
import { getRepository } from "typeorm";

/**
 * Leave a rating to a specified textbook
 */
export const leaveRating = async (req: Request, res: Response) => {
  try {
    //find the book by its id
    const textbook_id: number = parseInt(req.params.id);
    const rating_input: RatingType = {
      textbook_id,
      user_id: parseInt(res.locals.user_id),
      rating: parseInt(req.body.rating),
    };
    const new_rate: Rating | undefined = await createAndSaveRating(
      rating_input
    );
    if (!new_rate)
      return res.status(404).json({ error: `Failed to create the new rating` });

    return res.status(200).json({ message: "Rating created successfully " });
  } catch (error) {
    console.log(error);
    return res
      .status(500)
      .json({ error: "Server error - Cannot leave rating-" });
  }
};

export const isRated = async (req: Request, res: Response) => {
  try {
    const textbook: Textbook | undefined = await getRepository(
      Textbook
    ).findOne({ where: { id: parseInt(req.params.id) } });
    const isRated: Rating | undefined = await getRepository(Rating).findOne({
      where: {
        user: res.locals.user,
        textbooks: textbook,
      },
    });
    if (isRated != undefined) {
      return res.status(200).json({ rating: isRated.rating });
    }
    return res.status(404).json({ msg: "Textbook has not been rated" });
  } catch (error) {
    console.log(error);
    return res.status(500);
  }
};
