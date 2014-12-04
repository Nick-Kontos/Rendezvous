<%@ page import="information.Profile"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Search Results</title>
</head>
<body>
	<table class="table table-striped">
		<tr>
			<th>Profile</th>
			<th>Age</th>
			<th>Gender</th>
			<th>Hobbies</th>
			<th>Height</th>
			<th>Weight</th>
		</tr>
		<g:each in="${resultList }">
			<tr>
				<td><g:link controller="profile" action="show" id="${it?.profileId }">${it?.profileId }</g:link></td>
				<td>${it?.age }</td>
				<td>${it?.mf }</td>
				<td>${it?.hobbies }</td>
				<td>${it?.height }</td>
				<td>${it?.weight }</td>
			</tr>
		</g:each>
	</table>
</body>