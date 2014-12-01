<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>User Detail</title>
</head>
<body>
	<div class="body">
		<h1>
			${user?.firstName+" "+user?.lastName}
		</h1>
		<hr>
		<div class="row">
			<div class="col-lg-8">
				<h3>Information</h3>
				<div class="col-lg-2">Address:</div>
				<div class="col-lg-10">
					${user.street+", "+user.city+", "+user.state+" "+user.zipCode}
				</div>
				<div class="col-lg-2">Telephone:</div>
				<div class="col-lg-10">
					${user.telephone}
				</div>
				<div class="col-lg-2">Email:</div>
				<div class="col-lg-10">
					${user.email}
				</div>
				<div class="col-lg-2">PPP:</div>
				<div class="col-lg-10">
					${user.ppp}
				</div>
				<div class="col-lg-2">Rating:</div>
				<div class="col-lg-10">
					${user.rating}
				</div>
				<div class="col-lg-2">Last Act:</div>
				<div class="col-lg-10">
					<g:formatDate date="${user.dateOfLastAct}" format="MM/dd/yyyy"/>
				</div>
			</div>
			<div class="col-lg-4">
				<h3>Total Revenue</h3>
				<g:formatNumber number="${user.revenue}" format="\$###,##0.00" />
			</div>
		</div>
		<hr>
		<h3>Dates</h3>
		<table class="table table-striped width-100">
			<thead>
				<tr>
					<th>Date</th>
					<th>Profile1</th>
					<th>Profile2</th>
					<th>Location</th>
					<th>Customer Representative</th>
					<th>Booking Fee</th>
					<th>Profile1 Rating</th>
					<th>Profile2 Rating</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${userDates}" status="i" var="u">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:formatDate date="${u.dateTime}" format="MM/dd/yyyy" />
						</td>
						<td>
							${u.profile1}
						</td>
						<td>
							${u.profile2}
						</td>
						<td>
							${u.location}
						</td>
						<td>
							${u.custRep.firstName+" "+u.custRep.lastName}
						</td>
						<td><g:formatNumber number="${u.bookingFee}"
								format="\$###,##0.00" /></td>
						<td>
							${u.user1Rating}
						</td>
						<td>
							${u.user2Rating}
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>
		<h3>Dated Users</h3>
		<table class="table table-striped width-100">
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${customersDated}" status="i" var="c">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>
							${c.firstName}
						</td>
						<td>
							${c.lastName}
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
</body>
</html>