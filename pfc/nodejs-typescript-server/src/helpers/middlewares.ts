import { NextFunction, Request, Response } from "express";
import { Result, ValidationError, validationResult } from "express-validator";
import { User } from "../entities/User";
import { getManager, getRepository } from "typeorm";
const jwt = require("jsonwebtoken");

declare module "express-session" {
  export interface Session {
    user: { user_id: number };
  }
}

export default class Helper {
  constructor() {}

  //middleware to verify if the user is logged in or not
  public isAuth() {
    return async (req: Request, res: Response, next: NextFunction) => {
      if (req.headers.token) {
        const verify = jwt.decode(req.headers.token, "secretKey");
        const user: User | undefined = await getRepository(User).findOne({
          where: { id: verify.id },
        });
        if (!user)
          return res.status(404).json({ msg: "L’utilisateur n’existe pas" });
        else {
          res.locals.user_id = verify.id;
          res.locals.user = user;
          next();
        }
      } else
        return res
          .status(401)
          .json({ msg: "Accès refusé - Utilisateur non connecté" });
    };
  }
  public inputValidator() {
    return (req: Request, res: Response, next: NextFunction) => {
      const result: Result<ValidationError> = validationResult(req);
      if (!result.isEmpty())
        return res.status(404).json({ errors: result["errors"] });
      next();
    };
  }
}
