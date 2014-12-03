<%@ page import="information.Profile"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Refer List</title>
</head>
<body>
	<table class="table table-striped">
		<tr>
			<th>Action</th>
			<th>Profile</th>
			<th>Profile Age</th>
			<th>Profile Hobbies</th>
		</tr>
		<g:each in="${profileList }">
			<tr>
				<td><g:link controller="referral" action="refer" class="btn btn-primary"
				 params="${[profileB: profileB, profileC: it?.profileId]}">Refer</g:link></td>
				 <td>${it?.profileId }</td>
				 <td>${it?.age }</td>
				 <td>${it?.hobbies }</td>
			</tr>
		</g:each>
	</table>
</body>