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
				class="menuTile"><i class="fa fa-calendar"></i><p>Record Date</p></g:link>
			<g:link controller="customerRepresentative" action="customerMenu"
				class="menuTile"><i class="fa fa-user"></i><p>Customer Information</p></g:link>
			<g:link controller="customerRepresentative" action="mailingList"
				class="menuTile"><i class="fa fa-envelope"></i><p>Mailing List</p></g:link>
			<g:link controller="customerRepresentative" action="viewProfileSuggestions"
				class="menuTile"><i class="fa fa-group"></i><p>View A Profile</p></g:link>
		</div>
		<div class="row">
			<div class="col-lg-12"></div>
		</div>
	</div>
</body>
</html>