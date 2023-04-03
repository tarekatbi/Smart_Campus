import { Router } from "express";
import { isRated, leaveRating } from "../controllers/rating";
import { recommenderSys } from "../controllers/library_rec_system";
import Helper from "../helpers/middlewares";
const helperInstance = new Helper();
const router: Router = Router();

// @route   GET api/recommender/
// @desc    return list of recommended textbooks
// @access  Private
router.get("/", helperInstance.isAuth(), recommenderSys);
// @route   POST api/recommender/:id/isRated
// @desc    rate the specified textbook /10
// @access  Private
router.get("/isRated/:id", helperInstance.isAuth(), isRated);

// @route   POST api/recommender/:id/rate
// @desc    rate the specified textbook /10
// @access  Private
router.post("/:id/rate", helperInstance.isAuth(), leaveRating);

export default router;
