import { Router } from "express";
import {validateSchema} from "../middlewares/validateSchema.js";
import { postLogin, postSignUp } from "../controllers/users.controller.js";
import { schemaLogin, schemaSignUp } from "../schemas/users.schemas.js";

const usersRouter = Router();

usersRouter.post("/signup", validateSchema(schemaSignUp), postSignUp );
usersRouter.post("/signin", validateSchema(schemaLogin), postLogin);

export default usersRouter;