notifyHipchat = (cmd) ->
  console.log 'logging dat shit!!! ----------'
  console.log cmd
  return cmd

module.exports =
  init: (config, context, done) ->
    config ||= {}
    done(null, {
      environment: notifyHipchat(config.environment)
      prepare: notifyHipchat(config.prepare)
      test: notifyHipchat(config.test)
      deploy: notifyHipchat(config.deploy)
      cleanup: notifyHipchat(config.cleanup)
    })


    #return cb null,
    #  hipchat: config
    #  test: (context, done) ->
    #    console.log 'not sent, bujt thats ok'
    #    done(null, false)

        #authToken = config.options.authToken
        #roomId = config.options.roomId

        #message = 'test message'
        #params = { from: 'Strider',  color: 'purple', notify: false }
        #
        #HipchatClient  = require('hipchat')
        #hipchat = new HipchatClient(authToken)
        #hipchat.sendRoomMessage message, roomId, params, (success) ->
        #  console.log 'hipchat sent'
        #  return done(null, true)
