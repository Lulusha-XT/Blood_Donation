import { BloodDonationModel, IBloodDonation } from "../models/donation.model";

export const createBloodDonation = async (
  bloodDonation: IBloodDonation
): Promise<IBloodDonation> => {
  try {
    const newBloodDonation = new BloodDonationModel(bloodDonation);
    const savedBloodDonation = await newBloodDonation.save();
    return savedBloodDonation;
  } catch (err) {
    console.error(err);
    throw err;
  }
};

export const getAllBloodDonations = async (): Promise<IBloodDonation[]> => {
  try {
    const bloodDonations = await BloodDonationModel.find().populate(
      "donor acceptor"
    );
    return bloodDonations;
  } catch (err) {
    console.error(err);
    throw err;
  }
};
