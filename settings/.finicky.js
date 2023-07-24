// Use https://finicky-kickstart.now.sh to generate basic configuration
// Learn more about configuration options:
// https://github.com/johnste/finicky/wiki/Configuration

module.exports = {
  defaultBrowser: 'Firefox',
  handlers: [
    /* Performance */ [
      {
        match: [
          '*cloud.google.com/*',
          'redirect.teleparty.com/join/*',
          'https://spectra.loggly.com/*',
        ],
        browser: 'Google Chrome',
      },
    ],
    /* Music */ [
      {
        match: ['music.apple.com/*'],
        browser: '/System/Applications/Music.app',
      },
      {
        match: ['open.spotify.com/*'],
        browser: '/Applications/Spotify.app',
      },
    ],
    /* Video Conferencing */ [
      {
        match: ['meet.google.com/*'],
        browser: 'Google Chrome',
        // browser: '/Users/dudeofawesome/Applications/Chrome Apps.localized/Google Meet.app',
      },
      {
        match: ['*.zoom.us/j/*'],
        browser: '/Applications/zoom.us.app',
      },
      // Slack seems to need the URL to be rewritten somehow
      // {
      //   match: ['slack://*'],
      //   browser: '/Applications/Slack.app',
      // },
      {
        match: [/^msteams:.*$/],
        browser: '/Applications/Microsoft Teams.app',
      },
    ],
    /* Other */ [
      {
        match: ['https://prod.liveshare.*.visualstudio.com/join?*'],
        browser: '/Applications/Visual Studio Code.app',
      },
    ],
  ].flat(),
  rewrite: [
    {
      match: ['teams.microsoft.com/l/meetup-join/*'],
      // Teams only supports a broken URI scheme without the proper slashes between proto and host.
      url: ({ url }) =>
        `msteams:${url.pathname}${url.search ? `?${url.search}` : ''}${url.hash ? `#${url.hash}` : ''}`,
    },
  ],
};
