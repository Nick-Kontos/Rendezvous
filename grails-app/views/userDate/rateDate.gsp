<%@ page import="dating_system.UserDate"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Rate Date</title>
</head>
<body>
<h1>Rate Date</h1>
	<g:form role="form" controller="userDate" action="updateRating">
		<div class="form group">
			<g:hiddenField name="profile1" value="${date?.profile1 }" />
			<g:hiddenField name="profile2" value="${date?.profile2 }" />
			<g:hiddenField name="dateTime" value="${date?.dateTime }" />
			<div><label>Rating</label><g:select from="${[1,2,3,4,5] }" name="rating"/></div>
			<div><label>Comments</label><g:textField name="comments"/></div>
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-primary">Submit</button>
		</div>
	</g:form>
</body>