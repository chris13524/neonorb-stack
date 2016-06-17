<html xmlns:g="http://www.w3.org/1999/xhtml">
<head>
	<title>
		<g:message code="register.title"/>
	</title>
	<meta name="layout" content="main"/>

	<!-- Include the JS ReCaptcha API -->
	<script src="https://www.google.com/recaptcha/api.js?onload=vcRecaptchaApiLoaded&render=explicit" async
			defer></script>

	<!-- Include the ngReCaptcha directive -->
	<asset:javascript src="angular-re-captcha.js"/>

	<asset:javascript src="credentials-check.js"/>
</head>
<body>
<g:ifLoggedOut>
	<h1>
		<g:message code="register.header"/>
	</h1>
	<g:form name="form" class="form" mapping="register">
		<g:set var="form" value="form" scope="request"/>
		<g:include view="/user/usernamefield.gsp"/>
		<g:include view="/user/emailfield.gsp"/>
		<g:include view="/user/passwordfield.gsp"/>

		<!-- separator -->
		<div class="form-group">
			<hr/>
		</div>

		<!-- captcha -->
		<div class="form-group">
			<div vc-recaptcha key="'6LcW4BQTAAAAAFPnSYXGvVJ3n4gscxnUThlGcRYL'"/>
		</div>

		<!-- separator -->
		<div class="form-group">
			<hr/>
		</div>

		<!-- submit -->
		<div class="form-group">
			<g:actionSubmit
					class="btn btn-default btn-success"
					value="${message(code: 'register.register')}"
					ng-disabled="
						${form}.\$invalid ||
						${form}.username.\$pending.usernameAvailable ||
						${form}.email.\$pending.emailAvailable"/>
		</div>
	</g:form>
</g:ifLoggedOut>
<g:ifLoggedIn>
	<g:message code="register.alreadyregistered"/>
</g:ifLoggedIn>
</body>
</html>

