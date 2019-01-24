const express = require('express');
const cors = require('cors');
const app = express();
app.use(cors());

const xml2js = require('xml2js');
let parser = new xml2js.Parser();
const request = require('request');

let url = 'http://openapi.1365.go.kr/openapi/service/rest/VolunteeEducationService/getVltrEducationList';
let serviceKey = 'cfMfFpXc4%2BaEMQWtGAaWpBVaDRffENqu0PUisrJvMr8j3SdNuxgLTwB7N877rZ6Rr6%2BbkByWzSKlQ9i%2FqfLHmA%3D%3D';
let queryParams = '?' + encodeURIComponent('ServiceKey') + '=' + serviceKey;

let edus;
request({
    url: url + queryParams,
    method: 'GET'
  }, function (error, response, body) {

    parser.parseString(body, function(err, result) {
      // console.log(JSON.stringify(result.response.body));
      edus = JSON.stringify(result.response.body);
    });
});


app.get('/', (req, res) => {
  res.send('Hello World!\n');
});

app.get('/edus', (req, res) => {
  return res.json(edus);
});


app.listen(3000, () => {
  console.log('listening on port 3000!');
});