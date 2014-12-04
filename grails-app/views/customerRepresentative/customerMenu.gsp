<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Customer Menu</title>
<script type="text/javascript">
	$(function() {
		$("#viewUserButton").click(
				function() {
					bootbox.prompt("Enter user's SSN: ", function(ssn) {
						$("#showForm").attr("action",
								($("#showForm").attr("action") + '/' + ssn))
						$("#showForm").submit()
					})
				});
	});
</script>
</head>
<body>
	<div class="body">
		<div class="row">
			<div class="col-lg-12">
				<h1>Select A Customer Action</h1>
				<hr>
				<g:link controller="user" action="create" class="menuTile"><i class="fa fa-plus"></i><p>Add User</p></g:link>
				<a id="viewUserButton" class="menuTile" href="#"><i class="fa fa-user"></i><p>View User</p></a>
			</div>
		</div>
		<g:form name="showForm" controller="user" action="show">
		</g:form>
	</div>
</body>
</html>