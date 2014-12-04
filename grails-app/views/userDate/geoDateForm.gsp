<%@ page import="dating_system.UserDate"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Geo Date</title>
</head>
<body>
	<g:form role="form" controller="userDate" action="geoDate">
		<div class="form group">
			<label for="date">Enter your longitude: </label>
			<g:field type="number" id="longitude" name="longitude"
				class="form group" />
		</div>
		<div class="form group">
			<label for="date">Enter your latitude: </label>
			<g:field type="number" id="latitude" name="latitude"
				class="form group" />
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-default btn-lg btn-block">Search</button>
		</div>
	</g:form>
</body>