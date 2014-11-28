
<%@ page import="information.Profile"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'profile.profileId', default: 'Profile')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<g:if test="${profileOwner}">
		<div class="row">
			<div class="col-xs-4">
				<g:link controller="profile" action="edit" class="btn btn-primary">Edit</g:link>
			</div>
		</div>
	</g:if>
	<div class="row">
		<div class="col-xs-4">pic</div>
		<div class="col-xs-8">
			<div class="panel">
				<div class="row">
					<div class="col-xs-6">Profile Name</div>
					<div class="col-xs-6">
						${profile.profileId}
					</div>
					<div class="col-xs-6">Gender</div>
					<div class="col-xs-6">
						${profile.mf}
					</div>
					<div class="col-xs-6">Profile Updated</div>
					<div class="col-xs-6">
						<g:formatDate format="MMMM dd, yyyy" date="${profile.lastModDate}" />
					</div>
					<div class="col-xs-6">Height</div>
					<div class="col-xs-6">
						${profile.height}(ft)
					</div>
					<div class="col-xs-6">Weight</div>
					<div class="col-xs-6">
						${profile.weight}(lbs)
					</div>
					<div class="col-xs-6">Hobbies</div>
					<div class="col-xs-6">
						${profile.hobbies}
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
