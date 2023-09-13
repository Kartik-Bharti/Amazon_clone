const express = require("express");
const bcrypt = require("bcryptjs");

const User = require("../models/user_model");

const authrouter = express.Router();

// SIGN-UP route
authrouter.post("/user/signup", async (req, res) => {
  try {
    // GET data from client
    const { name, email, password } = req.body;

    // Check if user with the given email already exists
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res.status(400).json({ msg: "Email already exists!" });
    }

    // Create a new user instance
    const hashedpassword = await bcrypt.hash(password, 8);

    const newUser = new User({
      name,
      email,
      password: hashedpassword,
    });

    // Save the new user to the database
    const savedUser = await newUser.save();

    // Return the saved user data to the client
    res.json(savedUser);
  } catch (error) {
    // Handle any errors that might occur during the process
    console.error("Error during user signup:", error);
    res.status(500).json({ msg: "Server error" });
  }
});

module.exports = authrouter;
