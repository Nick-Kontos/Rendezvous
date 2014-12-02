
<%@ page import="dating_system.UserDate"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'userDate.label', default: 'Dates')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<h1>Your Suggestions</h1>
	<table class="table table-striped">
		<tr>
			<th>Profile</th>
			<th>Age</th>
			<th>Hobbies</th>
		</tr>
		<g:each in="${suggestions }">
			<tr>
				<td><g:link controller="profile" action="show" id="${it.profileId }">${it.profileId }</g:link></td>
				<td>${it.age }</td>
				<td>${it.hobbies }</td>
				<!--  -->
			</tr>
		</g:each>
	</table>
</body>
</html>
