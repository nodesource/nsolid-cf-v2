const http = require('http')
const bt = require('buffertools')
const data = new Buffer('abcd')

http.createServer(function (req, res) {
  res.setHeader('content-type', 'text/plain')
  res.statusCode = 200
  res.end(bt.reverse(data.slice()))
}).listen(process.env.PORT)
