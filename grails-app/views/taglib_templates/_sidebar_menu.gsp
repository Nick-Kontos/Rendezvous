<div>
<ul>
<li>Sidebar Menu</li>
<g:isUser>
<li><g:link controller="referral">Referrals</g:link></li>
<li><g:link controller="userDate">Dates</g:link></li>
<li><g:link controller="likes">Likes</g:link></li>
</g:isUser>
<g:isEmployee>
<li><g:link controller="employeeManager">Dashboard</g:link></li>
<li><g:link controller="employeeManager" action="salesReport">Sales Reports</g:link></li>
<li><g:link controller="employeeManager" action="allUsers">View All Users</g:link></li>
<li><g:link controller="employeeManager" action="calendarDateStats">Calendar Stats</g:link></li>
</g:isEmployee>
</ul>
</div>