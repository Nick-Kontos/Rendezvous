<%@ page import="dating_system.Referral" %>



<div class="fieldcontain ${hasErrors(bean: referralInstance, field: 'dateTime', 'error')} required">
	<label for="dateTime">
		<g:message code="referral.dateTime.label" default="Date Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateTime" precision="day"  value="${referralInstance?.dateTime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: referralInstance, field: 'profileA', 'error')} required">
	<label for="profileA">
		<g:message code="referral.profileA.label" default="Profile A" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profileA" name="profileA.id" from="${information.Profile.list()}" optionKey="id" required="" value="${referralInstance?.profileA?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: referralInstance, field: 'profileB', 'error')} required">
	<label for="profileB">
		<g:message code="referral.profileB.label" default="Profile B" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profileB" name="profileB.id" from="${information.Profile.list()}" optionKey="id" required="" value="${referralInstance?.profileB?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: referralInstance, field: 'profileC', 'error')} required">
	<label for="profileC">
		<g:message code="referral.profileC.label" default="Profile C" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="profileC" name="profileC.id" from="${information.Profile.list()}" optionKey="id" required="" value="${referralInstance?.profileC?.id}" class="many-to-one"/>

</div>

