import { Router } from "express";
import { getUserPosts, postLogin, postSignUp } from "../controllers/users.controller.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import { schemaLogin, schemaSignUp } from "../schemas/users.schemas.js";
import { validateAuth } from "../middlewares/validateAuth.js";

const usersRouter = Router();

usersRouter.post("/signup", validateSchema(schemaSignUp), postSignUp );
usersRouter.post("/signin", validateSchema(schemaLogin), postLogin);
usersRouter.get("/user/:id", validateAuth, getUserPosts)

export default usersRouter;