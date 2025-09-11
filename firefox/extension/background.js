let ws
function connect() {
  ws = new WebSocket('ws://127.0.0.1:58174')
  ws.onopen = () => {
    console.log('WebSocket connected!')
    const msg = {
      command: 'hello',
      time: Date.now(),
    }
    ws.send(JSON.stringify(msg))
  }
  ws.onmessage = (event) => {
    console.log('Received from server:', event.data)
    onMessageFromServer(JSON.parse(event.data))
  }
  ws.onerror = (err) => {
    console.error('WebSocket error:', err)
  }
  ws.onclose = () => {
    console.log('WebSocket disconnected')
    setTimeout(connect, 3000);
  }
}
setTimeout(connect, 3000)
function sendMessageToServer(obj) {
  if (!ws) return
  if (ws.readyState === WebSocket.OPEN) {
    ws.send(JSON.stringify(obj))
  } else {
    console.warn('WebSocket not open yet')
  }
}
async function onMessageFromServer(event) {
  if (event.action === 'focusTab') {
    const tabs = await browser.tabs.query({})
    const tabToFocus = tabs.find((tab) => tab.url.includes(event.url))
    console.log({tabs, tabToFocus})
    if (tabToFocus) {
      browser.tabs.update(tabToFocus.id, { active: true })
    }
  }
}
