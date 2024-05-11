// index.js
// where your node app starts

// init project
var express = require("express");
var app = express();

// enable CORS (https://en.wikipedia.org/wiki/Cross-origin_resource_sharing)
// so that your API is remotely testable by FCC
var cors = require("cors");
app.use(cors({ optionsSuccessStatus: 200 })); // some legacy browsers choke on 204

// http://expressjs.com/en/starter/static-files.html
app.use(express.static("public"));

// http://expressjs.com/en/starter/basic-routing.html
app.get("/", function (req, res) {
  res.sendFile(__dirname + "/views/index.html");
});

// your first API endpoint...
app.get("/api/hello", function (req, res) {
  res.json({ greeting: "hello API" });
});

/* Date endpoint: responds with json object with 
key 'unix' that is a Unix timestamp of the input date in ms,
and key 'utc' that is a string of the input date in the format
Thu, 01 Jan 1970 00:00:00 GMT. Assumes input date is GMT*/
app.get("/api/:date?", function (req, res) {
  let date;

  // If empty date: return current time
  if (typeof req.params.date === "undefined") {
    date = new Date();
  } else {
    // If date is time (ms) format, it can nicely casted to a Number
    const dateNumber = Number(req.params.date);
    if (Number.isNaN(dateNumber)) {
      // is not a number after cast: should be a GMT time format
      date = new Date(req.params.date);
    } else {
      // ms format use Number
      date = new Date(dateNumber);
    }
  }

  // If not found
  if (date.toString() === "Invalid Date" || typeof date === "undefined") {
    res.json({ error: "Invalid Date" });
    return;
  }

  res.json({
    unix: date.getTime(),
    utc: `${date.toUTCString()}`,
  });
});

// Listen on port set in environment variable or default to 3000
var listener = app.listen(process.env.PORT || 3000, function () {
  console.log("Your app is listening on port " + listener.address().port);
});
