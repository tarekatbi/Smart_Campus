import { Router } from "express";
import {
  getAllTextbooks,
  isReserved,
  postReservation,
  getOneTextbook,
  reservedTextbooks,
  similarBytag,
} from "../controllers/textbooks";
import Helper from "../helpers/middlewares";
const router: Router = Router();
const helperInstance: Helper = new Helper();
//TODO: add authentication middleware & controllers later on

// @route   POST api/textbooks/:textbookId/reserve
// @desc    reserve the specified textbook
// @access  Private
router.post("/:textBookId/reserve", helperInstance.isAuth(), postReservation);

// @route   GET api/textbooks/reserved_textbooks
// @desc    return the textbooks reserved by the student
// @access  Private
router.get(
  "/reserved_textbooks/:textBookId",
  helperInstance.isAuth(),
  isReserved
);
router.get("/reserved_textbooks", helperInstance.isAuth(), reservedTextbooks);

// @route   GET api/textbooks/all
// @desc    returns all the textbooks
// @access  Private
router.get("/all", getAllTextbooks);

// @route   GET api/textbooks/popular
// @desc    return the specified textbook
// @access  Private
router.get("/similar/:tag", similarBytag);

// @route   GET api/textbooks/:textbook_id
// @desc    returns the specified textbook
// @access  Private
router.get("/:textbook_id", getOneTextbook);

export default router;
