
<%@ page import="information.Profile"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'profile.label', default: 'Profile')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div class="row">
		<div class="col-xs-4">pic</div>
		<div class="col-xs-8">
			<div class="panel">
				<div class="row">
				<div class="col-xs-6">Profile Name</div>
				<div class="col-xs-6">${profile.profileId}</div>
				<div class="col-xs-6">Gender</div>
				<div class="col-xs-6">${profile.mf}</div>
				<div class="col-xs-6">Profile Updated</div>
				<div class="col-xs-6">${profile.lastModDate}</div>
				<div class="col-xs-6">Height</div>
				<div class="col-xs-6">${profile.height}</div>
				<div class="col-xs-6">Weight</div>
				<div class="col-xs-6">${profile.weight}</div>
				<div class="col-xs-6">Hobbies</div>
				<div class="col-xs-6">${profile.hobbies}</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
