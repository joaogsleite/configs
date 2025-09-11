#!/Users/joaoleite/Library/pnpm/node
const WebSocket = require('ws')
const wss = new WebSocket.Server({ host: '127.0.0.1', port: 58174 }, () => {
  console.log('WebSocket server listening on ws://127.0.0.1:58174')
})
wss.on('connection', (ws) => {
  console.log('New client connected')
  ws.on('message', (message) => {
    console.log('Received:', message.toString())
    wss.clients.forEach((client) => {
      if (client !== ws && client.readyState === WebSocket.OPEN) {
        client.send(message.toString())
      }
    })
  })
  ws.on('close', () => {
    console.log('Client disconnected')
  })
  ws.on('error', (err) => {
    console.error('Client error:', err)
  })
})
