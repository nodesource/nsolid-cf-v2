'use strict'

const pkg = require('./package.json')

process.title = pkg.name

const http = require('http')

const PORT = process.env.PORT
if (PORT == null) {
  console.log('Environment variable PORT must be set to http port to bind to')
  process.exit(1)
}

const server = http.createServer(onRequest)
server.listen(PORT, onListening)

// Called to handle an HTTP request.
function onRequest (req, res) {
  res.setHeader('Content-Type', 'text/html')

  const versions = `${process.versions.nsolid} (Node.js ${process.versions.node})`
  const content = `Hello, World - from N|Solid ${versions} on Cloud Foundry`
  res.end(`
    <html>
      <head>
        <title>${content}</title>
      </head>
      <body>
        <p>${content}</p>
      </body>
    </html>
  `)
}

// Called when server starts listening for requests.
function onListening () {
  console.log(`Server listening on http://localhost:${server.address().port}`)
}
