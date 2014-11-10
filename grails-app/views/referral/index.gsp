
<%@ page import="dating_system.Referral"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'referral.label', default: 'Referral')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<h1>My Referrals</h1>
	<table>
		<thead>
			<tr>
				<td>Profile</td>
				<td>Referrer</td>
			</tr>
		</thead>
		<g:each in="${referralInstanceList}" var="r">
			<tr>
				<td>
					${r.profileC}
				</td>
				<td>
					${r.profileA}
				</td>
			</tr>
		</g:each>
	</table>
</body>
</html>
