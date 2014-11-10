
<%@ page import="dating_system.UserDate" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userDate.label', default: 'UserDate')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userDate" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userDate" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userDate">
			
				<g:if test="${userDateInstance?.bookingFee}">
				<li class="fieldcontain">
					<span id="bookingFee-label" class="property-label"><g:message code="userDate.bookingFee.label" default="Booking Fee" /></span>
					
						<span class="property-value" aria-labelledby="bookingFee-label"><g:fieldValue bean="${userDateInstance}" field="bookingFee"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDateInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="userDate.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue bean="${userDateInstance}" field="comments"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDateInstance?.custRep}">
				<li class="fieldcontain">
					<span id="custRep-label" class="property-label"><g:message code="userDate.custRep.label" default="Cust Rep" /></span>
					
						<span class="property-value" aria-labelledby="custRep-label"><g:link controller="employee" action="show" id="${userDateInstance?.custRep?.id}">${userDateInstance?.custRep?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDateInstance?.dateTime}">
				<li class="fieldcontain">
					<span id="dateTime-label" class="property-label"><g:message code="userDate.dateTime.label" default="Date Time" /></span>
					
						<span class="property-value" aria-labelledby="dateTime-label"><g:formatDate date="${userDateInstance?.dateTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDateInstance?.location}">
				<li class="fieldcontain">
					<span id="location-label" class="property-label"><g:message code="userDate.location.label" default="Location" /></span>
					
						<span class="property-value" aria-labelledby="location-label"><g:fieldValue bean="${userDateInstance}" field="location"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDateInstance?.profile1}">
				<li class="fieldcontain">
					<span id="profile1-label" class="property-label"><g:message code="userDate.profile1.label" default="Profile1" /></span>
					
						<span class="property-value" aria-labelledby="profile1-label"><g:link controller="profile" action="show" id="${userDateInstance?.profile1?.id}">${userDateInstance?.profile1?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDateInstance?.profile2}">
				<li class="fieldcontain">
					<span id="profile2-label" class="property-label"><g:message code="userDate.profile2.label" default="Profile2" /></span>
					
						<span class="property-value" aria-labelledby="profile2-label"><g:link controller="profile" action="show" id="${userDateInstance?.profile2?.id}">${userDateInstance?.profile2?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDateInstance?.user1Rating}">
				<li class="fieldcontain">
					<span id="user1Rating-label" class="property-label"><g:message code="userDate.user1Rating.label" default="User1 Rating" /></span>
					
						<span class="property-value" aria-labelledby="user1Rating-label"><g:fieldValue bean="${userDateInstance}" field="user1Rating"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userDateInstance?.user2Rating}">
				<li class="fieldcontain">
					<span id="user2Rating-label" class="property-label"><g:message code="userDate.user2Rating.label" default="User2 Rating" /></span>
					
						<span class="property-value" aria-labelledby="user2Rating-label"><g:fieldValue bean="${userDateInstance}" field="user2Rating"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:userDateInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userDateInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
