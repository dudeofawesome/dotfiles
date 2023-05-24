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
      match: ['*cloud.google.com/*'],
      browser: 'Google Chrome',
    },
  ],
};
