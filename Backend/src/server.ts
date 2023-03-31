import express, { Request, Response } from "express";
import connectDB from "./config/db.connect";
import morgan from "morgan";
import errorHandler from "./middlewares/errors";
import path from "path";
import indexRoutes from "./routes/index";

const app: express.Application = express();
const address: string = "8080";

// Setting
app.set("port", process.env.PORT || address);

// Middlewares
app.use(morgan("dev"));
app.use(express.json());

// Routes
app.use("/api", indexRoutes);

// Error handler
app.use(errorHandler);

app.get("/", (req: Request, res: Response) => {
  res.send("API WORKING !!");
});

// Public
app.use("uploads", express.static(path.resolve("uploads")));

// Server Starter
(async () => {
  try {
    await connectDB();
    app.listen(app.get("port"));
    console.log(
      `Server is running on port http://localhost:${app.get("port")}`
    );
  } catch (error) {
    console.log(error);
  }
})();

// app.listen(3000, function () {
//   console.log(`starting app on: ${address}`);
// });
