import express, { Router } from "express";
import { getAllTheUsers } from "../controllers/users";
import Helper from "../helpers/middlewares";
const helperInstance = new Helper();
const router: Router = express.Router();

// @route   GET api/users/
// @desc    get al the users
// @access  Private
router.get("/", helperInstance.isAuth(), getAllTheUsers);

export default router;
