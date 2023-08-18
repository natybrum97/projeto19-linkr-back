import { Router } from "express";
import likesRouter from "./likes.routes.js";
import postsRouter from "./posts.routes.js";
import usersRouter from "./users.routes.js";
import hashtagsRouter from "./hashtags.routes.js";

const indexRouter = Router();
indexRouter.use(usersRouter, postsRouter, likesRouter, hashtagsRouter);

export default indexRouter;
