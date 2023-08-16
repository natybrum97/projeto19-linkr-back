import { Router } from "express";
import likesRouter from "./likes.routes.js";
import postsRouter from "./posts.routes.js";
import usersRouter from "./users.routes.js";

const indexRouter = Router();
indexRouter.use(usersRouter, likesRouter, postsRouter);

export default indexRouter;