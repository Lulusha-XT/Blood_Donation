import express from "express";
import userRoutes from "./apis/user.routes";
import bloodRequestRoutes from "./apis/blood_request.routes";
import donationRoutes from "./apis/donation.routes";

const router: express.Router = express.Router();

router.use("/user", userRoutes);
router.use("/bloodRequest", bloodRequestRoutes);
router.use("/donate", donationRoutes);

export default router;
