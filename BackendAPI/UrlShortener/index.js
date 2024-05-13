require("dotenv").config();
const express = require("express");
const cors = require("cors");
const app = express();
const bodyParser = require("body-parser");
const dns = require("node:dns");
const mongoose = require("mongoose");
const { escape } = require("node:querystring");

// Basic Configuration
const port = process.env.PORT || 3000;
mongoose.connect(process.env.MONGO_URI, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

// Mongoose model
const URLSchema = new mongoose.Schema({
  original_url: String,
  short_url: Number,
});
const URL = mongoose.model("URL", URLSchema);

app.use(bodyParser.urlencoded({ extended: false }));

app.use(cors());

app.use("/public", express.static(`${process.cwd()}/public`));

app.get("/", function (req, res) {
  res.sendFile(process.cwd() + "/views/index.html");
});

// Your first API endpoint
app.get("/api/hello", function (req, res) {
  res.json({ greeting: "hello API" });
});

// Url endpoint form
app.post("/api/shorturl", function (req, res) {
  const url = req.body.url;
  dns.lookup(url, function (err, address, family) {
    // Not found
    if (err) return res.json({ error: "Invalid URL" });

    // Check DB for address
    URL.findOne({ original_url: url }, function (err, data) {
      if (err) return console.log(err);

      // If in DB: return json
      if (data) {
        return res.json({
          original_url: data.original_url,
          short_url: data.short_url,
        });
      }

      // Else add to DB
      createNewURL(res, url);
    });
  });
});

function createNewURL(res, url) {
  // First find next available integer
  URL.find({}, function (err, data) {
    if (err) return console.log(err);

    let integer = 0; // default integer if no urls already exists
    if (data) {
      integer = data[data.length - 1].short_url + 1; // add one to last used integer
    }

    // Finally add to DB
    const json = { original_url: url, short_url: integer };
    new URL(json).save(function (err, data) {
      if (err) return console.log(err);
      return res.json(json);
    });
  });
}

app.listen(port, function () {
  console.log(`Listening on port ${port}`);
});
