<div class="form-group
		{{${form}.username.$touched &&
		${form}.username.$invalid
		? 'has-danger' : ''}}">
	<g:message class="form-control-label" code="username.name"/>
	<span class="pull-xs-right">
		<span ng-show="${form}.username.$pending.usernameAvailable">
			<g:message code="username.checking"/>
		</span>
		<span style="color: red">
			<span ng-show="${form}.username.$error.usernameAvailable">
				<g:message code="username.exists"/>
			</span>
			<span ng-show="${form}.username.$touched">
				<span ng-show="${form}.username.$error.required">
					<g:message code="username.required"/>
				</span>
			</span>
		</span>
	</span>
	<g:textField
			name="username"
			class="form-control form-control-danger"
			placeholder="${message(code: 'username.name')}"
			ng-model="username"
			ng-model-options="{updateOn: 'default blur', debounce: {'default': $debounce, 'blur': 0}}"
			autofocus=""
			required=""
			username-available="${form}.username"/>
</div>