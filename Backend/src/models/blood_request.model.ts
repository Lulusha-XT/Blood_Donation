import mongoose, { Model, Schema, Document } from "mongoose";

interface IBloodRequest {
  bloodType: string;
  reason: string;
  unitRequired: number;
  deadLine: string;
  hospital: string;
  personInCharge: string;
  contactNumber: string;
  patientName: string;
  userId: string;
}
interface IBloodRequestDocument extends IBloodRequest, Document {
  requestId: string;
}

const bloodRequestSchema = new Schema<IBloodRequestDocument>(
  {
    bloodType: { type: String, required: true },
    reason: { type: String, required: true, unique: true },
    unitRequired: { type: Number, required: true },
    deadLine: { type: String, required: true },
    hospital: { type: String, required: true },
    contactNumber: { type: String },
    patientName: { type: String },
    userId: { type: String },
  },
  {
    timestamps: true,
    toJSON: {
      transform: (_doc, ret) => {
        ret.requestId = ret._id.toString();
        delete ret._id;
        delete ret.__v;
      },
    },
  }
);

const BloodRequest: Model<IBloodRequestDocument> =
  mongoose.model<IBloodRequestDocument>("BloodRequest", bloodRequestSchema);

export { IBloodRequest, IBloodRequestDocument, BloodRequest };
