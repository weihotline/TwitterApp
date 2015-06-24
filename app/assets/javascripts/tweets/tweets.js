angular.module('twitter')
.factory('tweets', [
  '$http',
  function($http) {
    var tweets.getAll = function() {
      return $http.get('/api/tweets').success(function(data) {
        angular.copy(data, tweets.tweets);
      });
    }

    return tweets;
    // return {
    //   tweets: [
    //     { "id": 22, "content": "Try to bypass the COM system, maybe it will bypass the haptic application!",
    //       "updated_at": "2015-06-23T23:50:08.000Z", "author": "Jocelyn Wyman"
    //     },
    //     { "id": 33, "content": "connecting the matrix won't do anything, we need to generate the bluetooth IB pixel!",
    //       "updated_at": "2015-06-23T23:50:08.000Z", "author": "Jocelyn Wyman"
    //     }
    //   ]
    // }
  }
])
