<%@ page import="information.Account" %>



<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'acctCreationDate', 'error')} required">
	<label for="acctCreationDate">
		<g:message code="account.acctCreationDate.label" default="Acct Creation Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="acctCreationDate" precision="day"  value="${accountInstance?.acctCreationDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'acctNum', 'error')} required">
	<label for="acctNum">
		<g:message code="account.acctNum.label" default="Acct Num" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="acctNum" required="" value="${accountInstance?.acctNum}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'cardNumber', 'error')} required">
	<label for="cardNumber">
		<g:message code="account.cardNumber.label" default="Card Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cardNumber" required="" value="${accountInstance?.cardNumber}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: accountInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="account.owner.label" default="Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${information.User.list()}" optionKey="id" required="" value="${accountInstance?.owner?.id}" class="many-to-one"/>

</div>

