// const mongoose = require("mongoose");

// const userSchema = new mongoose.Schema({
//   name: {
//     required: true,
//     type: String,
//     lowercase: true,
//     trim: true,
//   },
//   email: {
//     required: true,
//     type: String,
//     trim: true,
//     lowercase: true,
//     validate: {
//       validator: (value) => {
//         const re =
//           /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
//         return value.match(re);
//       },
//       message: "Please enter a valid email address",
//     },
//   },
//   password: {
//     required: true,
//     type: String,
//     trim: true,
//     validate: {
//       validator: (value) => {
//         return value.length > 6;
//       },
//       message: "Password length must be larger than 6 characters",
//     },
//   },
//   address: {
//     type: String,
//     default: "",
//   },
//   type: {
//     type: String,
//     default: "user",
//   },
// });

// const User = new mongoose.model("User", userSchema);
// module.exports = User;

const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  name: {
    required: true,
    type: String,
    lowercase: true,
    trim: true,
  },
  email: {
    required: true,
    type: String,
    trim: true,
    lowercase: true,
    validate: {
      validator: (value) => {
        const re =
          /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return re.test(value); // Use test() method to validate
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
        return value.length >= 6; // Check if length is greater or equal to 6
      },
      message: "Password length must be at least 6 characters",
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

const User = mongoose.model("User", userSchema); // Define the model

module.exports = User; // Export the model
