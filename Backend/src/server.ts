import express, { Request, Response } from "express";
import connectDB from "./config/db.connect";
import morgan from "morgan";
import errorHandler from "./middlewares/errors";

const app: express.Application = express();
const address: string = "127.0.0.1:3000";

// Setting
app.set("port", process.env.PORT || address);

// Middlewares
app.use(morgan("dev"));
app.use(express.json);

// Error handler
app.use(errorHandler);

app.get("/", function (req: Request, res: Response) {
  res.send("Hello World!");
});

// Server Starter
async () => {
  try {
    await connectDB();
    app.listen(app.get("port"));
    console.log(`Server is running on port ${app.get("port")}`);
  } catch (error) {
    console.log(error);
  }
};

// app.listen(3000, function () {
//   console.log(`starting app on: ${address}`);
// });
