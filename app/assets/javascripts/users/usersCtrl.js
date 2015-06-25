angular.module('twitter')

.controller('UsersCtrl', [

  'usersSrv',

  function(usersSrv) {

    var self = this;

    self.users = usersSrv.users;

  }
]);
