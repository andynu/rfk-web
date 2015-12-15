#= require spec_helper
describe 'WelcomeCtrl', ->
  #`var scope, ctrl, $httpBackend`

  beforeEach(module('welcomeApp'))

  it 'should set songs', inject (_$httpBackend_,$controller) ->

    $httpBackend = _$httpBackend_
    $httpBackend.expectGET('http://localhost:7778/status').
      respond({ "CurrentSongMeta": { "Title": "a", "Artist": "b" }})


    scope = {}
    ctrl = $controller('welcomeCtrl', { $scope: scope })
    expect(scope.songs.length).toBe(5)
    expect(scope.orderProp).toBe('hash')

    expect(scope.rfk.status).toBeUndefined()
    
    $httpBackend.flush()

    expect(scope.rfk.status.CurrentSongMeta.Title).toBe('a')
