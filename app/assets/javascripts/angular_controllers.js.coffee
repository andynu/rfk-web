
app = angular.module('welcomeApp', [])

app.controller 'welcomeCtrl', ['$scope','Rfk', ($scope,rfk) ->

  updateStatus = () =>
    result = rfk.status()
    result.success (data) ->
      $scope.currentSong = {}
      $.extend $scope.currentSong, data.CurrentSong
      $.extend $scope.currentSong, data.CurrentSongMeta

      $scope.lastSong = {}
      $.extend $scope.lastSong, data.LastSong
      $.extend $scope.lastSong, data.LastSongMeta

      $scope.rfk_status = data

  updateStatus()
  setInterval updateStatus, 1000

  $scope.skip = -> rfk.skip()
  $scope.reward = -> rfk.reward()
  $scope.playpause = -> rfk.playpause()

  $scope.currentTime = new Date().getTime()

  $scope.songs = [
    {hash: Math.random(), name: 'a'},
    {hash: Math.random(), name: 'd'},
    {hash: Math.random(), name: 'b'},
    {hash: Math.random(), name: 'e'},
    {hash: Math.random(), name: 'c'},
  ]

  $scope.orderProp = 'hash'
  ]

app.factory 'Rfk', ['$http', ($http) ->
  new class Rfk
    constructor: ->
      @baseUrl = 'http://localhost:7778'

    skip: ->
      $http.post("#{@baseUrl}/skip")

    reward:  ->
      $http.post("#{@baseUrl}/reward")

    playpause:  ->
      $http.post("#{@baseUrl}/playpause")

    status: ->
      return $http.get("#{@baseUrl}/status")
]
