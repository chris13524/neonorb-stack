<html xmlns:g="http://www.w3.org/1999/xhtml">
<head>
	<title>
		<g:message code="account.title"/>
	</title>
	<meta name="layout" content="main"/>

	<asset:javascript src="bootstrap-tabcollapse.js"/>
	<script>
		function getCurrentUsername() {return '${raw(session.user?.username)}';}
		function getCurrentEmail() {return '${raw(session.user?.email)}';}
	</script>
	<asset:javascript src="credentials-check.js"/>
	<asset:javascript src="account.js"/>
</head>
<body>
<h1>
	<g:message code="account.header"/>
</h1>
<header class="navbar">
	<ul class="nav nav-tabs nav-stacked" id="myTab">
		<li class="nav-item">
			<a class="nav-link" data-toggle="tab" href="#general">
				<g:message code="account.general"/>
			</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="tab" href="#email">
				<g:message code="account.email"/>
			</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" data-toggle="tab" href="#password">
				<g:message code="account.password"/>
			</a>
		</li>
	</ul>
</header>
<div id="myTabContent" class="tab-content hidden-xs" ng-controller="account" style="padding: 1em">
	<!-- general -->
	<div class="tab-pane" id="general">
		<g:set var="form" value="generalForm" scope="request"/>
		<form name="${form}" ng-submit="generalSubmit()">
			<g:include view="/user/usernamefield.gsp"/>
			
			<!-- submit -->
			<div class="form-group">
				<input
						type="submit"
						class="btn btn-default btn-success"
						value="${message(code: 'account.general.change')}"
						ng-disabled="${form}.$invalid || ${form}.username.$pending.usernameAvailable"/>
			</div>
		</form>
	</div>

	<!-- email -->
	<div class="tab-pane" id="email">
		<p>
			<g:message code="account.email.current"/>
			{{currentEmail}}
		</p>
		<g:set var="form" value="emailForm" scope="request"/>
		<g:form name="${form}" mapping="account">
			<g:include view="/user/emailfield.gsp"/>
			
			<!-- submit -->
			<div class="form-group">
				<g:submitButton
						name="submit"
						class="btn btn-default btn-success"
						value="${message(code: 'account.email.change')}"
						ng-disabled="${form}.\$invalid || ${form}.email.\$pending.emailAvailable"/>
			</div>
		</g:form>
	</div>

	<!-- password -->
	<div class="tab-pane" id="password">
		<g:set var="form" value="passwordForm" scope="request"/>
		<g:form name="${form}" mapping="account">
			<g:include view="/user/passwordfield.gsp"/>
			
			<!-- submit -->
			<div class="form-group">
				<g:submitButton
						name="submit"
						class="btn btn-default btn-success"
						value="${message(code: 'account.password.change')}"
						ng-disabled="${form}.\$invalid"/>
			</div>
		</g:form>
	</div>
	<script>
			var changeWidth = function(){
				if ( $(window).width() < 500 ){
					$('#myTab').removeClass('nav-tabs').addClass('nav-pills').addClass('nav-stacked').addClass('card').css('padding', '0.5em');
				} else {
					$('#myTab').removeClass('nav-pills').removeClass('nav-stacked').removeClass('card').css('padding', '0em').addClass('nav-tabs');
				}
			};
			$(window).resize(changeWidth);
			changeWidth();
		
		$('#myTab a:first').tab('show');
	</script>
</div>
</body>
</html>
