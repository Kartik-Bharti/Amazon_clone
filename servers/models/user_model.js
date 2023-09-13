const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  name: {
    require: true,
    type: String,
    lowercase: true,
    trim: true,
  },
  email: {
    require: true,
    type: String,
    trim: true,
    lowercase: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re);
      },
      message: "Please enter a valid email address",
    },
  },
  password: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        return value.length > 6;
      },
      message: "Password length must be larger than 6 characters",
    },
  },
  address: {
    type: String,
    default: "",
  },
  type: {
    type: String,
    default: "user",
  },
});

const User = new mongoose.model("User", userSchema);
module.exports = User;
