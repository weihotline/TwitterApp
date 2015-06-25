angular.module('twitter')

.factory('tweets',
  function($http) {

    var twitter = {

      tweets: [],

      fetchAll: function() {
        return $http.get('/api/tweets').then(function(resp) {
          angular.copy(resp.data.tweets, twitter.tweets);
        });
      },

      create: function(tweet) {
        return $http.post('/api/tweets', tweet).then(function(resp) {
          twitter.tweets.unshift(resp.data)
        });
      }
    };

    return twitter;
  }
);
