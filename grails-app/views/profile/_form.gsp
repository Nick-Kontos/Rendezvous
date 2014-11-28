<%@ page import="information.Profile" %>



<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'creationDate', 'error')} required">
	<label for="creationDate">
		<g:message code="profile.creationDate.label" default="Creation Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="creationDate" precision="day"  value="${profileInstance?.creationDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'datinGeoRange', 'error')} required">
	<label for="datinGeoRange">
		<g:message code="profile.datinGeoRange.label" default="Datin Geo Range" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="datinGeoRange" type="number" value="${profileInstance.datinGeoRange}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'datingAgeRangeEnd', 'error')} required">
	<label for="datingAgeRangeEnd">
		<g:message code="profile.datingAgeRangeEnd.label" default="Dating Age Range End" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="datingAgeRangeEnd" type="number" value="${profileInstance.datingAgeRangeEnd}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'datingAgeRangeStart', 'error')} required">
	<label for="datingAgeRangeStart">
		<g:message code="profile.datingAgeRangeStart.label" default="Dating Age Range Start" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="datingAgeRangeStart" type="number" value="${profileInstance.datingAgeRangeStart}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'hairColor', 'error')} required">
	<label for="hairColor">
		<g:message code="profile.hairColor.label" default="Hair Color" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="hairColor" required="" value="${profileInstance?.hairColor}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'height', 'error')} required">
	<label for="height">
		<g:message code="profile.height.label" default="Height" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="height" type="number" value="${profileInstance.height}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'hobbies', 'error')} required">
	<label for="hobbies">
		<g:message code="profile.hobbies.label" default="Hobbies" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="hobbies" required="" value="${profileInstance?.hobbies}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'lastModDate', 'error')} required">
	<label for="lastModDate">
		<g:message code="profile.lastModDate.label" default="Last Mod Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="lastModDate" precision="day"  value="${profileInstance?.lastModDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'mf', 'error')} required">
	<label for="mf">
		<g:message code="profile.mf.label" default="Mf" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mf" required="" value="${profileInstance?.mf}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'profileId', 'error')} required">
	<label for="profileId">
		<g:message code="profile.profileId.label" default="Profile Id" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="profileId" required="" value="${profileInstance?.profileId}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'weight', 'error')} required">
	<label for="weight">
		<g:message code="profile.weight.label" default="Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="weight" type="number" value="${profileInstance.weight}" required=""/>

</div>

