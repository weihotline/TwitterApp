angular.module('twitter')

.factory('tweets',
  function($http) {

    var twitter = {

      tweets: [],

      getAll : function() {
        return $http.get('/api/tweets').then(function(resp) {
          angular.copy(resp.data.tweets, twitter.tweets);
        });
      }
    };

    return twitter;
  }
);
