angular.module('twitter')

.controller('UsersCtrl', [

  'usersSrv',

  function(usersSrv) {

    var self = this;

    self.users = usersSrv.users;

    self.follow = function(user) {

      if (!user.beingFollowed) {

        usersSrv.createFollow({
          followee_id: user.id
        }).then(function() {
          user.beingFollowed = true;
          user.followId = usersSrv.followId;
        });

      } else {

        usersSrv.destroyFollow({
          id: user.followId
        }).then(function() {
          user.beingFollowed = false;
        });

      }
    }
  }
]);
