const express = require('express');
const cors = require('cors');

const app = express();

const country = require('./routes/country');

app.use(express.json());
app.use(cors());

app.use('/country', country);

const port = process.env.PORT || 3000;

app.listen(port, () => {
  console.log(`Listening port ${port}...`);
});
