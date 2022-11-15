import express from "express";
import { UserController } from "./app/controllers/UserController";
const userController = new UserController();

const router = express.Router();

router.post("/user", userController.store);

export { router };