<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Customer Representative Dashboard</title>
</head>
<body>
	<div class="body">
		<div class="row">
			<h1>
				Welcome,
				${employee.firstName+" "+employee.lastName}
			</h1>
			<hr>
			<g:link controller="customerRepresentative" action="recordDate"
				class="menuTile">Record Date</g:link>
			<g:link controller="customerRepresentative" action="customerMenu"
				class="menuTile">Customer Information</g:link>
			<g:link controller="customerRepresentative" action="mailingList"
				class="menuTile">Mailing List</g:link>
			<g:link controller="customerRepresentative" action="viewProfileSuggestions"
				class="menuTile">View A Profile</g:link>
		</div>
		<div class="row">
			<div class="col-lg-12"></div>
		</div>
	</div>
</body>
</html>