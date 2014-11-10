
<%@ page import="dating_system.Referral" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'referral.label', default: 'Referral')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-referral" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-referral" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list referral">
			
				<g:if test="${referralInstance?.dateTime}">
				<li class="fieldcontain">
					<span id="dateTime-label" class="property-label"><g:message code="referral.dateTime.label" default="Date Time" /></span>
					
						<span class="property-value" aria-labelledby="dateTime-label"><g:formatDate date="${referralInstance?.dateTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${referralInstance?.profileA}">
				<li class="fieldcontain">
					<span id="profileA-label" class="property-label"><g:message code="referral.profileA.label" default="Profile A" /></span>
					
						<span class="property-value" aria-labelledby="profileA-label"><g:link controller="profile" action="show" id="${referralInstance?.profileA?.id}">${referralInstance?.profileA?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${referralInstance?.profileB}">
				<li class="fieldcontain">
					<span id="profileB-label" class="property-label"><g:message code="referral.profileB.label" default="Profile B" /></span>
					
						<span class="property-value" aria-labelledby="profileB-label"><g:link controller="profile" action="show" id="${referralInstance?.profileB?.id}">${referralInstance?.profileB?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${referralInstance?.profileC}">
				<li class="fieldcontain">
					<span id="profileC-label" class="property-label"><g:message code="referral.profileC.label" default="Profile C" /></span>
					
						<span class="property-value" aria-labelledby="profileC-label"><g:link controller="profile" action="show" id="${referralInstance?.profileC?.id}">${referralInstance?.profileC?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:referralInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${referralInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
