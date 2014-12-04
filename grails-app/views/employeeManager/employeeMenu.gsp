<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Employee Menu</title>
<script type="text/javascript">
	$(function() {
		$("#viewEmployeeButton").click(
				function() {
					bootbox.prompt("Enter employee's SSN: ", function(ssn) {
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
				<h1>Select An Employee Action</h1>
				<hr>
				<g:link controller="employee" action="create" class="menuTile"><i class="fa fa-plus"></i><p>Add Employee</p></g:link>
				<a id="viewEmployeeButton" class="menuTile" href="#"><i class="fa fa-user"></i><p>View Employee</p></a>
			</div>
		</div>
		<g:form name="showForm" controller="employee" action="show">
		</g:form>
	</div>
</body>
</html>