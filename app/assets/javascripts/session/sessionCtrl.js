angular.module('twitter')

.controller('SessionCtrl', [

  'sessionSrv',

  function(sessionSrv) {
    this.logout = sessionSrv.destroySession;
  }
]);
