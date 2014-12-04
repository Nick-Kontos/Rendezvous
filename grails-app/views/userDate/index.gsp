
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
	<h3>Date Requests</h3>
	<table class="table table-striped">
		<tr>
			<th>Action</th>
			<th>Profile</th>
			<th>Date</th>
		</tr>
		<g:each in="${requestDateList }">
			<tr>
				<td><g:link type="button" class="btn btn-success btn-sm"
						controller="userDate" action="acceptDate"
						params="${[acceptedDateProf1: it?.profile1, acceptedDateProf2: it?.profile2, acceptedDateDate: it?.dateTime] }">Accept</g:link>
					<g:link type="button" class="btn btn-danger btn-sm"
						controller="userDate" action="cancelDate"
						params="${[canceledDateProf1: it?.profile1, canceledDateProf2: it?.profile2, canceledDateDate: it?.dateTime] }">Decline</g:link></td>
				<td><g:link controller="profile" action="show"
						id="${it.profile1 }">
						${it?.profile1 }
					</g:link></td>
				<td>
					${it?.dateTime }
				</td>
			</tr>
		</g:each>
	</table>
	<h3>Dates Pending Reply</h3>
	<table class="table table-striped">
		<tr>
			<th>Action</th>
			<th>Profile</th>
			<th>Date</th>
			<th>Location</th>
		</tr>
		<g:each in="${pendingDateList }">
			<tr>
				<td><g:link type="button" class="btn btn-danger btn-sm"
						controller="userDate" action="cancelDate"
						params="${[canceledDateProf1: it?.profile1, canceledDateProf2: it?.profile2, canceledDateDate: it?.dateTime] }">Cancel</g:link></td>
				<td><g:link controller="profile" action="show"
						id="${it?.profile2 }">
						${it?.profile2 }
					</g:link></td>
				<td>
					${it?.dateTime }
				</td>
				<td>
					${it?.location }
				</td>
			</tr>
		</g:each>
	</table>
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
					<g:if test="${it?.custRep == null }">
						<td><g:link type="button" class="btn btn-success btn-sm"
								disabled="disabled" controller="userDate" action="payDate">Rep not assigned</g:link>
							<g:link type="button" class="btn btn-danger btn-sm"
								controller="userDate" action="cancelDate"
								params="${[canceledDateProf1: it.profile1, canceledDateProf2: it.profile2, canceledDateDate: it.dateTime] }">Cancel</g:link></td>
					</g:if>
					<g:elseif test="${!(it?.accepted) || it?.profile1Paid}">
						<td><g:link type="button" class="btn btn-success btn-sm"
								disabled="disabled" controller="userDate" action="payDate">Paid</g:link>
							<g:link type="button" class="btn btn-danger btn-sm"
								controller="userDate" action="cancelDate"
								params="${[canceledDateProf1: it.profile1, canceledDateProf2: it.profile2, canceledDateDate: it.dateTime] }">Cancel</g:link></td>
					</g:elseif>
					<g:else>
						<td><g:link type="button" class="btn btn-success btn-sm"
								controller="userDate" action="payDate"
								params="${[payedDateProf1: it.profile1, payedDateProf2: it.profile2, payedDateDate: it.dateTime] }">Pay</g:link>
							<g:link type="button" class="btn btn-danger btn-sm"
								controller="userDate" action="cancelDate"
								params="${[canceledDateProf1: it.profile1, canceledDateProf2: it.profile2, canceledDateDate: it.dateTime] }">Cancel</g:link></td>
					</g:else>
					<td><g:link controller="profile" action="show"
							id="${it?.profile2 }">
							${it?.profile2 }
						</g:link></td>
				</g:if>
				<g:else>
					<g:if test="${it?.custRep == null }">
						<td><g:link type="button" class="btn btn-success btn-sm"
								disabled="disabled" controller="userDate" action="payDate">Rep not assigned</g:link>
							<g:link type="button" class="btn btn-danger btn-sm"
								controller="userDate" action="cancelDate"
								params="${[canceledDateProf1: it.profile1, canceledDateProf2: it.profile2, canceledDateDate: it.dateTime] }">Cancel</g:link></td>
					</g:if>
					<g:elseif test="${!(it?.accepted) || it?.profile2Paid}">

						<td><g:link type="button" class="btn btn-success btn-sm"
								disabled="disabled" controller="userDate" action="payDate">Paid</g:link>
							<g:link type="button" class="btn btn-danger btn-sm"
								controller="userDate" action="cancelDate"
								params="${[canceledDateProf1: it.profile1, canceledDateProf2: it.profile2, canceledDateDate: it.dateTime] }">Cancel</g:link></td>
					</g:elseif>
					<g:else>
						<td><g:link type="button" class="btn btn-success btn-sm"
								controller="userDate" action="payDate"
								params="${[payedDateProf1: it.profile1, payedDateProf2: it.profile2, payedDateDate: it.dateTime] }">Pay</g:link>
							<g:link type="button" class="btn btn-danger btn-sm"
								controller="userDate" action="cancelDate"
								params="${[canceledDateProf1: it.profile1, canceledDateProf2: it.profile2, canceledDateDate: it.dateTime] }">Cancel</g:link></td>
					</g:else>
					<td><g:link controller="profile" action="show"
							id="${it?.profile1 }">
							${it?.profile1 }
						</g:link></td>
				</g:else>
				<g:if test="${it?.profile1Paid && it?.profile2Paid }">
					<td>
						${it?.location }
					</td>
				</g:if>
				<g:else>
					<td>Not paid: Location Unavailable</td>
				</g:else>

				<td><g:if test="${it?.custRep != null }">
						${it?.custRep.firstName + it?.custRep.lastName }
					</g:if> <g:else>
						Representative not assigned
					</g:else></td>
				<td>
					${it?.dateTime }
				</td>
				<g:if test="${it?.bookingFee == null }">
					<td>Fee not set</td>
				</g:if>
				<g:else>
					<td>
						${'$' + it?.bookingFee }
					</td>
				</g:else>
				<td>
					${it?.comments }
				</td>
				<g:if test="${it?.profile1 == activeProfileId }">
					<g:if test="${it?.user1Rating == null }">
						<td>Not rated</td>
					</g:if>
					<g:else>
						<td>
							${it?.user1Rating }
						</td>
					</g:else>
					<g:if test="${it?.user2Rating == null }">
						<td>Not rated</td>
					</g:if>
					<g:else>
						<td>
							${it?.user2Rating }
						</td>
					</g:else>
				</g:if>
				<g:else>
					<g:if test="${it?.user2Rating == null }">
						<td>Not rated</td>
					</g:if>
					<g:else>
						<td>
							${it?.user2Rating }
						</td>
					</g:else>
					<g:if test="${it?.user1Rating == null }">
						<td>Not rated</td>
					</g:if>
					<g:else>
						<td>
							${it?.user1Rating }
						</td>
					</g:else>
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
			<th>Action</th>

		</tr>
		<g:each in="${previousDateList }">
			<tr>
				<g:if test="${it?.profile1?.profileId == activeProfileId }">
					<td><g:link controller="profile" action="show"
							id="${it?.profile2 }">
							${it?.profile2 }
						</g:link></td>
				</g:if>
				<g:else>
					<td><g:link controller="profile" action="show"
							id="${it?.profile1}">
							${it?.profile1 }
						</g:link></td>
				</g:else>
				<td><g:if test="${it?.custRep != null }">
						${it?.custRep.firstName + it?.custRep.lastName }
					</g:if> <g:else>
						Representative not assigned
					</g:else></td>
				<td>
					${it?.dateTime }
				</td>
				<g:if test="${it?.bookingFee == null }">
					<td>Fee not set</td>
				</g:if>
				<g:else>
					<td>
						${'$' + it?.bookingFee }
					</td>
				</g:else>
				<td>
					${it?.comments }
				</td>
				<g:if test="${it?.profile1 == activeProfileId }">
					<g:if test="${it?.user1Rating == null }">
						<td>Not rated</td>
					</g:if>
					<g:else>
						<td>
							${it?.user1Rating }
						</td>
					</g:else>
					<g:if test="${it?.user2Rating == null }">
						<td>Not rated</td>
					</g:if>
					<g:else>
						<td>
							${it?.user2Rating }
						</td>
					</g:else>
				</g:if>
				<g:else>
					<g:if test="${it?.user2Rating == null }">
						<td>Not rated</td>
					</g:if>
					<g:else>
						<td>
							${it?.user2Rating }
						</td>
					</g:else>
					<g:if test="${it?.user1Rating == null }">
						<td>Not rated</td>
					</g:if>
					<g:else>
						<td>
							${it?.user1Rating }
						</td>
					</g:else>
				</g:else>
				<td><g:if test="${session.activeProfileId.equals(it?.profile1)?it?.user1Rating==null:it?.user2Rating==null}"><g:form controller="userDate" action="rateDate">
				<g:hiddenField name="profile1" value="${it?.profile1 }"/>
				<g:hiddenField name="profile2" value="${it?.profile2 }"/>
				<g:hiddenField name="dateTime" value="${it?.dateTime }"/>
						<button title="Rate Date" class="btn btn-success btn-xs">
							<i class="fa fa-star"></i>
						</button>
					</g:form></g:if></td>
			</tr>
		</g:each>
	</table>
</body>
</html>
