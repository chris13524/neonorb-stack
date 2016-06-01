<!DOCTYPE HTML>

<html xmlns:g="http://www.w3.org/1999/xhtml">
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link rel="shortcut icon" type="image/png" href="/assets/neon-orb/icon-tiny.png"/>
	<title>
		<g:layoutTitle default="Neon Orb"/>
		<g:message code="title"/>
	</title>

	<!-- Styles -->
	<asset:stylesheet src="bootstrap.css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/js/bootstrap.min.js"
			integrity="sha384-vZ2WRJMwsjRMW/8U7i6PWi6AlO1L79snBrmgiDpgIWJ82z8eA5lenwvxbMV1PAh7"
			crossorigin="anonymous"></script>
	<asset:stylesheet src="main.css"/>
	<asset:javascript src="tether.min.js"/>

	<script>
		$('.collapse').collapse();
		$('.dropdown-toggle').dropdown();
		$(".alert").alert();
	</script>

	<!-- Menu bar sticky -->
	<asset:javascript src="sticky.js"/>
	<script>
		$(document).ready(function(){
			$("#menu").sticky({topSpacing:0});
		});
	</script>

	<!--AngularJS-->
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.min.js"></script>

	<!-- Include the JS ReCaptcha API -->
	<script src="https://www.google.com/recaptcha/api.js?onload=vcRecaptchaApiLoaded&render=explicit" async
			defer></script>

	<!-- Include the ngReCaptcha directive -->
	<asset:javascript src="angular-re-captcha.js"/>
	<script>
		var app = angular.module('neon-orb-website',['vcRecaptcha']);
	</script>

	<!--Page Head-->
	<g:layoutHead/>
</head>
<body onload="${pageProperty(name:'body.onload')}" ng-app="neon-orb-website" ng-strict-di="">
<div id="logocontainer" style="width: 100%; padding: 10px; background-color: #4CAF50;">
	<img id="logo" class="logo" src="/assets/neon-orb/logo-large.png"/>
	<script>
		function getViewport() { // taken from: http://stackoverflow.com/a/2035211/3171100
			var viewPortWidth;
			var viewPortHeight;
			
			// the more standards compliant browsers (mozilla/netscape/opera/IE7) use window.innerWidth and window.innerHeight
			if (typeof window.innerWidth != 'undefined') {
				viewPortWidth = window.innerWidth,
				viewPortHeight = window.innerHeight
			}
			
			// IE6 in standards compliant mode (i.e. with a valid doctype as the first line in the document)
			else if (typeof document.documentElement != 'undefined'
					&& typeof document.documentElement.clientWidth !=
					'undefined' && document.documentElement.clientWidth != 0) {
				viewPortWidth = document.documentElement.clientWidth,
				viewPortHeight = document.documentElement.clientHeight
			}

			// older versions of IE
			else {
				viewPortWidth = document.getElementsByTagName('body')[0].clientWidth,
				viewPortHeight = document.getElementsByTagName('body')[0].clientHeight
			}
			return [viewPortWidth, viewPortHeight];
		}
		
		var resize = function(){
			var logoWidth = $("#logo").get(0).offsetWidth;
			var logoContainerWidth = $("#logocontainer").get(0).offsetWidth;
			
			var logoHeight = $("#logo").get(0).offsetHeight;
			var windowHeight = getViewport()[1];
			
			if(logoWidth > logoContainerWidth - parseFloat($("#logocontainer").css("padding-left")) - parseFloat($("#logocontainer").css("padding-right"))){
				$("#logo").css("height", "auto");
				$("#logo").css("width", "100%");
			} else if(logoHeight / windowHeight > 0.15){
				$("#logo").css("height", "15vh");
				$("#logo").css("width", "auto");
			}
		};
		
		$(window).resize(resize);
		
		$("#logo").css("height", "15vh");
		$("#logo").css("width", "auto");
		
		resize();
	</script>
</div>
<nav class="navbar navbar-dark" id="menu" style="background-color: #333">
	<button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse"
			data-target="#navbar" style="font-size: 1.8rem; color: white; height: 3rem;">
		&#9776;
	</button>

	<div class="pull-xs-right">
		<g:ifLoggedOut>
			<g:link mapping="register"
					class="btn btn-success-outline pull-xs-right menuvcenter"
					style="margin-left: .3rem; margin-right: .3rem;">
				<g:message code="user.register"/>
			</g:link>
			<g:form class="form-inline pull-xs-right menuvcenter hidden-md-down"
					mapping="login"
					style="margin-bottom: 0px;">
				<g:textField class="form-control" name="username" ng-model="username" required=""
							 placeholder="${g.message(code: 'user.username')}"/>
				<g:passwordField class="form-control" name="password" ng-model="password" required=""
								 placeholder="${g.message(code: 'user.password')}"/>
				<g:actionSubmit class="btn btn-success" value="${message(code: 'user.login')}"
								ng-disabled="login.\$invalid"/>
			</g:form>
			<g:link mapping="login"
					class="btn btn-success pull-xs-right menuvcenter hidden-lg-up"
					style="margin-left: .3rem;">
				<g:message code="user.login"/>
			</g:link>
		</g:ifLoggedOut>
		<g:ifLoggedIn>
			<div class="pull-xs-right menuvcenter">
				<div class="dropdown" style="margin-right: .2rem">
					<div class="btn btn-success-outline dropdown-toggle" data-toggle="dropdown"
						 style="border-radius: 0px;">
						${user.username}
					</div>
					<div id="userDropdown" class="dropdown-menu" style="right: 0px; left: auto;">
						<g:link mapping="account"
								class="dropdown-item">
							<g:message code="user.account"/>
						</g:link>
						<g:link mapping="logout"
								class="dropdown-item">
							<g:message code="user.logout"/>
						</g:link>
					</div>
				</div>
			</div>
		</g:ifLoggedIn>
	</div>

	<div class="collapse navbar-toggleable-xs" id="navbar">
		<div class="nav navbar-nav">
			<g:link class="nav-item nav-link ${request.forwardURI == '/' ? 'active' : ''}" mapping="index">
				<g:message code="menu.home"/>
			</g:link>
			<g:link class="nav-item nav-link ${request.forwardURI == '/derbypro' ? 'active' : ''}" mapping="derbypro">
				<g:message code="menu.derbypro"/>
			</g:link>
			<g:link class="nav-item nav-link ${request.forwardURI == '/contact' ? 'active' : ''}" mapping="contact">
				<g:message code="menu.contact"/>
			</g:link>
			<g:link class="nav-item nav-link ${request.forwardURI == '/about' ? 'active' : ''}" mapping="about">
				<g:message code="menu.about"/>
			</g:link>
		</div>
	</div>
</nav>
<div class="body" id="body">
	<script>
		$('#body').click(function(){
			$('#navbar').collapse('hide');
		});
		$(document).scroll(function(){
			$('#navbar').collapse('hide');
		});
	
	</script>
	<g:if test="${flash.success != null}">
		<div class="alert alert-success alert-dismissible fade in" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			${flash.success}
		</div>
	</g:if>
	<g:if test="${flash.danger != null}">
		<div class="alert alert-danger alert-dismissible fade in" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			${flash.danger}
		</div>
	</g:if>
	<g:layoutBody/>
</div>
</body>
</html>