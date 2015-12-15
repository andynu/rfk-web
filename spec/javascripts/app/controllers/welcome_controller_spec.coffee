#= require spec_helper
describe 'WelcomeCtrl', ->
  beforeEach(module('welcomeApp'))

  it 'should set currentTime', inject ($controller) ->
    scope = {}
    ctrl = $controller('welcomeCtrl', { $scope: scope })
    expect(scope.songs.length).toBe(26)
