
<!DOCTYPE html>
<html>
<head>
<g:loggedIn>
	<meta name="layout" content="main">
</g:loggedIn>
<g:notLoggedIn>
	<meta name="layout" content="restrict">
</g:notLoggedIn>
<title>Help</title>
</head>
<body>
	<h1>Help Page</h1>
	<g:isEmployee>
		<g:render template="/help/custRepHelp"></g:render>
	</g:isEmployee>
	<g:isManager>
		<g:render template="/help/managerHelp"></g:render>
	</g:isManager>
	<g:isUser>
		<div class="row">
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>Create Profile</h3>
			<p>If not currently, please locate to the “Dashboard” page. To do
				so, select “Dashboard” from the Sidebar Menu. On the “Dashboard”
				page click the “Add Profile” option and proceed to fill out the
				“Create Profile” form with the following specifications:</p>
			<p>Age, Dating Geo Range, Dating Age Range End, Dating Age Range
				Start, Height, and Weight must be a number.</p>
			<p>***Note: ALL fields must be filled out Proceed to click the
				“Create” button.</p>
			<p>Successful result will output: Profile “Your Profile Name”
				created</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>Edit Profile</h3>
			<p>Select the “Edit” located at the top left corner of your
				profile page. Proceed to fill out the fields with the following
				specifications:</p>
			<p>Age, Dating Geo Range, Dating Age Range End, Dating Age Range
				Start, Height, and Weight must be a number.</p>
			<p>***Note: ALL fields must be filled out</p>
			<p>Proceed to click the “Update” button. Successful result will
				output: Profile “Your Profile Name” updated</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>Delete Profile</h3>
			<p>Select the “Edit” located at the top left corner of your
				profile page. Proceed to click the “Delete” button below the form. A
				pop-up “Are you sure?” message should display, and after clicking ok
				you should be redirected back to the “Dashboard,” noting that the
				profile you just deleted is not there.</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>Select Profile</h3>
			<p>After logging into your account, select an available profile
				from the Dashboard. If there are no profiles displayed, that means
				you have yet to create a profile, and proceed to click the “Add
				Profile” option and proceed to create a profile. Upon successful
				creation, navigate back to your “Dashboard” and the profile that you
				just created will be there.</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>Register</h3>
			<p>From the Rendezvous home page, click “Register.” Proceed to
				fill out the “Create User” form. Upon successful creation you will
				be redirected to “Create Profile.”</p>
			<p>***Note: ALL fields must be filled out</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>Update User Details</h3>
			<p>Select "My Account" at the top of the page. Update the fields
				in the User Details form and click the update button below the form.</p>
			<p>Successful result will output: Account Successfully Updated</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>Create New Account</h3>
			<p>Select "My Account" at the top of the page. Input the fields
				in the Create New Account form and click the create button below the
				form.</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>Delete Existing Account</h3>
			<p>Select "My Account" at the top of the page. In the Account
				Details table you will have the option to delete an existing
				account.</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>View Your Referrals</h3>
			<p>Select “Referrals” from the Sidebar Menu. This page will show
				you referrals, profiles suggested by our experts, and history of
				profiles referred.</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>Refer A Profile</h3>
			<p>While viewing someone’s profiles page, select the “Refer”
				button. You will then be redirected to a page where you can choose
				the Profile to refer to.</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>View Likes</h3>
			<p>Select “Likes” from the Sidebar Menu. You will be redirect to
				the page that shows the profiles that you have liked and the
				profiles that like you.</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>Like A Profile</h3>
			<p>Navigate to that profile page and select the “Like” button.</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>Request A Date</h3>
			<p>Navigate to that profile page and select the “Request Date”
				button. You should then proceed to enter the day and time for the
				date, as well as the location. Upon clicking submit the other
				profile will receive your request.</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>Accept/Decline Date</h3>
			<p>Select "Dates" from the Sidebar menu. In the Date Request
				table, you will have the option to either choose accept or decline.</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>Cancel Date</h3>
			<p>Select "Dates" from the Sidebar menu. In the Dates Pending
				Reply table you have the option to select cancel for a pending date.</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>View Dates</h3>
			<p>Select “Dates” from the Sidebar Menu. This page will show you
				date requests, dates pending reply, upcoming dates, and past dates.</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>Login</h3>
			<p>Enter your SSN and Password in the upper and lower fields
				respectively and click ‘Sign in.” If successful you will be
				redirected to your “Dashboard” displaying all of your profiles. If
				unsuccessful you should see “Invalid username/password.” In this
				case please try again.</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>Set Up Geo-Date</h3>
			<p>Select "Geo Date" from the Sidebar menu. Proceed to enter your
				longitude and latitude followed by selecting search. If someone has
				a similar location you may select their profile and then proceed to
				request a date.</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>Search Profiles</h3>
			<p>Select "Search Profiles" from the Sidebar menu. Complete the
				supplied form and click search. You will then be directed to a page
				showing profiles that match your search credentials.</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>Pay For Date</h3>
			<p>Select "Dates" from the Sidebar menu. In the Upcoming Dates
				table select the Pay button. You will the be redirected to a page
				where you can enter your account credit card number and submit your
				payment.</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>Upgrade Your User Type</h3>
			<p>Select "My Account" at the top of the page. Select the Upgrade
				Now button at the bottom of the page. You will then be redirected to
				a page where you will enter your account, credit card number, and
				what plan you would like to upgrade to.</p>
			<h3>--------------------------------------------------------------------------------------------------------------------</h3>
			<h3>Comment On Date</h3>
			<p>Select "Dates" from the Sidebar menu. In the Past Dates table
				select the Rate Date button. From there you can enter Rating and
				Comments.</p>
		</div>
	</g:isUser>
</body>
</html>
