<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Employee Manager</title>
</head>
<body>
	<div class="body">
		<h1>
			Welcome,
			${employee.firstName+" "+employee.lastName}
		</h1>
		<hr>
		<g:link controller="employeeManager" action="salesReport"
			class="menuTile">sales report</g:link>
		<g:link controller="employeeManager" action="allUsers"
			class="menuTile">all users</g:link>
		<g:link controller="employeeManager" action="calendarDateStats"
			class="menuTile">calendar dates</g:link>
	</div>
</body>
</html>