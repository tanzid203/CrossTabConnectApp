<!DOCTYPE html>
<html lang="en" data-ng-app="myApp">
<head>
<title>Dashboard | CrossTab JobSuite</title>
<base href="/">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="images/icons/favicon.ico">
<link rel="apple-touch-icon" href="images/icons/favicon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="images/icons/favicon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="images/icons/favicon-114x114.png">
<!--Loading bootstrap css-->
<link type="text/css" rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,300,700">
<link type="text/css" rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Oswald:400,700,300">
<link type="text/css" rel="stylesheet"
	href="styles/jquery-ui-1.10.4.custom.min.css">
<link type="text/css" rel="stylesheet"
	href="styles/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="styles/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="styles/animate.css">
<link type="text/css" rel="stylesheet" href="styles/all.css">
<link type="text/css" rel="stylesheet" href="styles/main.css">
<link type="text/css" rel="stylesheet" href="styles/mystyles.css">
<link type="text/css" rel="stylesheet"
	href="styles/style-responsive.css">
<link type="text/css" rel="stylesheet"
	href="styles/zabuto_calendar.min.css">
<link type="text/css" rel="stylesheet" href="styles/pace.css">
<link href="css/style.css" rel="stylesheet" />
<link type="text/css" rel="stylesheet" href="styles/jquery.tagit.css">
<link type="text/css" rel="stylesheet"
	href="styles/tagit.ui-zendesk.css">

<link type="text/css" rel="stylesheet" href="styles/video-js.min.css">
<link type="text/css" rel="stylesheet"
	href="styles/videojs.record.min.css">
<link type="text/css" rel="stylesheet" href="styles/videostyle.css">


<link rel="stylesheet" type="text/css"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/flick/jquery-ui.css">
<link type="text/css" rel="stylesheet" href="styles/jplist-custom.css">

<link
	href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.core.min.css"
	rel="stylesheet" type="text/css" />

<link
	href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.filter-toggle-bundle.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.pagination-bundle.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.history-bundle.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.textbox-filter.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.jquery-ui-bundle.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.preloader-control.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.start-rating-control.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/css/jplist.views-control.min.css"
	rel="stylesheet" type="text/css" />

