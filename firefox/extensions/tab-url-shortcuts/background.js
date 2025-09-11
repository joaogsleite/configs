// Map command names to URL substrings
const urlMap = {
  "focus-teams": "teams.microsoft.com",
  "focus-whatsapp": "web.whatsapp.com",
  "focus-discord": "discord.com",
  "focus-gmail": "mail.google.com",
  "focus-chatgpt": "chatgpt.com",
  "focus-jira": "atlassian.net/jira"
};
chrome.commands.onCommand.addListener(async (command) => {
  const searchStr = urlMap[command];
  if (!searchStr) return;
  chrome.tabs.query({currentWindow: true}, (tabs) => {
    for (const tab of tabs) {
      if (tab.url.includes(searchStr)) {
        chrome.tabs.update(tab.id, { active: true });
        break;
      }
    }
  });
});
