app.controller 'HipchatController', ['$scope', ($scope) ->

  $scope.options = $scope.pluginConfig('hipchat') || {}

  $scope.saving = false

  $scope.save = ->
    $scope.saving = true
    $scope.pluginConfig 'hipchat', $scope.options, ->
      $scope.saving = false
]
