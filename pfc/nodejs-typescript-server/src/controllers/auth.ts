import { Request, RequestHandler, Response } from "express";
import { EntityManager, getManager, Repository, getRepository } from "typeorm";
import { Student } from "../entities/Student";
import { User } from "../entities/User";
import { assertStudent, assertUser } from "../helpers/assertUser";
import bcrypt from "bcrypt";
import { createAndSaveUser } from "../services/db_manager";
import "express-session";
const jwt = require("jsonwebtoken");
declare module "express-session" {
  interface SessionData {
    user_id: number;
  }
}
interface UserBody {
  matricule: string;
  password: string;
  matricule_bac: string;
  cle_secrete: string;
}

interface UserType {
  id: number;
  password: string;
  matricule_bac: string;
  cle_secrete: string;
  created_at: Date;
  updated_at: Date;
  student_id: Student;
}

export const register: RequestHandler = async (req: Request, res: Response) => {
  try {
    const userRepo: Repository<User> = getRepository(User);
    if (!assertUser(req)) return res.status(404).json("Invalid values");
    const { matricule, matricule_bac, password, cle_secrete }: UserBody =
      req.body;

    //verify if the user already exists
    const userExists: User | undefined = await getRepository(User).findOne(
      {
        matricule,
      },
      { relations: ["student_id"] }
    );
    if (userExists)
      return res.status(402).json({
        msg: `User -${userExists.student_id.last_name}- already exists`,
      });

    const student = await getRepository(Student).findOne({
      where: { id: matricule },
    });

    if (!student)
      return res
        .status(404)
        .json({ msg: `Student with ID : ${matricule} does not Exist` });
    else {
      if (!assertStudent(req.body.cle_secrete, student.cle_secrete))
        return res.status(401).json({ msg: "access denied wrong secret key" });

      //hashing the password of the user
      const hashed_password: string = await bcrypt.hash(req.body.password, 10);

      const new_user: number | undefined = await createAndSaveUser(
        {
          matricule,
          matricule_bac,
          password: hashed_password,
          cle_secrete,
        },
        student
      );

      //creating a session for the user once they've registered
      req.session.user_id = new_user ? new_user : 0;

      return res.status(200).json({
        msg: `User - ${student.first_name} has been created `,
        new_user,
      });
    }
  } catch (error) {
    console.log("Error has occured while registering the user, ", error);
    return res.status(500).json({ msg: "Server Error - Register Route" });
  }
};
export const login: RequestHandler = async (req: Request, res: Response) => {
  const { matricule, password } = req.body;

  //check if the user exists in the table of the users
  const user: User | undefined = await getRepository(User).findOne(
    { matricule },
    { relations: ["student_id"] }
  );
  console.log(user);
  if (!user) {
    return res.status(404).json({ msg: "user was not found" });
  }

  //check if the password matches
  const isCorrectPassword: boolean = await bcrypt.compare(
    password,
    user.password
  );

  if (!isCorrectPassword)
    return res.status(401).json({ msg: "Wrong password" });

  //generate a new session for the user
  req.session.user_id = user.id;
  const token = jwt.sign({ id: user.id }, "secretKey");
  return res.status(200).json({
    msg: `Utilisateur - ${user.student_id.last_name} a été connecté avec succès`,
    token,
  });
};

export const logout: RequestHandler = (req: Request, res: Response) => {
  //destroying the session of the user
  req.session.destroy((err) => {
    if (err) return res.status(500).json({ msg: "Error while logging out" });

    return res.status(200).json({ msg: "You've been logged out successfully" });
  });
};

//     //else send an email with the verification code to the user
//     const code = Math.floor(Math.random() * 4000 + 1000);

//     //creating the base email sender
//     const transporter = nodemailer.createTransport({
//       service: "gmail",
//       auth: {
//         user: process.env.DEV_EMAIL,
//         pass: process.env.DEV_PASSWORD,
//       },
//     });

//     //sending the email to the user with the verification code
//     const mailOptions = {
//       from: process.env.DEV_MAIL,
//       to: req.body.email,
//       subject: "Reset your password ",
//       text: `Please enter this verification code`,
//       html: `<h1>iCampus App</h1><br><h3>You have been prompted to reset your password</h3><br>Please enter this verification code <strong>${code}</strong>`,
//     }; //testing if the email has been sent successfully
//     const response = await transporter.sendMail(mailOptions);

//     if(!response) return res.status(404).json({msg : "Error while sending the email with Nodemailer"})

//     } catch (error) {
//       return res.status(500).json({msg : "Error with reset password Route"})
//     }
//   }
// };
