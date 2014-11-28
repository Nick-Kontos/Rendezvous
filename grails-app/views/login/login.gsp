<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<g:set var="hideSidebar" value="true" scope="request"  />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Login</title>
</head>
<body>
<div class="page-content">

	<div class="row">
		<div class="col-xs-4"></div>
		<div class="col-xs-4">
		<g:if test="${params.error}">
		Invalid username/password
		</g:if>
			<g:form class="form-signin" role="form" controller="login" action="auth">
			<g:hiddenField name="requestUri" value="${requestUri }"/>
				<h2 class="form-signin-heading">Please sign in</h2>
				<input type="text" name="ssn" class="form-control" placeholder="SSN"
					required autofocus> <input type="password" name="password"
					class="form-control" placeholder="Password" required>
				<button class="btn btn-lg btn-success btn-block" type="submit">Sign
					in</button>
			</g:form>

		</div>
		<div class="col-xs-4"></div>
	</div>
	</div>
</body>
</html>