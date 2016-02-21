
((app) ->
  app.CurrentSong = ng.core.Component({
    selector: 'currentsong',
    template: """
    <b>Current Song</b>
    """
  }).Class({
    constructor: () ->
      # nothing
  })
)(window.app || (window.app = {}))



#app = angular.module('welcomeApp', [])
#
#app.controller 'welcomeCtrl', ['$scope','Rfk', ($scope,rfk) ->
#
#  updateStatus = () =>
#    result = rfk.status()
#    result.success (data) ->
#      $scope.currentSong = {}
#      $.extend $scope.currentSong, data.CurrentSong
#      $.extend $scope.currentSong, data.CurrentSongMeta
#
#      $scope.lastSong = {}
#      $.extend $scope.lastSong, data.LastSong
#      $.extend $scope.lastSong, data.LastSongMeta
#
#      $scope.rfk_status = data
#
#    result = rfk.requests()
#    result.success (data) ->
#      console.log "requests: %o", data
#      if data is "null"
#        $scope.requests = []
#      else
#        $scope.requests = data
#
#
#
#  updateStatus()
#  setInterval updateStatus, 1000*10
#
#  $scope.skip = -> rfk.skip()
#  $scope.reward = -> rfk.reward()
#  $scope.playpause = -> rfk.playpause()
#  $scope.clearRequests = -> 
#    rfk.clearRequests()
#    $scope.requests = []
#  
#  $scope.searchRequest = ->
#    term = $scope.term
#    rfk.searchRequest(term)
#    $scope.term = ""
#    $scope.search_songs = []
#    updateStatus()
#
#  $scope.search = ->
#    term = $scope.term
#    if term.length > 2
#      result = rfk.search({ term:term, limit: 10})
#      result.success (data) ->
#        $scope.search_songs = data
#    else
#      $scope.search_songs = []
#
#  $scope.currentTime = new Date().getTime()
#
#  $scope.requests = []
#  $scope.search_songs = []
#
#
#]
#
#app.factory 'Rfk', ['$http', ($http) ->
#  new class Rfk
#    constructor: ->
#      @baseUrl = 'http://localhost:7778'
#
#    skip: ->
#      $http.post("#{@baseUrl}/skip")
#
#    reward:  ->
#      $http.post("#{@baseUrl}/reward")
#
#    playpause:  ->
#      $http.post("#{@baseUrl}/playpause")
#
#    status: ->
#      return $http.get("#{@baseUrl}/status")
#
#    search: (params) ->
#      # {term:, limit:}
#      return $http.get("#{@baseUrl}/search", {params:params})
#
#    searchRequest: (term) ->
#      data = {term: term}
#      params = {params: data}
#      return $http.get("#{@baseUrl}/searchRequest", params)
#
#    requests: (params) ->
#      # {term:, limit:}
#      return $http.get("#{@baseUrl}/requests")
#
#    clearRequests: ->
#      $http.get("#{@baseUrl}/clearRequests")
#
#]
