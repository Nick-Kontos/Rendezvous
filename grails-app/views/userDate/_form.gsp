<%@ page import="dating_system.UserDate" %>



<div class="fieldcontain ${hasErrors(bean: userDateInstance, field: 'bookingFee', 'error')} required">
	<label for="bookingFee">
		<g:message code="userDate.bookingFee.label" default="Booking Fee" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="bookingFee" type="number" value="${userDateInstance.bookingFee}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: userDateInstance, field: 'comments', 'error')} required">
	<label for="comments">
		<g:message code="userDate.comments.label" default="Comments" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="comments" required="" value="${userDateInstance?.comments}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userDateInstance, field: 'custRep', 'error')} required">
	<label for="custRep">
		<g:message code="userDate.custRep.label" default="Cust Rep" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="custRep" name="custRep.id" from="${information.Employee.list()}" optionKey="id" required="" value="${userDateInstance?.custRep?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userDateInstance, field: 'dateTime', 'error')} required">
	<label for="dateTime">
		<g:message code="userDate.dateTime.label" default="Date Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateTime" precision="day"  value="${userDateInstance?.dateTime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: userDateInstance, field: 'location', 'error')} required">
	<label for="location">
		<g:message code="userDate.location.label" default="Location" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="location" required="" value="${userDateInstance?.location}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userDateInstance, field: 'profile1', 'error')} required">
	<label for="profile1">
		<g:message code="userDate.profile1.label" default="Profile1" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profile1" name="profile1.id" from="${information.Profile.list()}" optionKey="id" required="" value="${userDateInstance?.profile1?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userDateInstance, field: 'profile2', 'error')} required">
	<label for="profile2">
		<g:message code="userDate.profile2.label" default="Profile2" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profile2" name="profile2.id" from="${information.Profile.list()}" optionKey="id" required="" value="${userDateInstance?.profile2?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userDateInstance, field: 'user1Rating', 'error')} required">
	<label for="user1Rating">
		<g:message code="userDate.user1Rating.label" default="User1 Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="user1Rating" type="number" value="${userDateInstance.user1Rating}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: userDateInstance, field: 'user2Rating', 'error')} required">
	<label for="user2Rating">
		<g:message code="userDate.user2Rating.label" default="User2 Rating" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="user2Rating" type="number" value="${userDateInstance.user2Rating}" required=""/>

</div>

