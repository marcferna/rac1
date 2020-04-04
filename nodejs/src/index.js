// const https = require('https')
var xpath = require('xpath')
var dom = require('xmldom').DOMParser
const xmlser = require('xmlserializer');
const parse5 = require('parse5');
const fetch = require("node-fetch");
const moment = require('moment');



const getData = async (url, date) => {
  try {
    const from = moment(date).format("DD/MM/YYYY");
    const to = moment(date).add(1, 'day').format("DD/MM/YYYY");
    const response = await fetch(url + `?programId=el-mon&sectionId=el-davantal&from=${from}&to=${to}`);
    const text = await response.text()
    const document = parse5.parse(text);
    const xhtml = xmlser.serializeToString(document);
    const doc = new dom().parseFromString(xhtml);
    const select = xpath.useNamespaces({"x": "http://www.w3.org/1999/xhtml"});
    const nodes = select("//x:div[@class=\"audioteca-listed-search\"]//x:ul//x:li/@data-audio-id", doc);
    const audioId = nodes[0].value
    console.log(audioId)

    const audioResponse = await fetch(`https://api.audioteca.rac1.cat/piece/audio?id=${audioId}`)
    const json = await audioResponse.json();
    const finalUrl = json.path
    console.log(finalUrl)
  } catch (error) {
    console.log(error);
  }
};


let date = new Date(2020, 2, 13)
getData("https://api.audioteca.rac1.cat//a-la-carta/cerca", date);

// const options = {
//   hostname: 'api.audioteca.rac1.cat',
//   path: '/a-la-carta/cerca',
//   method: 'GET',
//   qs: {
//     "programId": "el-mon",
//     "sectionId": "el-davantal",
//     "from":      "13/03/2020",
//     "to":        "14/03/2020"
//   }
// }

// const req = https.request(
//   options,
//   response => {
//     let data = '';

//     // A chunk of data has been recieved.
//     response.on('data', (chunk) => {
//       data += chunk;
//     });

//     // The whole response has been received. Print out the result.
//     response.on('end', () => {
//       const document = parse5.parse(data);
//       const xhtml = xmlser.serializeToString(document);
//       const doc = new dom().parseFromString(xhtml);
//       const select = xpath.useNamespaces({"x": "http://www.w3.org/1999/xhtml"});
//       const nodes = select("//x:div[@class=\"audioteca-listed-search\"]//x:ul//x:li/@data-audio-id", doc);
//       console.log(nodes[0].value)
//     });
// })

// req.on('error', error => {
//   console.error(error)
// })

// req.end()
