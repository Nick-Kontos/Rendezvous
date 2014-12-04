<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="restrict">
<g:set var="entityName"
	value="${message(code: 'profile.label', default: 'Profile')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	<div id="create-profile" class="content scaffold-create" role="main">

		<div>
			<g:link controller="app">Back</g:link>
		</div>
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${profileInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${profileInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form url="[resource:profileInstance, action:'save']">
			<fieldset class="form">
				<div
					class="fieldcontain ${hasErrors(bean: profileInstance, field: 'profileId', 'error')} required">
					<label for="profileId"> <g:message
							code="profile.profileId.label" default="Profile Id" /> <span
						class="required-indicator">*</span>
					</label>
					<g:textField name="profileId" required=""
						value="${profileInstance?.profileId}" />

				</div>
				<g:render template="form" />
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="create" class="save btn btn-primary"
					value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
