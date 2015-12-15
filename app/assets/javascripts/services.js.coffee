#rfkServices = angular.module('rfkServices', ['ngResource'])
#
#rfkServices.factory 'Rfk', ['$resource',
#  ($resource) ->
#    return $resource('http://localhost:7778/status', {}, {
#      query: {method: 'GET', isArray:false}
#    }
#]
