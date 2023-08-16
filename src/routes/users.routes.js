import { Router } from "express";
import { postLogin, postSignUp } from "../controllers/users.controller.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import { schemaLogin, schemaSignUp } from "../schemas/users.schemas.js";

const usersRouter = Router();

usersRouter.post("/signup", validateSchema(schemaSignUp), postSignUp );
usersRouter.post("/signin", validateSchema(schemaLogin), postLogin);

export default usersRouter;