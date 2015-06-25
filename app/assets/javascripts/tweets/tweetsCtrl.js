angular.module('twitter')

.controller('TweetsCtrl', [

  'tweetsSrv',

  function(tweetsSrv) {
    var self = this;

    self.tweets = tweetsSrv.tweets;

    self.addTweet = function() {
      tweets.create({
        content: self.content
      });

      self.content = '';
    }
  }
]);
