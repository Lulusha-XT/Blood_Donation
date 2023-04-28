import { Schema, Document, Types, model } from "mongoose";
import { IBloodRequest } from "./blood_request.model";
import { IUser } from "./user.model";

interface IBloodDonation {
  donor: IUser;
  acceptor: IUser;
  requestId: IBloodRequest;
}

interface IBloodDonationDocumnet extends IBloodDonation, Document {
  donationId: string;
}
const bloodDonationSchema = new Schema<IBloodDonationDocumnet>(
  {
    donor: {
      type: Schema.Types.ObjectId,
      ref: "User",
      required: true,
    },
    acceptor: {
      type: Types.ObjectId,
      ref: "User",
      required: true,
    },
    requestId: {
      type: Schema.Types.ObjectId,
      ref: "BloodRequest",
      required: true,
    },
  },
  {
    timestamps: true,
    toJSON: {
      transform: (_doc, ret) => {
        ret.donationId = ret._id.toString();
        delete ret._id;
        delete ret.__v;
      },
    },
  }
);

const BloodDonationModel = model<IBloodDonation>(
  "BloodDonation",
  bloodDonationSchema
);

export { IBloodDonation, BloodDonationModel };
