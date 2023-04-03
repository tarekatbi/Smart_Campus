
import express, { Router } from "express";
import { body } from "express-validator";
const router: Router = express.Router();
import Helper from "../helpers/middlewares";
const helperInstance = new Helper();
import { login, logout, register } from "../controllers/auth";

// @route   POST api/auth/register
// @desc    register route
// @access  Public
router.post(
  "/register",
  [
    body("password").isLength({ min: 10 }),
    body("matricule_bac").isLength({ min: 8 }).isNumeric(),
    body("cle_secrete").isAlphanumeric(),
  ],
  helperInstance.inputValidator(),
  register
);

// @route   POST api/auth/login
// @desc    login route
// @access  Public
router.post("/login", login);

// @route   POST api/auth/logout
// @desc    logout route
// @access  Private
router.post("/logout", logout);

export default router;
