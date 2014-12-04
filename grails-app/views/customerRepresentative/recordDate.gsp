<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Record Date</title>
</head>
<body>
	<div class="body">
		<div class="row">
			<div class="col-lg-12">
			<h1>Pending Dates</h1>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Date</th>
							<th>Profile1</th>
							<th>Profile2</th>
							<th>Location</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<g:each in="${dateList}" status="i" var="u">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								<td><g:formatDate date="${u.dateTime}"
										format="MM/dd/yyyy - hh:mm a" /></td>
								<td>
									${u.profile1}
								</td>
								<td>
									${u.profile2}
								</td>
								<td>
									${u.location}
								</td>
								<td><g:link action="adoptDateForm"
										class="btn btn-success btn-sm" title="Adopt Date"
										params="[date:u.dateTime,profile1:u.profile1,profile2:u.profile2]">
										<i class="fa fa-book"></i>
									</g:link></td>
							</tr>
						</g:each>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>