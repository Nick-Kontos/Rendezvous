<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Employee Manager</title>
</head>
<body>
	<div class="body">
		<div class="row">
			<h1>
				Welcome,
				${employee.firstName+" "+employee.lastName}
			</h1>
			<hr>
			<g:link controller="employeeManager" action="salesReport"
				class="menuTile"><i class="fa fa-dollar"></i><p>Sales Report</p></g:link>
			<g:link controller="employeeManager" action="allUsers"
				class="menuTile"><i class="fa fa-group"></i><p>All Users</p></g:link>
			<g:link controller="employeeManager" action="calendarDateStats"
				class="menuTile"><i class="fa fa-calendar"></i><p>Calendar Dates</p></g:link>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-4">
			<h3>Most Active</h3>
			<ul>
				<g:each in="${mostActiveUsers}" var="u">
					<li><g:link controller="employeeManager"
							action="viewUserDetail" id="${u.ssn}">
							${u.ssn }&nbsp;${u.firstName+" "+u.lastName}
						</g:link></li>
				</g:each>
			</ul>
		</div>
		<div class="col-lg-4">
			<h3>Highest Revenue</h3>
			<ul>
				<g:each in="${mostRevenueUsers}" var="u" status="i">
					<li><g:link controller="employeeManager"
							action="viewUserDetail" id="${u.ssn}">
							${u.ssn }&nbsp;${u.firstName+" "+u.lastName} (<g:formatNumber
								number="${mostRevenueRevenues.get(i)}" format="\$###,##0.00" />)</g:link>
					</li>
				</g:each>
			</ul>
		</div>
		<div class="col-lg-4">
			<h3>Highest Rated Calendar Dates</h3>
			<ul>
				<g:each in="${highestRatedDates}" var="d">
					<li>
						${d}
					</li>
				</g:each>
			</ul>
		</div>
	</div>
</body>
</html>