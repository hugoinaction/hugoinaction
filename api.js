const http = require("http");
const querystring = require("querystring");
const latex2svg = require("./api/latex2svg");
const rebuild = require('./api/rebuild');
const checkout = require('./api/checkout');

const port = process.env.PORT || 3000;
const server = http.createServer().listen(port);

server.on("request", async function (req, res) {
  const url = new URL(req.url, `http://${req.headers.host}`);
  const queryStringParameters =
    url.search && querystring.parse(url.search.slice(1));
  const request = {
    queryStringParameters,
    path: url.pathname,
    httpMethod: req.method,
    headers: req.headers,
    body: req.body,
  };
  let response = {
    statusCode: 404,
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ error: "Page not found" }),
  };

  try {
    switch (url.pathname) {
      case "/latex2svg":
        response = await latex2svg.handler(request);
        break;
      case '/rebuild':
        response = await rebuild.handler(request);
        break;
      case '/checkout':
        response = await checkout.handler(request);
        break;
    }
  } catch (e) {
    response.statusCode = 500;
    console.log(e);
    response.body = JSON.stringify(e);
  }

  response.headers = response.headers || {};
  response.headers['Access-Control-Allow-Origin'] = '*';
  res.writeHead(response.statusCode, response.headers);
  res.end(response.body);
});

console.log(`Listening on port ${port}`);
