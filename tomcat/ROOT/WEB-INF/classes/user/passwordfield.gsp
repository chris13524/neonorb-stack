<div class="form-group
		{{${form}.password.$touched &&
		${form}.password.$invalid
		? 'has-danger' : ''}}">
	<g:message class="form-control-label" code="password.name"/>
	<span
			class="pull-xs-right"
			style="color: red"
			ng-show="
						${form}.password.$touched &&
						${form}.password.$error.required">
		<g:message code="password.required"/>
	</span>
	<g:passwordField
			class="form-control form-control-danger"
			name="password"
			placeholder="${message(code: 'password.name')}"
			ng-model="password"
			ng-model-options="{debounce: $debounce}"
			required=""/>
</div>
<div class="form-group
			{{${form}.confirmPassword.$touched &&
			${form}.confirmPassword.$invalid
			? 'has-danger' : ''}}">
	<g:message class="form-control-label" code="confirmPassword.name"/>
	<span
			class="pull-xs-right"
			style="color: red"
			ng-show="${form}.confirmPassword.$touched">
		<span ng-show="${form}.confirmPassword.$error.required">
			<g:message code="confirmPassword.required"/>
		</span>
		<span ng-show="${form}.confirmPassword.$error.equalTo">
			<g:message code="confirmPassword.wrong"/>
		</span>
	</span>
	<g:passwordField
			name="confirmPassword"
			class="form-control form-control-danger"
			placeholder="${message(code: 'confirmPassword.name')}"
			ng-model="confirmPassword"
			equal-to="${form}.password"/>
</div>