angular.module('twitter')

.factory('usersSrv',

  function($http) {

    var twitter = {

      users: [],

      fetchAll: function() {
        return $http.get('/users').then(function(resp) {
          angular.copy(resp.data, twitter.users);
        });
      }
    }

    return twitter;
  }
);
