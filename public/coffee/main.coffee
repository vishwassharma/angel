#// Author: Thomas Davis <thomasalwyndavis@gmail.com>
#// Filename: main.js

#// Require.js allows us to configure shortcut alias
#// Their usage will become more apparent futher along in the tutorial.

require.config
    baseUrl: '/js/'
    paths:
      text: 'vendors/text'

    waitSeconds: 1
    #// For easier development, disable browser caching:
    urlArgs: 'bust=' +  (new Date()).getTime()

require ['app'], (Application) ->
    console.log "Working on application"
    
    application = new Application

