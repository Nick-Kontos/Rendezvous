<%@ page import="information.Profile"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Search Profiles</title>
</head>
<body>
	<g:form role="form" controller="profile" action="search">
		<div class="form-group">
			<label for="InputId">Enter profile ID:</label>
			<g:textField name="InputId" type="text" class="form-control"
				id="InputId" />
		</div>
		<div class="form-group">
			<label for="InputGender">Enter gender:</label>
			<g:select name="InputGender" class="form-control" id="InputGender"
				from="${['Male', 'Female']}" />
		</div>
		<div class="form-group">
			<label for="InputHobby">Enter hobby:</label>
			<g:textField name="InputHobby" type="text" class="form-control"
				id="InputHobby" />
		</div>
		<div class="form-group">
			<label for="InputMinAge">Enter minimum age:</label>
			<g:field name="InputMinAge" type="number" class="form-control"
				id="InputMinAge" />
		</div>
		<div class="form-group">
			<label for="InputMaxAge">Enter maximum age:</label>
			<g:field name="InputMaxAge" type="number" class="form-control"
				id="InputMaxAge" />
		</div>
		<div class="form-group">
			<label for="InputHair">Enter hair color:</label>
			<g:textField name="InputHair" type="text" class="form-control"
				id="InputHair" />
		</div>
		<div class="form-group">
			<label for="InputMinWeight">Enter minimum weight:</label>
			<g:field name="InputMinWeight" type="number" class="form-control"
				id="InputMinWeight" />
		</div>
		<div class="form-group">
			<label for="InputMaxWeight">Enter maximum weight:</label>
			<g:field name="InputMaxWeight" type="number" class="form-control"
				id="InputMaxWeight" />
		</div>
		<div class="form-group">
			<label for="InputMinHeight">Enter minimum height:</label>
			<g:field name="InputMinHeight" type="number" class="form-control"
				id="InputMinHeight" />
		</div>
		<div class="form-group">
			<label for="InputMaxHeight">Enter maximum height:</label>
			<g:field name="InputMaxHeight" type="number" class="form-control"
				id="InputMaxHeight" />
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-default btn-lg btn-block">Search</button>
		</div>
	</g:form>
</body>