
<%@ page import="dating_system.Referral"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Referrals</title>
</head>
<body>
	<h1>My Referrals</h1>
	<table class="table table-striped">
			<tr>
				<th>Profile</th>
				<th>Referrer</th>
				<th>Date Referred</th>
			</tr>
		<g:each in="${referralList}">
			<tr>
				<td>
					<g:link controller="profile" action="show" id="${it?.profileB }">${it.profileB}</g:link>
				</td>
				<td>
					<g:link controller="profile" action="show" id="${it?.profileA }">${it.profileA}</g:link>
				</td>
				<td>
					${it.dateTime}
				</td>
			</tr>
		</g:each>
	</table>
	<h1>History of Profiles Referred</h1>
	<table class="table table-striped">
			<tr>
				<th>Referred</th>
				<th>Referred To</th>
				<th>Date Referred</th>
			</tr>
		<g:each in="${myReferredList}">
			<tr>
				<td>
					<g:link controller="profile" action="show" id="${it?.profileB }">${it.profileB}</g:link>
				</td>
				<td>
					<g:link controller="profile" action="show" id="${it?.profileC }">${it.profileC}</g:link>
				</td>
				<td>
					${it.dateTime}
				</td>
			</tr>
		</g:each>
	</table>
</body>
</html>
