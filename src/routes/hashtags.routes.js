import { Router } from "express";
import {
  getTrending,
  getHashtagPosts,
} from "../controllers/hashtagsController.js";
import { hashtagSchema } from "../schemas/hashtag.schemas.js";
import { validateHashtag } from "../middlewares/validateHashtag.js";

const hashtagsRouter = Router();

hashtagsRouter.get("/trending", getTrending);
hashtagsRouter.get(
  "/hashtag/:hashtag",
  validateHashtag(hashtagSchema),
  getHashtagPosts
);

export default hashtagsRouter;
