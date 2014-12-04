<%@ page import="dating_system.UserDate"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Date Request</title>
</head>
<body>
	<g:form role="form" controller="userDate" action="requestDate">
		<div class="form group">
			<label for="date">Select a day and time for the date: </label>
			<g:datePicker id="date" name="date"/>
		</div>
		<div class="form group">
			<label for="location">Enter a location: </label>
			<g:textField id="location" name="location"/>
		</div>
		<g:hiddenField name="profile2" value="${profile2 }"/>
		<div class="form-group">
				<button type="submit" class="btn btn-default btn-lg btn-block">Submit</button>
			</div>
	</g:form>
</body>