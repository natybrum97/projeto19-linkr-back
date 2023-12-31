import { Router } from "express";
import { getFollow, getfollowedByMe, postFollow } from "../controllers/followsController.js";
import { validateAuth } from "../middlewares/validateAuth.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import { followSchema } from "../schemas/follow.schemas.js";

const followsRouter = Router();

followsRouter.post("/follow", validateAuth, validateSchema(followSchema), postFollow);
followsRouter.get("/follow/:idFollowed", validateAuth, getFollow);
followsRouter.get("/followedByMe", validateAuth, getfollowedByMe);

export default followsRouter;