(function() {
  module.exports = {
    init: function(config, job, context, done) {
      return done(null, {
        env: config
      });
    }
  };

}).call(this);
