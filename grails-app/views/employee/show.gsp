
<%@ page import="information.Employee" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'employee.label', default: 'Employee')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-employee" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ul class="property-list employee">
			
			
				<g:if test="${employeeInstance?.ssn}">
				<li class="fieldcontain">
					<span id="ssn-label" class="property-label"><g:message code="employee.ssn.label" default="Ssn" /></span>
					
						<span class="property-value" aria-labelledby="ssn-label"><g:fieldValue bean="${employeeInstance}" field="ssn"/></span>
					
				</li>
				</g:if>
				<g:if test="${employeeInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="employee.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${employeeInstance}" field="email"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${employeeInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="employee.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${employeeInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
				<g:if test="${employeeInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="employee.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${employeeInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
				<g:if test="${employeeInstance?.role}">
				<li class="fieldcontain">
					<span id="role-label" class="property-label"><g:message code="employee.role.label" default="Role" /></span>
					
						<span class="property-value" aria-labelledby="role-label"><g:fieldValue bean="${employeeInstance}" field="role"/></span>
					
				</li>
				</g:if>
				<g:if test="${employeeInstance?.hourlyRate}">
				<li class="fieldcontain">
					<span id="hourlyRate-label" class="property-label"><g:message code="employee.hourlyRate.label" default="Hourly Rate" /></span>
					
						<span class="property-value" aria-labelledby="hourlyRate-label">$<g:fieldValue bean="${employeeInstance}" field="hourlyRate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${employeeInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="employee.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${employeeInstance?.startDate}" format="MM/dd/yyyy" /></span>
					
				</li>
				</g:if>
			
			
				<g:if test="${employeeInstance?.street}">
				<li class="fieldcontain">
					<span id="street-label" class="property-label"><g:message code="employee.street.label" default="Street" /></span>
					
						<span class="property-value" aria-labelledby="street-label"><g:fieldValue bean="${employeeInstance}" field="street"/></span>
					
				</li>
				</g:if>
				<g:if test="${employeeInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="employee.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${employeeInstance}" field="city"/></span>
					
				</li>
				</g:if>
				<g:if test="${employeeInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="employee.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${employeeInstance}" field="state"/></span>
					
				</li>
				</g:if>
				<g:if test="${employeeInstance?.zipCode}">
				<li class="fieldcontain">
					<span id="zipCode-label" class="property-label"><g:message code="employee.zipCode.label" default="Zip Code" /></span>
					
						<span class="property-value" aria-labelledby="zipCode-label">${employeeInstance.zipCode }</span>
					
				</li>
				</g:if>
				<g:if test="${employeeInstance?.telephone}">
				<li class="fieldcontain">
					<span id="telephone-label" class="property-label"><g:message code="employee.telephone.label" default="Telephone" /></span>
					
						<span class="property-value" aria-labelledby="telephone-label"><g:fieldValue bean="${employeeInstance}" field="telephone"/></span>
					
				</li>
				</g:if>
			
			</ul>
			<g:form url="[resource:employeeInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit btn btn-primary" action="edit" id="${employeeInstance.ssn }"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
