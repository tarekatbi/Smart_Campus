import { RequestHandler, Request, Response } from "express";
import { Textbook } from "../entities/Textbook";
import { getRepository, In } from "typeorm";
import Recommender from "../services/recommender";
import { User } from "../entities/User";
const recommender: Recommender = new Recommender();

export const recommenderSys: RequestHandler = async (
  req: Request,
  res: Response
) => {
  try {
    const user: User | undefined = res.locals.user;
    const generated_recommendations: Set<number> | undefined =
      await recommender.collaborative_filtering(user!.id);

    console.log("the generated recommendations");
    console.log(generated_recommendations);
    //fetch the textbooks
    const data: Textbook[] = await getRepository(Textbook).find({
      where: { id: In([...generated_recommendations!]) },
      take: 5,
    });
    if (!data)
      return res
        .status(404)
        .json({ error: "Couldn't find any recommendations" });
    return res.status(200).json({ data });
  } catch (error) {
    console.log(error);
    return res.status(500).json({ error: "Server route - Recommendations" });
  }
};
