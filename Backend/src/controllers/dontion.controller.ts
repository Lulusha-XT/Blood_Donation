import { Request, Response, Router } from "express";
import { Types } from "mongoose";
import { IBloodDonation } from "../models/donation.model";
import * as bloodDonations from "../services/dontion.service";
import { IRequest } from "../interface/user.interface";

async function createBloodDonation(
  req: IRequest,
  res: Response
): Promise<void> {
  try {
    const { acceptor, requestId, donor } = req.body;
    const bloodDonation: IBloodDonation = {
      donor,
      acceptor,
      requestId,
    };
    const savedBloodDonation = await bloodDonations.createBloodDonation(
      bloodDonation
    );
    res.json({ message: "Success", data: savedBloodDonation });
  } catch (err) {
    console.error(err);
    res.status(500).send("Internal Server Error");
  }
}
const getBloodDonations = async (
  req: Request,
  res: Response
): Promise<void> => {
  try {
    const listBloodDonation = bloodDonations.getAllBloodDonations();
    res.status(200).json(listBloodDonation);
  } catch (err) {
    console.error(err);
    res.status(500).send("Internal Server Error");
  }
};

const donation_routes = (router: Router) => {
  router.get("/", getBloodDonations);
  router.post("/", createBloodDonation);
};

export default donation_routes;
