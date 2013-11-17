(function() {
  var notifyHipchat;

  notifyHipchat = function(cmd) {
    console.log('logging dat shit!!! ----------');
    console.log(cmd);
    return cmd;
  };

  module.exports = {
    init: function(config, context, done) {
      config || (config = {});
      return done(null, {
        environment: notifyHipchat(config.environment),
        prepare: notifyHipchat(config.prepare),
        test: notifyHipchat(config.test),
        deploy: notifyHipchat(config.deploy),
        cleanup: notifyHipchat(config.cleanup)
      });
    }
  };

}).call(this);
