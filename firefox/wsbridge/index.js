#!/Users/joaoleite/Library/pnpm/node
const WebSocket = require('ws')
const path = require('path')
const fs = require('fs')
const wss = new WebSocket.Server({ host: '127.0.0.1', port: 58174 }, () => {
  console.log('WebSocket server listening on ws://127.0.0.1:58174')
})
wss.on('connection', (ws, req) => {
  ws.name = new URL(req.url, 'http://127.0.0.1').searchParams.get('name')
  console.log('New client connected:', ws.name)
  ws.on('message', (message) => {
    const msgString = message.toString()
    wss.clients.forEach((client) => {
      if (client !== ws && client.readyState === WebSocket.OPEN) {
        client.send(msgString)
      }
    })
    onMessageFromClient(ws, JSON.parse(msgString))
  })
  ws.on('close', () => {
    console.log('Client disconnected:', ws.name)
  })
  ws.on('error', (err) => {
    console.error('Client error:', err)
  })
})

/**
 * @param {WebSocket} client - First number
 * @param {{ command: string, [rest: string]: any }} msg
 */
function sendMessageToClient(client, msg) {
  const msgString = JSON.stringify(msg)
  client.send(msgString)
}

function getClient(name) {
  return Array.from(wss.clients).find((client) => {
    return client.name === name
  })
}

/**
 * @param {WebSocket} client - First number
 * @param {{ command: string, [rest: string]: any }} msg
 */
function onMessageFromClient(client, msg) {
  console.log(`Received ${msg?.command} from ${client?.name} `)
  if (msg.command === 'firefoxConnected') {
    sendMessageToClient(client, {
      command: 'setConfig',
      config: getFirefoxConfig()
    })
  } else if (msg.command === 'reloadFirefoxConfig') {
    sendMessageToClient(getClient('firefox'), {
      command: 'setConfig',
      url: getFirefoxConfig()
    })
  }
}

function getFirefoxConfig() {
  const filePath = path.join(__dirname, '../extension/config.json')
  return JSON.parse(fs.readFileSync(filePath, 'utf-8'))
}