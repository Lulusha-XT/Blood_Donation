import express from "express";
import userRoutes from "./apis/user.routes";
const router: express.Router = express.Router();

router.use("/user", userRoutes);

export default router;
