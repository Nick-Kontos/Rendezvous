<%@ page import="information.Profile" %>


<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'age', 'error')} required">
	<label for="age">
		<g:message code="profile.age.label" default="Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="age" type="number" value="${profileInstance?.age}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'datinGeoRange', 'error')} required">
	<label for="datinGeoRange">
		<g:message code="profile.datinGeoRange.label" default="Dating Geo Range" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="datinGeoRange" type="number" value="${profileInstance?.datinGeoRange}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'datingAgeRangeEnd', 'error')} required">
	<label for="datingAgeRangeEnd">
		<g:message code="profile.datingAgeRangeEnd.label" default="Dating Age Range End" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="datingAgeRangeEnd" type="number" value="${profileInstance?.datingAgeRangeEnd}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'datingAgeRangeStart', 'error')} required">
	<label for="datingAgeRangeStart">
		<g:message code="profile.datingAgeRangeStart.label" default="Dating Age Range Start" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="datingAgeRangeStart" type="number" value="${profileInstance?.datingAgeRangeStart}" required=""/>

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
	<g:field name="height" type="number" step="0.01" value="${profileInstance?.height}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'hobbies', 'error')} required">
	<label for="hobbies">
		<g:message code="profile.hobbies.label" default="Hobbies" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="hobbies" required="" value="${profileInstance?.hobbies}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'mf', 'error')} required">
	<label for="mf">
		<g:message code="profile.mf.label" default="Mf" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="mf" required="" value="${profileInstance?.mf}"/>

</div>


<div class="fieldcontain ${hasErrors(bean: profileInstance, field: 'weight', 'error')} required">
	<label for="weight">
		<g:message code="profile.weight.label" default="Weight" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="weight" type="number" value="${profileInstance?.weight}" required=""/>

</div>

