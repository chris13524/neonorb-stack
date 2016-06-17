<html xmlns:g="http://www.w3.org/1999/xhtml">
<head>
	<title>Contact</title>
	<meta name="layout" content="main"/>

	<!-- Include the JS ReCaptcha API -->
	<script src="https://www.google.com/recaptcha/api.js?onload=vcRecaptchaApiLoaded&render=explicit" async
			defer></script>

	<!-- Include the ngReCaptcha directive -->
	<asset:javascript src="angular-re-captcha.js"/>
	
	<script>
		// captcha
		var app = angular.module('neon-orb-website', ['vcRecaptcha']);
		
		$('#myModal').on('shown.bs', function () {
			$('#myInput').focus()
		})
	</script>
</head>
<body>
<h1>Contact</h1>
You can contact us by phone after 4 PM EST on weekdays or any time on weekends :)
<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="font-weight-bold">(614) NEON-ORB</span>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;<span class="font-weight-bold">(614) 636-6672</span>
<p></p>
You can also contact us by email:
<br>
&nbsp;&nbsp;&nbsp;&nbsp;Support: <a href="mailto:support@neonorb.com">support@neonorb.com</a>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;General: <a href="mailto:neonorb@neonorb.com">neonorb@neonorb.com</a>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;Bugs & Suggestions: <a href="mailto:bugs@neonorb.com">bugs@neonorb.com</a>

<p></p>
Or you can fill out this nice form:
<p></p>
<g:form name="contact" url="[controller: contact]">
	<!-- contactee -->
	<div class="form-group">
		<g:message class="form-control-label" code="contact.contactee"/>
		<select class="form-control" name="contactee">
			<option value="support">
				<g:message code="contact.contactee.support"/>
			</option>
			<option value="general">
				<g:message code="contact.contactee.general"/>
			</option>
			<option value="bugs">
				<g:message code="contact.contactee.bugs"/>
			</option>
		</select>
	</div>
	
	<!-- message -->
	<div class="form-group
				{{(contact.message.$touched &&
				contact.message.$invalid)
				? 'has-danger' : ''}}">
		<g:message class="form-control-label" code="contact.message"/>
		<span class="pull-xs-right" style="color: red" ng-show="contact.message.$touched &&
				contact.message.$invalid &&
				contact.message.$error.required">
			<g:message code="contact.messagerequired"/>
		</span>
		<textarea name="message" ng-model="message" required="" class="form-control form-control-danger" rows="3"></textarea>
	</div>

	<!-- separator -->
	<div class="form-group">
		<hr/>
	</div>

	<!-- captcha -->
	<div class="form-group">
		<div vc-recaptcha key="'6LcW4BQTAAAAAFPnSYXGvVJ3n4gscxnUThlGcRYL'"></div>
	</div>

	<!-- separator -->
	<div class="form-group">
		<hr/>
	</div>
	
	<g:submitButton name="submit" class="btn btn-primary" value="${message(code: 'contact.submit')}" ng-disabled="contact.\$invalid"/>
</g:form>
</body>
</html>

