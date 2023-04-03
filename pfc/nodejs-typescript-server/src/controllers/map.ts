import { Request, Response, NextFunction } from "express";
import geoJsonData from "../data/campus_map.json";
import { getRepository } from "typeorm";
import { PointOfInterest } from "../entities/Point_of_interest";
import {
  createAndSavePointOfInterest,
  PointOfInterestDataType,
} from "../services/db_manager";

//POI : points of interest
// refactor get repository
//TODO: add comments to this section

export const campusMapGeoJson = (req: Request, res: Response): Response => {
  return res.status(200).json(geoJsonData["features"][0]["geometry"]);
};

export const getAllPoi = async (
  req: Request,
  res: Response
): Promise<Response> => {
  try {
    const poisRepo = getRepository(PointOfInterest);
    //TODO: fetch all the points of interest and return them
    const pointsOfInterest: PointOfInterest[] = await poisRepo.find({});
    //if the data is corrupted
    if (!pointsOfInterest)
      return res.status(404).json({ msg: "error while fetching the data" });

    return res.status(200).json({ data: pointsOfInterest });
  } catch (error) {
    console.log("Error while fetching the points of interest");
    return res.status(500).json({ msg: "Server error" });
  }
};

export const searchPointOfInterest = async (
  req: Request,
  res: Response
): Promise<Response> => {
  try {
    const poisRepo = getRepository(PointOfInterest);

    const userInput: string = req.body.information;

    //search for the Point and return the found result
    const point: PointOfInterest | undefined = await poisRepo.findOne({
      where: { information: userInput },
    });

    if (!point)
      return res
        .status(404)
        .json({ msg: `${userInput} does not exist on the campus map0` });

    return res.status(200).json({ data: point });
  } catch (error) {
    console.log("Error while fetching the points of interest");
    return res.status(500).json({ msg: "Server error" });
  }
};

export const addMarkerPoint = async (req: Request, res: Response) => {
  try {
    const poisRepo = getRepository(PointOfInterest);

    const body: PointOfInterestDataType = req.body;
    console.log(req.body);
    const newPointOfinterset: string | boolean | undefined =
      await createAndSavePointOfInterest(body, poisRepo);

    //verify if the point has been added successfully
    if (!newPointOfinterset)
      return res
        .status(404)
        .json({ msg: "could not create the new point of interest" });

    return res
      .status(200)
      .json({ msg: `${newPointOfinterset} has been added successfully` });
  } catch (error) {
    //error handler
    console.log("Error while adding the new marker");
    console.log(error);
    return res.status(500).json({ msg: "Server error" });
  }
};
