
import { Router } from "express";
import Helper from "../helpers/middlewares";
import {
  campusMapGeoJson,
  getAllPoi,
  addMarkerPoint,
} from "../controllers/map";

const helperInstance: Helper = new Helper();
const router: Router = Router();

// @route   GET api/map/map_data
// @desc    return the data of the campus map
// @access  public
router.get("/map_data", campusMapGeoJson);

// @route   GET api/map/get_points
// @desc    return all the points of interest
// @access  public

router.get("/get_points", getAllPoi);

//TODO: add the isLoggedIn middleware in here
// @route   add api/map/new_point
// @desc    add a new point of interest ( to be validated by the admin)
// @access  Private
router.post("/add_marker", helperInstance.isAuth(), addMarkerPoint);


export default router;
