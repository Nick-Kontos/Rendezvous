

<div>
	<ul class="nav">
		<li></li>
		<g:isUser>
			<li><g:link controller="app" action="dashboard">Dashboard</g:link></li>
			<li><g:link controller="profile" action="searchForm">Search Profiles</g:link>
			<li><g:link controller="profile" action="show"
					id="${session.activeProfileId }">My Profile</g:link></li>
			<li><g:link controller="referral">Referrals</g:link></li>
			<li><g:link controller="userDate">Dates</g:link></li>
			<li><g:link controller="likes">Likes</g:link></li>
			<li><g:link controller="userDate" action="dateSuggestions">Suggestions</g:link></li>
			<li><g:link controller="userDate" action="geoDateForm">Geo Date</g:link></li>
		</g:isUser>
		<g:isEmployee>
			<li><g:link controller="customerRepresentative">Dashboard</g:link></li>
			<li><g:link controller="customerRepresentative"
					action="recordDate">Record Date</g:link></li>
			<li><g:link controller="customerRepresentative"
					action="customerMenu">Customer Menu</g:link></li>
			<li><g:link controller="customerRepresentative"
					action="mailingList">Mailing List</g:link></li>
			<li><g:link controller="customerRepresentative"
					action="viewProfileSuggestions">View A Profile</g:link></li>
		</g:isEmployee>
		<g:isManager>
			<li><g:link controller="employeeManager">Dashboard</g:link></li>
			<li><g:link controller="employeeManager" action="salesReport">Sales Reports</g:link></li>
			<li><g:link controller="employeeManager" action="allUsers">View All Users</g:link></li>
			<li><g:link controller="employeeManager"
					action="calendarDateStats">Calendar Stats</g:link></li>
			<li><g:link controller="employeeManager" action="employeeMenu">Employee Menu</g:link></li>
		</g:isManager>
		<li><g:link controller="help">Help</g:link></li>
	</ul>
</div>
