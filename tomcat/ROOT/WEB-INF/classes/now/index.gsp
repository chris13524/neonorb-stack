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

	<asset:stylesheet src="now.css"/>
</head>
<body>
<g:if test="${flash.danger != null}">
	<div class="alert-container">
		<div class="alert alert-danger alert-dismissible fade in" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			${flash.danger}
		</div>
	</div>
</g:if>
<div style="overflow: hidden; background-color: rgb(0, 255, 111)">
	<div style="transform: translateY(40%); height: 100vh">
		<div class="container now-login">
			<g:form class="form" mapping="nowconnect">
				<div class="form-group">
					<img src="/assets/derby-pro/logo-medium.png" width="100%"/>
				</div>

				<div class="form-group">
					<g:textField name="id" class="form-control" placeholder="${message(code: 'now.id')}"
								 style="text-transform: uppercase" autocomplete="off"/>
				</div>
				<div class="form-group">
					<g:submitButton name="submit" class="btn btn-default btn-info"
									style="width: 100%; text-transform: uppercase"
									value="${message(code: 'now.join')}"/>
				</div>
			</g:form>
		</div>
	</div>
</div>
</body>
</html>