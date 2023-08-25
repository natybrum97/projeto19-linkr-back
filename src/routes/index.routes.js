import { Router } from "express";
import followsRouter from "./follows.routes.js";
import hashtagsRouter from "./hashtags.routes.js";
import likesRouter from "./likes.routes.js";
import postsRouter from "./posts.routes.js";
import usersRouter from "./users.routes.js";
import commentsRouter from "./comments.routes.js";

const indexRouter = Router();
indexRouter.use(
  usersRouter,
  postsRouter,
  likesRouter,
  hashtagsRouter,
  followsRouter,
  commentsRouter
);

export default indexRouter;
