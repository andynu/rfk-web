

@welcomeApp = angular.module('welcomeApp', [])

@welcomeApp.controller 'welcomeCtrl', ($scope) ->
  $scope.currentTime = new Date().getTime()

  $scope.songs = [
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
    {hash: Math.random()},
  ]
