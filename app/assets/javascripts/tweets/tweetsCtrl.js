angular.module('twitter')
.controller('TweetsCtrl', [
  '$scope',
  'tweets',
  function($scope, tweets) {
    $scope.tweets = tweets.tweets;
  }
])
