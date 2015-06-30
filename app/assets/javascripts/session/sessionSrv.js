angular.module('twitter')

.factory('sessionSrv',

  function($http) {

    var twitter = {

      destroySession: function() {
        return $http.delete('/session').then(function() {
          document.location.href = '/';
        });
      }
    }

    return twitter;
  }
);
