import { Router } from "express";
import { getUserPosts, getUsersByName, postLogin, postSignUp } from "../controllers/users.controller.js";
import { validateAuth } from "../middlewares/validateAuth.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import { schemaLogin, schemaSignUp } from "../schemas/users.schemas.js";

const usersRouter = Router();

usersRouter.post("/signup", validateSchema(schemaSignUp), postSignUp );
usersRouter.post("/signin", validateSchema(schemaLogin), postLogin);
usersRouter.get("/user/:id", validateAuth, getUserPosts);
usersRouter.get("/search-users", validateAuth, getUsersByName);

export default usersRouter;