</head>
<body data-ng-app="mainApp">
	<div data-ng-controller="mainCtrl">
		<div ui-view></div>
	</div>
	<script src="script/jquery-1.10.2.min.js"></script>
	<script src="script/jquery-migrate-1.2.1.min.js"></script>
	<script src="script/jquery-ui.js"></script>
	<script src="script/bootstrap.min.js"></script>
	<script src="script/html5shiv.js"></script>
	<script src="script/respond.min.js"></script>
	<script src="script/jquery.metisMenu.js"></script>
	<script src="script/jquery.slimscroll.js"></script>
	<script src="script/jquery.cookie.js"></script>
	<script src="script/icheck.min.js"></script>
	<script src="script/custom.min.js"></script>
	<script src="script/pace.min.js"></script>
	<script src="script/holder.js"></script>
	<script src="script/responsive-tabs.js"></script>
	<script src="script/zabuto_calendar.min.js"></script>

	<script src="script/tag-it.min.js"></script>

	<script src="script/waitingfor.js"></script>

	<script src="script/video.min.js"></script>
	<script src="script/RecordRTC.js"></script>
	<script src="script/videojs.record.min.js"></script>

	<script src="js/angular.min.js" type="text/javascript"></script>
	<script src="js/angular.min.js.map" type="text/javascript"></script>
	<script src="js/angular-sanitize.js" type="text/javascript"></script>
	<script src="js/angular-animate.js" type="text/javascript"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.3.1/angular-ui-router.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.core.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.counter-control.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.filter-dropdown-bundle.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.filter-toggle-bundle.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.history-bundle.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.jquery-ui-bundle.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.pagination-bundle.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.sort-bundle.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.textbox-filter.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jplist/5.2.0/js/jplist.start-rating-control.min.js"></script>
	<!-- 
	<script>
		window.onbeforeunload = function() {

			window.setTimeout(function() {

				window.location = window.location.protocol + "//"
						+ window.location.host;
			}, 0);

			window.onbeforeunload = null;
		}
	</script>
 	-->

	<script>
		//var app = angular.module('myApp', [ 'oc.lazyLoad', 'ngRoute' ]);
		var app = angular.module('myApp', [ 'ui.router', 'ngSanitize',
				'ngAnimate' ]);

		app.run([ '$rootScope', '$location', 'Auth',
				function($rootScope, $location, Auth) {
					$rootScope.$on('$stateChangeStart', function(event) {

						if (!Auth.isLoggedIn()) {
							console.log('DENY');
							$location.path('/loginView');
							//$location.path('/appsView');
							//$location.path('/jobPostingsView');
						} else {
							console.log('ALLOW');
							//$location.path('/jobPostingsView');
						}

					});

				} ]);

		app.controller('mainCtrl', [ '$scope', 'Auth', '$location',
				function($scope, Auth, $location) {

					$scope.$watch(Auth.isLoggedIn, function(value, oldValue) {

						if (!value && oldValue) {
							console.log("Disconnect");
							$location.path('/loginView');
						}

						if (value) {
							console.log("Connect");
							$location.path('/jobPostingsView');
							//$location.path('/appsView');
							//Do something when the user is connected
						}

					}, true);

				} ]);

		//Authorisation Function
		app.factory('Auth', function() {
			var user;

			return {
				setUser : function(aUser) {
					user = aUser;
				},
				isLoggedIn : function() {
					return (user) ? user : false;
				}
			}
		});

		app
				.config(function($stateProvider, $urlRouterProvider,
						$locationProvider) {

					$urlRouterProvider.otherwise('/loginView');

					$locationProvider.html5Mode({
						enabled : true
					});

					$stateProvider
							.state(
									'loginView',
									{
										url : '/loginView',
										templateUrl : 'LoginView.jsp',
										controller : function($scope, $http,
												Auth) {

											if (sessionStorage
													.getItem("username") != null) {

												var username = sessionStorage
														.getItem("username");

												$scope.username = username;

											}

											//submit
											$scope.submit = function() {
												// Ask to the server, do your job and THEN set the user
												if ($scope.username == 'admin'
														&& $scope.password == 'admin') {

													waitingDialog
															.show(
																	'Please Wait',
																	{
																		dialogSize : 'sm',
																		progressType : 'info'
																	});
													//Auth.setUser(user); //Update the state of the user in the app
													Auth.setUser("admin");

													sessionStorage.setItem(
															"username",
															$scope.username);

													sessionStorage.setItem(
															"user",
															$scope.password);
												} else {
													alert('Oops. It seems you have entered incorrect username/password.');
												}

											};
										}
									})

							.state('jobPostingsView', {
								url : '/jobPostingsView',
								templateUrl : 'JobPostingsView.jsp'
							})

							.state('appsView', {
								url : '/appsView',
								templateUrl : 'ApplicationsView.jsp'

							})

							.state('profilesView', {
								url : '/profilesView',
								templateUrl : 'ProfilesView.jsp'

							});

				});

		app.directive('documentJobpostingsView', [
				'$window',
				'$document',
				'$log',
				'$http',
				'$location',
				'$timeout',
				'$rootScope',
				function($window, $document, $log, $http, $location, $timeout,
						$rootScope) {
					return {
						restrict : 'A',
						link : function(scope, element, attrs) {

							$timeout(function() {

								initializeJobPostingsViewButtons();
								waitingDialog.hide();

							}, 1);

							$document.unbind('click').bind(
									'click',
									function(event) {
										$log.info(event);
										if (angular.element(event.target)
												.hasClass('viewAppsButton')) {

											waitingDialog.show('Please Wait', {
												dialogSize : 'sm',
												progressType : 'info'
											});

											var jobcode = event.target.id;

											sessionStorage
													.setItem(
															"appsview_jobcode",
															jobcode);
											$rootScope.$apply(function() {

												$location.path('/appsView');
											});

										}
									})
						}
					};
				} ]);

		app
				.directive(
						'documentAppsView',
						[
								'$window',
								'$document',
								'$log',
								'$http',
								'$location',
								'$timeout',
								function($window, $document, $log, $http,
										$location, $timeout) {
									return {
										restrict : 'A',
										link : function(scope, element, attrs) {

											$timeout(function() {

												initializeAppsViewButtons();
												waitingDialog.hide();

											}, 1);

											$document
													.unbind('click')
													.bind(
															'click',
															function(event) {
																$log
																		.info(event);
																if (angular
																		.element(
																				event.target)
																		.hasClass(
																				'viewFullProfileButton')) {

																	var userid = event.target.id;

																	waitingDialog
																			.show(
																					'Please Wait',
																					{
																						dialogSize : 'sm',
																						progressType : 'info'
																					});

																	var baseURL = window.location.protocol
																			+ "//"
																			+ window.location.host
																			+ "/rest/";
																	$http
																			.get(
																					baseURL
																							+ "appsViewServices"
																							+ "/"
																							+ "getUserInfo",
																					{
																						params : {
																							userid : userid
																						}
																					})
																			.success(
																					function(
																							data,
																							status,
																							headers,
																							config) {

																						scope.users = data[0].userData;

																						console
																								.log(data[0].userData);

																						waitingDialog
																								.hide();

																						$(
																								"#profileView")
																								.modal(
																										'show');

																					})
																			.error(
																					function(
																							data,
																							status,
																							headers,
																							config) {

																						waitingDialog
																								.hide();

																						alert(status);
																						alert(data);

																					});
																}

															})
										}
									};
								} ]);

		app
				.directive(
						'documentProfilesView',
						[
								'$window',
								'$document',
								'$log',
								'$http',
								'$location',
								'$timeout',
								function($window, $document, $log, $http,
										$location, $timeout) {
									return {
										restrict : 'A',
										link : function(scope, element, attrs) {

											$timeout(function() {

												initializeAppsViewButtons();
												waitingDialog.hide();

											}, 1);

											$document
													.unbind('click')
													.bind(
															'click',
															function(event) {
																$log
																		.info(event);
																if (angular
																		.element(
																				event.target)
																		.hasClass(
																				'viewFullProfileButton')) {

																	var userid = event.target.id;

																	waitingDialog
																			.show(
																					'Please Wait',
																					{
																						dialogSize : 'sm',
																						progressType : 'info'
																					});

																	var baseURL = window.location.protocol
																			+ "//"
																			+ window.location.host
																			+ "/rest/";
																	$http
																			.get(
																					baseURL
																							+ "profilesViewServices"
																							+ "/"
																							+ "getUserInfo",
																					{
																						params : {
																							userid : userid
																						}
																					})
																			.success(
																					function(
																							data,
																							status,
																							headers,
																							config) {

																						scope.users = data[0].userData;

																						console
																								.log(data[0].userData);

																						waitingDialog
																								.hide();

																						$(
																								"#profileView")
																								.modal(
																										'show');

																					})
																			.error(
																					function(
																							data,
																							status,
																							headers,
																							config) {

																						waitingDialog
																								.hide();

																						alert(status);
																						alert(data);

																					});
																}

															})
										}
									};
								} ]);

		app.filter("trustUrl", [ '$sce', function($sce) {
			return function(recordingUrl) {
				return $sce.trustAsResourceUrl(recordingUrl);
			};
		} ]);

		/*		LazyLoader Tutorial - used to import .js or .css files before page load.
		app.config(function($ocLazyLoadProvider) {
			$ocLazyLoadProvider.config({
				debug : true,
				modules : [ {
					name : 'TestModule',
					files : [ 'controller/JobPostingsController.js' ]
				} ]
			});
		});
		 */

		window.onbeforeunload = function() {
			return "Are you sure you want to reload?";
		};
	</script>

</body>
</html>
