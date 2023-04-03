import { Request, RequestHandler, Response } from "express";
import { getRepository } from "typeorm";
import { User } from "../entities/User";

export const getAllTheUsers: RequestHandler = async (
  req: Request,
  res: Response
): Promise<Response> => {
  const all_users: User[] = await getRepository(User).find({
    relations: ["student_id"],
  });
  if (!all_users)
    return res.status(404).json({ msg: "cannot find any users " });
  return res.status(200).json({ all_users });
};
