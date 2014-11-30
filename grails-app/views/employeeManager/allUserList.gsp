<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>All Users</title>
</head>
<body>
	<div class="row">
		<h1>All Users</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<g:sortableColumn property="ssn" title="SSN" />
					<g:sortableColumn property="firstName" title="First Name" />
					<g:sortableColumn property="lastName" title="Last Name" />
					<g:sortableColumn property="email" title="Email" />
					<g:sortableColumn property="ppp" title="PPP" />
					<g:sortableColumn property="rating" title="Rating" />
					<g:sortableColumn property="dateOfLastAct" title="Last Act" />
					<g:sortableColumn property="numDates" title="# Dates" />
					<g:sortableColumn property="revenue" title="Revenue" />
				</tr>
			</thead>
			<tbody>
				<g:each in="${userList}" status="i" var="u">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<td>
					<g:link action="viewUserDetail" id="${u.ssn}">${u.ssn }</g:link>
					</td>
						<td>
							${u.firstName}
						</td>
						<td>
							${u.lastName}
						</td>
						<td>
							${u.email}
						</td>
						<td>
							${u.ppp}
						</td>
						<td>
							${u.rating}
						</td>
						<td>
						<g:formatDate format="mm/dd/yyyy" date="${u.dateOfLastAct}"/>
							
						</td>
						<td>
							${u.numDates}
						</td>
						<td>
							<g:formatNumber number="${u.revenue}" format="\$###,##0.00" />
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${likesInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>
