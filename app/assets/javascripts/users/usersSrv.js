angular.module('twitter')

.factory('usersSrv',

  function($http) {

    var twitter = {

      users: [],

      followId: "",

      fetchAll: function() {
        return $http.get('/users').then(function(resp) {
          angular.copy(resp.data, twitter.users);
        });
      },

      createFollow: function(follow) {
        return $http.post('/api/follows', follow).then(function(resp) {
          twitter.followId = resp.data.id;
        });
      },

      destroyFollow: function(follow) {
        return $http.delete('/api/follows/' + follow.id);
      }
    }

    return twitter;
  }
);
