import express, { Request, Response } from "express";
import connectDB from "./config/db.connect";
import morgan from "morgan";
import errorHandler from "./middlewares/errors";
import path from "path";

const app: express.Application = express();
const address: string = "8080";

// Setting
app.set("port", process.env.PORT || address);

// Middlewares
app.use(morgan("dev"));
app.use(express.json);

// Routes
// app.use("/api");

// Error handler
app.use(errorHandler);

app.get("/", function (req: Request, res: Response) {
  res.send("Hello World!");
});

// Public
app.use("uploads", express.static(path.resolve("uploads")));

// Server Starter
(async () => {
  try {
    await connectDB();
    app.listen(app.get("port"));
    console.log(`Server is running on port ${app.get("port")}`);
  } catch (error) {
    console.log(error);
  }
})();

// app.listen(3000, function () {
//   console.log(`starting app on: ${address}`);
// });
