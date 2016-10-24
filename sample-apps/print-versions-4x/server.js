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

  const lines = [ ]

  showTable(lines, 'process.versions', process.versions)

  res.end(lines.join('\n'))
}

// Output some HTML to display a table from an object.
function showTable (lines, name, object) {
  lines.push('')
  lines.push(`<h1>${sanitize(name)}</h1>`)
  lines.push('<p><table>')

  const keys = []
  for (let key in object) keys.push(key)
  keys.sort()

  for (let key of keys) {
    const val = sanitize(JSON.stringify(object[key]))
    lines.push(`<tr> <td>${sanitize(key)} <td> ${val}`)
  }

  lines.push('</table>')
}

// Sanitize HTML
function sanitize (string) {
  return string
    .replace(/&/g, "&amp;")
    .replace(/</g, "&lt;")
    .replace(/>/g, "&gt;")
}

// Called when server starts listening for requests.
function onListening () {
  console.log(`Server listening on http://localhost:${server.address().port}`)
}
