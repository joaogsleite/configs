let CONFIG = {}
let ws
function connect() {
  ws = new WebSocket('ws://127.0.0.1:58174?name=firefox')
  ws.onopen = () => {
    console.log('WebSocket connected!')
    const msg = {
      command: 'firefoxConnected',
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
    setTimeout(connect, 3000)
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
  if (event.command === 'focusTab') {
    const tabs = await browser.tabs.query({})
    const tabToFocus = tabs.find((tab) => tab.url.includes(event.url))
    console.log({tabs, tabToFocus})
    if (tabToFocus) {
      browser.tabs.update(tabToFocus.id, { active: true })
    }
  }
  if (event.command === 'setConfig') {
    CONFIG = event.config
  }
}

async function getContainerId(containerName) {
  const containers = await browser.contextualIdentities.query({})
  const container = containers.find((c) => c.name === containerName)
  return container.cookieStoreId
}
function matchUrlToContainer(url) {
  return Object.keys(CONFIG?.containerRules || {}).find((containerName) => {
    return !!CONFIG?.containerRules?.[containerName].find((pattern) => {
      return url.includes(pattern)
    })
  })
}

browser.webRequest.onBeforeRequest.addListener(async (request) => {
  if (request.type !== "main_frame") return {}
  try {
    const url = request.url
    console.log(`Navigating to ${url}...`)
    const containerName = matchUrlToContainer(url)
    if (!containerName) return
    const cookieStoreId = await getContainerId(containerName)
    if (!cookieStoreId || request.cookieStoreId === cookieStoreId) return {}
    console.log(`Switching to container ${containerName}`)
    const originalTab = await browser.tabs.get(request.tabId)
    await browser.tabs.create({
      url,
      cookieStoreId,
      index: originalTab.index,
      active: originalTab.active,
      pinned: originalTab.pinned,
      windowId: originalTab.windowId
    })
    await browser.tabs.remove(request.tabId)
    return { cancel: true }
  } catch (e) {
    console.error("Error handling request:", e)
  }
  return {}
}, { urls: ["<all_urls>"] }, ["blocking"])