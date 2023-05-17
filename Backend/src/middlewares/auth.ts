import { Request, Response, NextFunction } from "express";
import jwt, { Secret } from "jsonwebtoken";
import { IUser } from "../models/user.model";
import dotenv from "dotenv";

dotenv.config();
const secret: Secret = process.env.TOKEN_SECRET as Secret;

interface IRequest extends Request {
  user?: IUser;
  file?: Express.Multer.File; // Adjust the type based on your file object structure
}

const verifyToken = (req: IRequest, res: Response, next: NextFunction) => {
  const authHeader = req.headers["authorization"];
  const token = authHeader && authHeader.split(" ")[1];
  console.log(token);

  if (!token) return res.status(403).send({ message: "No Token Provided" });

  try {
    const decodedToken = jwt.verify(token, secret) as IUser;
    console.log("Print Message", decodedToken);
    req.user = decodedToken;
    next();
  } catch (error) {
    res.status(401).send({ message: "Unauthorized" });
  }
};

const assignAccessToken = (user: IUser): string => {
  const expiresIn = "1h";
  const userObject = JSON.parse(JSON.stringify(user));
  return jwt.sign(userObject, secret, { expiresIn });
};

export { verifyToken, assignAccessToken };
