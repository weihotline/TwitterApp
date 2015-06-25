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
          twitterPromise: ['tweets', function(twitter) {
            return twitter.fetchAll();
          }]
        }

      });

    $urlRouterProvider.otherwise('tweets');
  }
]);
