
<%@ page import="dating_system.Likes"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'likes.label', default: 'Likes')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<h1>People Who You Have Liked</h1>
	<table class="table table-striped">
		<tr>
			<th>Profile</th>
			<th>Date</th>
		</tr>
		<g:each in="${yLike}">
			<tr>
				<td>
				<g:link controller="profile" action="show" id="${it?.likee}">${it?.likee}</g:link>
				</td>
				<td>
					${it?.dateTime}
				</td>
			</tr>
		</g:each>
	</table>
	<h1>People Who Like You</h1>
	<table class="table table-striped">
		<tr>
			<th>Profile</th>
			<th>Date</th>
		</tr>
		<g:each in="${lYou}">
			<tr>
				<td>
				<g:link controller="profile" action="show" id="${it?.liker}">${it?.liker}</g:link>
				</td>
				<td>
					${it?.dateTime}
				</td>
			</tr>
		</g:each>
	</table>
</body>
</html>
