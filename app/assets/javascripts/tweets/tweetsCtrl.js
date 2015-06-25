angular.module('twitter')

.controller('TweetsCtrl', [

  'tweets',

  function(tweets) {
    var self = this;

    self.tweets = tweets.tweets;

    self.addTweet = function() {
      tweets.create({
        content: self.content
      });

      self.content = '';
    }
  }
]);
