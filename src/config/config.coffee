app.controller 'HipchatController', ['$scope', ($scope) ->

  $scope.$watch 'configs[branch.name].hipchat.config', (value) ->
    $scope.config = value or {}

  $scope.saving = false
  $scope.save = ->
    $scope.saving = true
    $scope.pluginConfig 'hipchat', $scope.config, ->
      $scope.saving = false

  $scope.testMessage = ->
    console.log 'test message stub'

  $scope.saveOptions = ->
    $scope.config['authToken'] = $scope.authToken
    $scope.config['roomId'] = $scope.roomId
    $scope.config['from'] = $scope.from

    $scope.config['startColor'] = $scope.startColor
    $scope.config['startMessage'] = $scope.startMessage

    $scope.config['passColor'] = $scope.passColor
    $scope.config['passMessage'] = $scope.passMessage

    $scope.config['failColor'] = $scope.failColor
    $scope.config['failMessage'] = $scope.failMessage

    $scope.save()
]
