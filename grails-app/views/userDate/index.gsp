
<%@ page import="dating_system.UserDate"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'userDate.label', default: 'Dates')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<h1>My Dates</h1>
	<h3>Upcoming Dates</h3>
	<table class="table table-striped">
		<tr>
			<th>Action</th>
			<th>Profile</th>
			<th>Location</th>
			<th>Customer Representative</th>
			<th>Date</th>
			<th>Booking Fee</th>
			<th>Comments</th>
			<th>Your rating</th>
			<th>Date's rating</th>

		</tr>
		<g:each in="${upcomingDateList }">
			<tr>
				<g:if test="${it?.profile1?.profileId == activeProfileId }">
					<g:if test="${!(it?.accepted) || it?.profile1Paid}">
						<td><g:link type="button" class="btn btn-success"
								disabled="disabled" controller="userDate" action="payDate">Pay</g:link>
							<g:link type="button" class="btn btn-danger"
								controller="userDate" action="cancelDate">Cancel</g:link></td>
					</g:if>
					<g:else>
						<td><g:link type="button" class="btn btn-success"
								controller="userDate" action="payDate">Pay</g:link> <g:link
								type="button" class="btn btn-danger" controller="userDate"
								action="cancelDate">Cancel</g:link></td>
					</g:else>
					<td>
						${it?.profile2 }
					</td>
				</g:if>
				<g:else>
					<g:if test="${!(it?.accepted) || it?.profile2Paid}">
						<td><g:link type="button" class="btn btn-success"
								disabled="disabled" controller="userDate" action="payDate">Pay</g:link>
							<g:link type="button" class="btn btn-danger"
								controller="userDate" action="cancelDate">Cancel</g:link></td>
					</g:if>
					<g:else>
						<td><g:link type="button" class="btn btn-success"
								controller="userDate" action="payDate">Pay</g:link> <g:link
								type="button" class="btn btn-danger" controller="userDate"
								action="cancelDate">Cancel</g:link></td>
					</g:else>
					<td>
						${it?.profile1 }
					</td>
				</g:else>
				<td>
					<g:if test="${it?.profile1Paid && it?.profile2Paid }">
						<td>${it?.location }</td>
					</g:if>
					<g:else>
						<td>Not paid: Location Unavailable</td>
					</g:else>
				</td>
				
				<td>
					${it?.custRep.firstName + it?.custRep.lastName }
				</td>
				<td>
					${it?.dateTime }
				</td>
				<td>
					${'$' + it?.bookingFee }
				</td>
				<td>
					${it?.comments }
				</td>
				<g:if test="${it?.profile1 == activeProfileId }">
					<td>
						${it?.user1Rating }
					</td>
					<td>
						${it?.user2Rating }
					</td>
				</g:if>
				<g:else>
					<td>
						${it?.user2Rating }
					</td>
					<td>
						${it?.user1Rating }
					</td>
				</g:else>
			</tr>
		</g:each>
	</table>
	<h3>Past Dates</h3>
	<table class="table table-striped">
		<tr>
			<th>Profile</th>
			<th>Customer Representative</th>
			<th>Date</th>
			<th>Booking Fee</th>
			<th>Comments</th>
			<th>Your rating</th>
			<th>Date's rating</th>

		</tr>
		<g:each in="${previousDateList }">
			<tr>
				<g:if test="${it?.profile1?.profileId == activeProfileId }">
					<td>
						${it?.profile2 }
					</td>
				</g:if>
				<g:else>
					<td>
						${it?.profile1 }
					</td>
				</g:else>
				<td>
					${it?.custRep.firstName + it?.custRep.lastName }
				</td>
				<td>
					${it?.dateTime }
				</td>
				<td>
					${'$' + it?.bookingFee }
				</td>
				<td>
					${it?.comments }
				</td>
				<g:if test="${it?.profile1 == activeProfileId }">
					<td>
						${it?.user1Rating }
					</td>
					<td>
						${it?.user2Rating }
					</td>
				</g:if>
				<g:else>
					<td>
						${it?.user2Rating }
					</td>
					<td>
						${it?.user1Rating }
					</td>
				</g:else>
			</tr>
		</g:each>
	</table>
</body>
</html>
