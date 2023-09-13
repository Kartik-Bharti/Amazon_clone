console.log("NodeJs initialized");

// Imports
// Same like flutter imports import 'package:flutter/express.dart';
const express = require("express");
const mongoose = require("mongoose");

// Other file Imports
// Same like flutter imports import 'package:amazon/routes/auth.dart';
const authrouter = require("./routes/auth.js");

// Initializations
const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://cartik3002:Kartik123@cluster0.csp6uyo.mongodb.net/?retryWrites=true&w=majority";

// Middelware
app.use(express.json());
app.use(authrouter);

// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection stablished sucessfully with MongoDB");
  })
  .catch((e) => {
    console.log(e);
  });

// Creating an APi
// GET, PUT, POST, UPDATE, DELETE => CRUD
app.get("/hello-world", (req, res) => {
  res.json({ world: "hello world" });
});

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Sucessfully connected ot port ${PORT}`);
});
