(function() {
  app.controller('HipchatController', [
    '$scope', function($scope) {
      $scope.$watch('configs[branch.name].hipchat.config', function(value) {
        return $scope.config = value || {};
      });
      $scope.saving = false;
      $scope.save = function() {
        $scope.saving = true;
        return $scope.pluginConfig('hipchat', $scope.config, function() {
          return $scope.saving = false;
        });
      };
      $scope.testMessage = function() {
        return console.log('test message stub');
      };
      return $scope.saveOptions = function() {
        $scope.config['authToken'] = $scope.authToken;
        $scope.config['roomId'] = $scope.roomId;
        $scope.config['from'] = $scope.from;
        $scope.config['startColor'] = $scope.startColor;
        $scope.config['startMessage'] = $scope.startMessage;
        $scope.config['passColor'] = $scope.passColor;
        $scope.config['passMessage'] = $scope.passMessage;
        $scope.config['failColor'] = $scope.failColor;
        $scope.config['failMessage'] = $scope.failMessage;
        return $scope.save();
      };
    }
  ]);

}).call(this);
