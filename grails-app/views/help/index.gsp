
<!DOCTYPE html>
<html>
<head>
<g:loggedIn>
	<meta name="layout" content="main">
</g:loggedIn>
<g:notLoggedIn>
	<meta name="layout" content="restrict">
</g:notLoggedIn>
<title>Help</title>
</head>
<body>
	<h1>Help Page</h1>
	<g:isEmployee>
		<g:render template="/help/custRepHelp"></g:render>
	</g:isEmployee>
	<g:isManager>
		<g:render template="/help/managerHelp"></g:render>
	</g:isManager>
	<g:isUser>

	</g:isUser>
</body>
</html>
