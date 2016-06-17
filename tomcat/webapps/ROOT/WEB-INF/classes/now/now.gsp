<!DOCTYPE HTML>

<html xmlns:g="http://www.w3.org/1999/xhtml">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<title>
		<g:message code="now.title"/>
	</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css"
		  integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js"
			integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7"
			crossorigin="anonymous"></script>
	<asset:javascript src="tether.min.js"/>
	
	<!--AngularJS-->
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

	<asset:javascript src="sock.js"/>
	<asset:javascript src="stomp.js"/>
	<asset:javascript src="now.js"/>
	<asset:stylesheet src="now.css"/>

	<script>
		initNow("${createLink(uri: '/stomp')}", "${params.id}");
	</script>
</head>
<body ng-app="derby-now" ngStrictDi="">
<header class="navbar navbar-light">
	<button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse"
			data-target="#navbar" style="font-size: 1.8rem; color: black; height: 3rem;">
		&#9776;
	</button>

	<ul class="nav nav-tabs hidden-xs-down" id="myTab">
		<li class="nav-item">
			<a class="nav-link" data-toggle="tab" href="#one">One</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="tab" href="#two">Two</a>
		</li>
	</ul>

	<div class="collapse hidden-sm-up" id="navbar">
		<ul class="nav navbar-nav">
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#one">One</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" data-toggle="tab" href="#two">Two</a>
			</li>
		</ul>
	</div>
</header>
<div class="tab-content">
	<div class="tab-pane" id="one">ONE TAB</div>
	<div class="tab-pane" id="two">TWO TAB</div>
</div>
<script>
	$('#myTab a:first').tab('show');
	
	// FIXME the below code does NOT work, and needs to be replaced with the ability to bind the two views for switching panes
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		e.target.tab('show'); // newly activated tab
		e.relatedTarget.tab('hide'); // previous active tab
	});
</script>
<div style="overflow: hidden; background-color: rgb(0, 255, 111)">
	<div style="transform: translateY(40%); height: 100vh">
		<div id="content" class="container" style="transform: translateY(-50%); width: 80%; max-width: 30em">
			<p>Derby ID: ${params.id}</p>
			<div ng-controller="ReleaseCarsController">
				<p>
					<button class="btn btn-danger" ng-show="permissionReleaseCars" ng-click="releaseCars()">
						Release Cars
					</button>
				</p>
				<p>
					<button class="btn btn-success" ng-hide="permissionReleaseCars"
							ng-click="requestPermissionReleaseCars()">
						Request Permission Release Cars
					</button>
				</p>
			</div>
		</div>
	</div>
</div>
</body>
</html>
