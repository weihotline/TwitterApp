angular.module('twitter')
.controller('TweetsCtrl', [
  'tweets',
  function(tweets) {
    this.tweets = tweets.tweets;
  }
]);
