<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Rendezvous" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}"
	type="image/x-icon">
<g:javascript library="jquery" plugin="jquery" />
<asset:stylesheet src="bootstrap.css" />
<asset:stylesheet src="main.css" />
<asset:stylesheet src="font-awesome.min.css" />
<asset:javascript src="bootbox.min.js" />
<asset:javascript src="bootstrap.min.js" />
<g:layoutHead />
</head>
<body>
	<div class="container">
		<div id="RendezvousLogo" role="banner">
			<a><asset:image src="rendezvous_logo.png"
					alt="Rendezvous" /></a><input type="text" placeholder="Search">
			<g:profileSelector></g:profileSelector>
			<g:loggedIn>
				<g:link controller="login" action="logout" class="pull-right logoutButton">logout</g:link>
			</g:loggedIn>
			<g:isUser>
			<g:link controller="user" action="edit" class="pull-right" style="padding-right:10px">My Account</g:link>
			</g:isUser>
		</div>
		
		<div class="row">
			<div id="sideNavbar" class="col-xs-2 sidebar">
				<g:sidebar></g:sidebar>
			</div>
			<div class="col-lg-10">
				<div class="col-lg-12 contentBody">
					<g:layoutBody />
				</div>
			</div>
		</div>
		
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display: none;">
			<g:message code="spinner.alt" default="Loading&hellip;" />
		</div>
	</div>
</body>
</html>
