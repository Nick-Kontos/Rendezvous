<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Customer Menu</title>
</head>
<body>
	<div class="body">
		<div class="row">
			<h1>
				Select A Customer Action				
			</h1>
			<hr>
			<g:link controller="user" action="create"
				class="menuTile">Add User</g:link>
			<g:link controller="customerRepresentative" action="viewUser"
				class="menuTile">View/Edit User</g:link>
		</div>
		<div class="row">
			<div class="col-lg-12"></div>
		</div>
	</div>
</body>
</html>