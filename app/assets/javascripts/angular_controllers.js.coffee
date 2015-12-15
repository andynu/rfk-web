

app = angular.module('welcomeApp', [])
@welcomeApp = app

#@welcomeApp.config ['$routeProvider', ($routeProvider) ->
#  $routeProvider.
#    when('/skip' {

app.controller 'welcomeCtrl', ($scope, $http) ->

  $scope.rfk = {}

  load_status = ->
    $http.get('http://localhost:7778/status').success (data) ->
      $scope.rfk.status = data

  setInterval load_status, 1000

  $scope.currentTime = new Date().getTime()

  $scope.songs = [
    {hash: Math.random(), name: 'a'},
    {hash: Math.random(), name: 'd'},
    {hash: Math.random(), name: 'b'},
    {hash: Math.random(), name: 'e'},
    {hash: Math.random(), name: 'c'},
  ]

  $scope.orderProp = 'hash'

  $scope.skip = () ->
    $.post('http://localhost:7778/skip')

  $scope.reward = () ->
    $.post('http://localhost:7778/reward')

  $scope.playpause = () ->
    $.post('http://localhost:7778/playpause')

