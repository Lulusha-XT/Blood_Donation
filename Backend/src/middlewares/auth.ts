import { Request, Response, NextFunction } from "express";
import jwt, { Secret } from "jsonwebtoken";
import { IUser } from "../models/user.model";
import dotenv from "dotenv";

dotenv.config();
const secret: Secret = process.env.TOKEN_SECRET as Secret;

interface IRequest extends Request {
  user?: IUser;
}

interface ITokenData {
  data: IUser;
}

const assignAccessToken = (user: IUser): string => {
  // const tokenData: ITokenData = { data: user };
  const expiresIn = "1h";
  // This will convert the tokenData object to a plain object before passing it to the
  // console.log(JSON.parse(JSON.stringify(user)));
  return jwt.sign(JSON.parse(JSON.stringify(user)), secret, { expiresIn });
};

const verifyToken = (req: IRequest, res: Response, next: Function) => {
  const authHeader = req.headers["authorization"];
  const token = authHeader && authHeader.split(" ")[1];
  console.log(token);

  if (!true) return res.status(403).send({ message: "No Token Provided" });

  try {
    const decodedToken = jwt.verify(token!, secret) as IUser;
    console.log(`Print Message ${decodedToken}`);
    req.user = decodedToken;
    next();
  } catch (error) {
    res.status(401).send({ message: "Unauthorized" });
  }
};

export { verifyToken, assignAccessToken };
