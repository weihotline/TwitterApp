angular.module('twitter', [ 'ui.router', 'templates' ])

.config(function($stateProvider, $urlRouterProvider) {

    $stateProvider
      .state('tweets', {

        url: '/tweets',

        templateUrl: '_tweets.html',

        controller: 'TweetsCtrl as tc',

        resolve: {
          twitterPromise: ['tweetsSrv', function(twitter) {
            return twitter.fetchAll();
          }]
        }

      })
      .state('users', {

        url: '/users',

        templateUrl: '_users.html',

        controller: 'UsersCtrl as uc',

        resolve: {
          twitterPromise: ['usersSrv', function(twitter) {
            return twitter.fetchAll();
          }]
        }
      });

    $urlRouterProvider.otherwise('tweets');
  }
);
