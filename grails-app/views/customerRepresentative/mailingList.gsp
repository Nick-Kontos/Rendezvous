<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Mailing List</title>
</head>
<body>
	<div class="body">
		<div class="row">
		<h3>User Mailing List</h3>
			<table class="table table-striped">
				<thead>
					<tr>
						<g:sortableColumn property="firstName" title="First Name" />
						<g:sortableColumn property="lastName" title="Last Name" />
						<th>Address</th>
						<g:sortableColumn property="email" title="Email" />
					</tr>
				</thead>
				<tbody>
					<g:each in="${userList}" status="i" var="u">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">						
							<td>
								${u.firstName}
							</td>
							<td>
								${u.lastName}
							</td>
							<td>
								${u.street+', '+u.city+', '+u.state+' '+u.zipCode}
							</td>
							<td>
								${u.email}
							</td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceCount ?: 0}" />
			</div>
		</div>
	</div>
</body>
</html>