// Use https://finicky-kickstart.now.sh to generate basic configuration
// Learn more about configuration options:
// https://github.com/johnste/finicky/wiki/Configuration

module.exports = {
  defaultBrowser: 'Firefox',
  handlers: [
    {
      match: ['meet.google.com/*'],
      browser: 'Google Chrome',
      // browser: '/Users/dudeofawesome/Applications/Chrome Apps.localized/Google Meet.app',
    },
    {
      match: [
        '*cloud.google.com/*',
        'redirect.teleparty.com/join/*'
      ],
      browser: 'Google Chrome',
    },
    {
      match: ['*.zoom.us/j/*'],
      browser: '/Applications/zoom.us.app',
    },
    {
      match: ['music.apple.com/*'],
      browser: '/System/Applications/Music.app',
    },
    {
      match: ['open.spotify.com/*'],
      browser: '/Applications/Spotify.app',
    },
    {
      match: ['https://prod.liveshare.*.visualstudio.com/join?*'],
      browser: '/Applications/Visual Studio Code.app',
    }
  ],
};
