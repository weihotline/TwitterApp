angular.module('twitter')

.controller('TweetsCtrl', [

  'tweetsSrv',

  function(tweetsSrv) {

    var self = this;

    self.tweets = tweetsSrv.tweets;

    self.addTweet = function() {
      tweetsSrv.create({
        content: self.content
      });

      self.content = '';
    }

    self.calcTimeDiff = function(time) {

      var pastTime = new Date(time);
      var currentTime = new Date();
      var diffInSec = (currentTime - pastTime) / 1000;
      var result = '';

      switch(true) {
        case (diffInSec >= 86400):
          result = Math.floor(diffInSec / 86400) + "d";
          break;
        case (diffInSec >= 3600):
          result = Math.floor(diffInSec / 3600) +  "h";
          break;
        default:
          result = Math.floor(diffInSec / 60) +  "m";
          break;
      }

      return result;
    }
  }
]);
