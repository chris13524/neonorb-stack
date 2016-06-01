<div class="form-group
		{{${form}.email.$touched &&
		${form}.email.$invalid
		? 'has-danger' : ''}}">
	<g:message class="form-control-label" code="email.name"/>
	<span class="pull-xs-right">
		<span ng-show="${form}.email.$pending.emailAvailable">
			<g:message code="email.checking"/>
		</span>
		<span style="color: red" 
				ng-show="${form}.email.$touched">
			<span ng-show="${form}.email.$error.required">
				<g:message code="email.required"/>
			</span>
			<span ng-show="${form}.email.$error.pattern">
				<g:message code="email.invalid"/>
			</span>
			<span ng-show="${form}.email.$error.emailAvailable">
				<g:message code="email.exists"/>
			</span>
		</span>
	</span>
	<g:textField
			name="email"
			class="form-control form-control-danger"
			placeholder="${message(code: 'email.name')}"
			ng-model="email"
			ng-model-options="{debounce: $debounce}"
			required=""
			email-available="${form}.email"
			ng-pattern="/$emailRegex/"/>
</div>
<div class="form-group
		{{${form}.confirmEmail.$touched &&
		${form}.confirmEmail.$invalid
		? 'has-danger' : ''}}">
	<g:message class="form-control-label" code="confirmEmail.name"/>
	<span
			class="pull-xs-right"
			style="color: red"
			ng-show="${form}.confirmEmail.$touched">
		<span ng-show="${form}.confirmEmail.$error.required">
			<g:message code="confirmEmail.required"/>
		</span>
		<span ng-show="${form}.confirmEmail.$error.equalTo">
			<g:message code="confirmEmail.wrong"/>
		</span>
	</span>
	<g:textField
			name="confirmEmail"
			class="form-control form-control-danger"
			placeholder="${message(code: 'confirmEmail.name')}"
			ng-model="confirmEmail"
			equal-to="${form}.email"/>
</div>