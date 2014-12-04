<%@ page import="information.User"%>



<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'city', 'error')} required">
	<label for="city"> <g:message code="user.city.label"
			default="City" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${userInstance?.city}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email"> <g:message code="user.email.label"
			default="Email" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${userInstance?.email}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
	<label for="firstName"> <g:message code="user.firstName.label"
			default="First Name" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required=""
		value="${userInstance?.firstName}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
	<label for="lastName"> <g:message code="user.lastName.label"
			default="Last Name" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required=""
		value="${userInstance?.lastName}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password"> <g:message code="user.password.label"
			default="Password" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required=""
		value="${userInstance?.password}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'ppp', 'error')} required">
	<label for="ppp"> <g:message code="user.ppp.label"
			default="Ppp" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="ppp" required="" value="${userInstance?.ppp}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'ssn', 'error')} required">
	<label for="ssn"> <g:message code="user.ssn.label"
			default="Ssn" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="ssn" required="" value="${userInstance?.ssn}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'state', 'error')} required">
	<label for="state"> <g:message code="user.state.label"
			default="State" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="state" required="" value="${userInstance?.state}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'street', 'error')} required">
	<label for="street"> <g:message code="user.street.label"
			default="Street" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="street" required="" value="${userInstance?.street}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'telephone', 'error')} required">
	<label for="telephone"> <g:message code="user.telephone.label"
			default="Telephone" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="telephone" required=""
		value="${userInstance?.telephone}" />

</div>

<div
	class="fieldcontain ${hasErrors(bean: userInstance, field: 'zipCode', 'error')} required">
	<label for="zipCode"> <g:message code="user.zipCode.label"
			default="Zip Code" /> <span class="required-indicator">*</span>
	</label>
	<g:field name="zipCode" type="number" value="${userInstance.zipCode}"
		required="" />

</div>

