<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'employee.label', default: 'Employee')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
</head>
<body>
	
	<div id="create-employee" class="content scaffold-create" role="main">
		<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${employeeInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${employeeInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:form url="[resource:employeeInstance, action:'save']">
			<fieldset class="form">

				<div
					class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'ssn', 'error')} required">
					<label for="ssn"> <g:message code="employee.ssn.label"
							default="Ssn" /> <span class="required-indicator">*</span>
					</label>
					<g:textField name="ssn" required=""
						value="${employeeInstance?.ssn}" />

				</div>
				<div
					class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'password', 'error')} required">
					<label for="password"> <g:message
							code="employee.password.label" default="Password" /> <span
						class="required-indicator">*</span>
					</label>
					<g:textField name="password" required=""
						value="${employeeInstance?.password}" />

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
