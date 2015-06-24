angular.module('twitter', [ 'ui.router', 'templates' ])
.config([
  '$stateProvider',
  '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider) {

    $stateProvider
      .state('tweets', {
        url: '/tweets',
        templateUrl: 'tweets/_tweets.html',
        controller: 'TweetsCtrl'
      });

    $urlRouterProvider.otherwise('tweets');
  }
])
