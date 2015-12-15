

app = angular.module('welcomeApp', [])
@welcomeApp = app

#@welcomeApp.config ['$routeProvider', ($routeProvider) ->
#  $routeProvider.
#    when('/skip' {

app.controller 'welcomeCtrl', ($scope, $http) ->

  $scope.rfk = {}
  $scope.rfk.api = new Rfk('http://localhost:7778')

  load_status = ->
    $http.get('http://localhost:7778/status').success (data) ->
      $scope.currentSong = {}
      $.extend $scope.currentSong, data.CurrentSong
      $.extend $scope.currentSong, data.CurrentSongMeta

      $scope.lastSong = {}
      $.extend $scope.lastSong, data.LastSong
      $.extend $scope.lastSong, data.LastSongMeta

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
    $scope.rfk.api.skip()

  $scope.reward = () ->
    $scope.rfk.api.reward()

  $scope.playpause = () ->
    $scope.rfk.api.playpause()

