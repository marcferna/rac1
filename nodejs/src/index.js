const https = require('https')
var xpath = require('xpath')
var dom = require('xmldom').DOMParser
const xmlser = require('xmlserializer');
const parse5 = require('parse5');

const options = {
  hostname: 'api.audioteca.rac1.cat',
  path: '/a-la-carta/cerca',
  method: 'GET',
  qs: {
    "programId": "el-mon",
    "sectionId": "el-davantal",
    "from":      "13/03/2020",
    "to":        "14/03/2020"
  }
}

const req = https.request(
  options,
  response => {
    let data = '';

    // A chunk of data has been recieved.
    response.on('data', (chunk) => {
      data += chunk;
    });

    // The whole response has been received. Print out the result.
    response.on('end', () => {
      const document = parse5.parse(data);
      const xhtml = xmlser.serializeToString(document);
      const doc = new dom().parseFromString(xhtml);
      const select = xpath.useNamespaces({"x": "http://www.w3.org/1999/xhtml"});
      const nodes = select("//x:div[@class=\"audioteca-listed-search\"]//x:ul//x:li/@data-audio-id", doc);
      console.log(nodes[0].value)
    });
})

req.on('error', error => {
  console.error(error)
})

req.end()
