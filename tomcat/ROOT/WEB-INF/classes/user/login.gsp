<html xmlns:g="http://www.w3.org/1999/xhtml" xmlns:asset="">
<head>
	<title>
		<g:message code="login.title"/>
	</title>
	<meta name="layout" content="main"/>
</head>
<body>
<h1><g:message code="login.header"/></h1>
<g:form mapping="login"
		style="margin-bottom: 0px;">
	<div class="form-group">
		<g:textField class="form-control" name="username" ng-model="username" required=""
					 placeholder="${g.message(code: 'login.username')}" autofocus=""/>
	</div>
	<div class="form-group">
		<g:passwordField class="form-control" name="password" ng-model="password" required=""
						 placeholder="${g.message(code: 'login.password')}"/>
	</div>
	<div class="form-group">
		<g:actionSubmit class="btn btn-success" value="${message(code: 'login.login')}"
						ng-disabled="login.\$invalid"/>
	</div>
</g:form>
</body>
</html>

