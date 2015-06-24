angular.module('twitter', [ 'ui.router', 'templates' ])
.config([
  '$stateProvider',
  '$urlRouterProvider',
  function($stateProvider, $urlRouterProvider) {

    $stateProvider
      .state('tweets', {
        url: '/tweets',
        templateUrl: 'tweets/_tweets.html',
        controller: 'TweetsCtrl as tc',
        resolve: {
          tweetPromise: ['tweets', function(tweets) {
            return tweets.getAll();
          }]
        }
      });

    $urlRouterProvider.otherwise('tweets');
  }
]);
