<%@ page import="information.Employee" %>



<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="employee.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${employeeInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="employee.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${employeeInstance?.email}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'firstName', 'error')} required">
	<label for="firstName">
		<g:message code="employee.firstName.label" default="First Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="firstName" required="" value="${employeeInstance?.firstName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'hourlyRate', 'error')} required">
	<label for="hourlyRate">
		<g:message code="employee.hourlyRate.label" default="Hourly Rate" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="hourlyRate" type="number" value="${employeeInstance.hourlyRate}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'lastName', 'error')} required">
	<label for="lastName">
		<g:message code="employee.lastName.label" default="Last Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lastName" required="" value="${employeeInstance?.lastName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="employee.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${employeeInstance?.password}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="employee.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="role" required="" value="${employeeInstance?.role}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'ssn', 'error')} required">
	<label for="ssn">
		<g:message code="employee.ssn.label" default="Ssn" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ssn" required="" value="${employeeInstance?.ssn}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="employee.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${employeeInstance?.startDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="employee.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="state" required="" value="${employeeInstance?.state}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'street', 'error')} required">
	<label for="street">
		<g:message code="employee.street.label" default="Street" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="street" required="" value="${employeeInstance?.street}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'telephone', 'error')} required">
	<label for="telephone">
		<g:message code="employee.telephone.label" default="Telephone" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="telephone" required="" value="${employeeInstance?.telephone}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: employeeInstance, field: 'zipCode', 'error')} required">
	<label for="zipCode">
		<g:message code="employee.zipCode.label" default="Zip Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="zipCode" type="number" value="${employeeInstance.zipCode}" required=""/>

</div>

