const { WebSocket } = require('ws')

const ws = new WebSocket('ws://127.0.0.1:58174?name=test')

ws.onopen = () => {
  console.log('WebSocket connected')
  const msg = {
    command: 'reloadFirefoxConfig',
    time: Date.now(),
  }
  console.log('Sending message...')
  ws.send(JSON.stringify(msg))
  console.log('Message sent')
  ws.close()
}
