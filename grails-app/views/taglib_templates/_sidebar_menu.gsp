

<div>
	<ul class = "nav">
		<li></li>
		<g:isUser>
			<li><g:link controller="app" action="dashboard">Dashboard</g:link></li>
			<li><g:link controller="Profile" action="show" id="${session.activeProfileId }">My Profile</g:link></li>
			<li><g:link controller="referral">Referrals</g:link></li>
			<li><g:link controller="userDate">Dates</g:link></li>
			<li><g:link controller="likes">Likes</g:link></li>
			<li><g:link controller="userDate" action="dateSuggestions">Suggestions</g:link></li>
		</g:isUser>
		<g:isEmployee>
			<li><g:link controller="customerRepresentative">Dashboard</g:link></li>
			<li><g:link controller="customerRepresentative">Record Date</g:link></li>
			<li><g:link controller="customerRepresentative">Customer Information</g:link></li>
			<li><g:link controller="customerRepresentative">Mailing List</g:link></li>
			<li><g:link controller="customerRepresentative">View A Profile</g:link></li>
		</g:isEmployee>
		<g:isManager>
			<li><g:link controller="employeeManager">Dashboard</g:link></li>
			<li><g:link controller="employeeManager" action="salesReport">Sales Reports</g:link></li>
			<li><g:link controller="employeeManager" action="allUsers">View All Users</g:link></li>
			<li><g:link controller="employeeManager"
					action="calendarDateStats">Calendar Stats</g:link></li>
		</g:isManager>
	</ul>
</div>