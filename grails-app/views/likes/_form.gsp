<%@ page import="dating_system.Likes" %>



<div class="fieldcontain ${hasErrors(bean: likesInstance, field: 'dateTime', 'error')} required">
	<label for="dateTime">
		<g:message code="likes.dateTime.label" default="Date Time" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateTime" precision="day"  value="${likesInstance?.dateTime}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: likesInstance, field: 'likee', 'error')} required">
	<label for="likee">
		<g:message code="likes.likee.label" default="Likee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="likee" name="likee.id" from="${information.Profile.list()}" optionKey="id" required="" value="${likesInstance?.likee?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: likesInstance, field: 'liker', 'error')} required">
	<label for="liker">
		<g:message code="likes.liker.label" default="Liker" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="liker" name="liker.id" from="${information.Profile.list()}" optionKey="id" required="" value="${likesInstance?.liker?.id}" class="many-to-one"/>

</div>

