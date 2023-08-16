import express from "express";
import cors from "cors";
import router from "./routes/index.routes.js";
import LikeRoutes from "./routes/likes.routes.js";

const app = express();

app.use(cors());
app.use(express.json());
app.use(router);
app.use("/", LikeRoutes);

const port = process.env.PORT || 5000;
app.listen(port, () =>
  console.log(`O servidor está rodando na porta ${port}!`)
);
