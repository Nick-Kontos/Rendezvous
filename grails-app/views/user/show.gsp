
<%@ page import="information.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
			
				<g:if test="${userInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="user.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${userInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.dateOfLastAct}">
				<li class="fieldcontain">
					<span id="dateOfLastAct-label" class="property-label"><g:message code="user.dateOfLastAct.label" default="Date Of Last Act" /></span>
					
						<span class="property-value" aria-labelledby="dateOfLastAct-label"><g:formatDate date="${userInstance?.dateOfLastAct}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="user.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.firstName}">
				<li class="fieldcontain">
					<span id="firstName-label" class="property-label"><g:message code="user.firstName.label" default="First Name" /></span>
					
						<span class="property-value" aria-labelledby="firstName-label"><g:fieldValue bean="${userInstance}" field="firstName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.lastName}">
				<li class="fieldcontain">
					<span id="lastName-label" class="property-label"><g:message code="user.lastName.label" default="Last Name" /></span>
					
						<span class="property-value" aria-labelledby="lastName-label"><g:fieldValue bean="${userInstance}" field="lastName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.password}">
				<li class="fieldcontain">
					<span id="password-label" class="property-label"><g:message code="user.password.label" default="Password" /></span>
					
						<span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${userInstance}" field="password"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.ppp}">
				<li class="fieldcontain">
					<span id="ppp-label" class="property-label"><g:message code="user.ppp.label" default="Ppp" /></span>
					
						<span class="property-value" aria-labelledby="ppp-label"><g:fieldValue bean="${userInstance}" field="ppp"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.rating}">
				<li class="fieldcontain">
					<span id="rating-label" class="property-label"><g:message code="user.rating.label" default="Rating" /></span>
					
						<span class="property-value" aria-labelledby="rating-label"><g:fieldValue bean="${userInstance}" field="rating"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.ssn}">
				<li class="fieldcontain">
					<span id="ssn-label" class="property-label"><g:message code="user.ssn.label" default="Ssn" /></span>
					
						<span class="property-value" aria-labelledby="ssn-label"><g:fieldValue bean="${userInstance}" field="ssn"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="user.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${userInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.street}">
				<li class="fieldcontain">
					<span id="street-label" class="property-label"><g:message code="user.street.label" default="Street" /></span>
					
						<span class="property-value" aria-labelledby="street-label"><g:fieldValue bean="${userInstance}" field="street"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.telephone}">
				<li class="fieldcontain">
					<span id="telephone-label" class="property-label"><g:message code="user.telephone.label" default="Telephone" /></span>
					
						<span class="property-value" aria-labelledby="telephone-label"><g:fieldValue bean="${userInstance}" field="telephone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.zipCode}">
				<li class="fieldcontain">
					<span id="zipCode-label" class="property-label"><g:message code="user.zipCode.label" default="Zip Code" /></span>
					
						<span class="property-value" aria-labelledby="zipCode-label"><g:fieldValue bean="${userInstance}" field="zipCode"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
