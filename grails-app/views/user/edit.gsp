<%@ page import="information.User"%>
<%@ page import="information.Account"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'user.label', default: 'User')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div id="edit-user" class="content scaffold-edit" role="main">
		<g:isUser>
			<h1>My Account</h1>
		</g:isUser>
		<g:isEmployee>
			<h1>Edit Profile</h1>
		</g:isEmployee>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>

		<div class="row">
			<div class="col-lg-6">
				<g:form url="[resource:userInstance, action:'update']" method="PUT">
					<g:hiddenField name="version" value="${userInstance?.version}" />
					<fieldset class="form">


						<h3>User Details</h3>
						<div
							class="fieldcontain ${hasErrors(bean: userInstance, field: 'city', 'error')} required">
							<label for="city"> <g:message code="user.city.label"
									default="City" /> <span class="required-indicator">*</span>
							</label>
							<g:textField name="city" required=""
								value="${userInstance?.city}" />

						</div>

						<div
							class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
							<label for="email"> <g:message code="user.email.label"
									default="Email" /> <span class="required-indicator">*</span>
							</label>
							<g:textField name="email" required=""
								value="${userInstance?.email}" />

						</div>

						<div
							class="fieldcontain ${hasErrors(bean: userInstance, field: 'firstName', 'error')} required">
							<label for="firstName"> <g:message
									code="user.firstName.label" default="First Name" /> <span
								class="required-indicator">*</span>
							</label>
							<g:textField name="firstName" required=""
								value="${userInstance?.firstName}" />

						</div>

						<div
							class="fieldcontain ${hasErrors(bean: userInstance, field: 'lastName', 'error')} required">
							<label for="lastName"> <g:message
									code="user.lastName.label" default="Last Name" /> <span
								class="required-indicator">*</span>
							</label>
							<g:textField name="lastName" required=""
								value="${userInstance?.lastName}" />

						</div>


						<div
							class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
							<label for="password"> <g:message
									code="user.password.label" default="Password" /> <span
								class="required-indicator">*</span>
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
							<g:textField name="state" required=""
								value="${userInstance?.state}" />

						</div>

						<div
							class="fieldcontain ${hasErrors(bean: userInstance, field: 'street', 'error')} required">
							<label for="street"> <g:message code="user.street.label"
									default="Street" /> <span class="required-indicator">*</span>
							</label>
							<g:textField name="street" required=""
								value="${userInstance?.street}" />

						</div>

						<div
							class="fieldcontain ${hasErrors(bean: userInstance, field: 'telephone', 'error')} required">
							<label for="telephone"> <g:message
									code="user.telephone.label" default="Telephone" /> <span
								class="required-indicator">*</span>
							</label>
							<g:textField name="telephone" required=""
								value="${userInstance?.telephone}" />

						</div>

						<div
							class="fieldcontain ${hasErrors(bean: userInstance, field: 'zipCode', 'error')} required">
							<label for="zipCode"> <g:message
									code="user.zipCode.label" default="Zip Code" /> <span
								class="required-indicator">*</span>
							</label>
							<g:field name="zipCode" type="number"
								value="${userInstance.zipCode}" required="" />

						</div>


					</fieldset>
					<fieldset class="buttons">
						<g:actionSubmit class="save btn btn-primary" action="update"
							value="${message(code: 'default.button.update.label', default: 'Update')}" />
					</fieldset>
				</g:form>
			</div>

			<div class="col-lg-6">
				<h3>Account Details</h3>
				<table class="table table-striped">
					<tr>
						<th>Account #</th>
						<th>Card #</th>
						<th>Action</th>
					</tr>
					<g:each in="${accounts }" var="a">
						<tr>
							<td>
								${a.acctNum}
							</td>
							<td>
								${a.cardNumber }
							</td>
							<td><g:form controller="account" action="delete"
									method="DELETE">
									<g:hiddenField name="acctNum" value="${a.acctNum }" />
									<g:hiddenField name="cardNumber" value="${a.cardNumber }" />
									<g:hiddenField name="ssn" value="${a.owner.ssn }" />
									<g:actionSubmit class="delete btn btn-danger" action="delete"
										value="${message(code: 'default.button.delete.label', default: 'Delete')}"
										onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
								</g:form>
						</tr>
					</g:each>
				</table>
			</div>

			<div class="col-lg-6">
				<g:form controller="account" action="save">
					<g:hiddenField name="version" value="${accountInstance?.version}" />
					<fieldset class="form">


						<h3>Create New Account</h3>
						<div
							class="fieldcontain ${hasErrors(bean: accountInstance, field: 'acctNum', 'error')} required">
							<label for="acctNum"> <g:message
									code="account.acctNum.label" default="Acct Num" /> <span
								class="required-indicator">*</span>
							</label>
							<g:textField name="acctNum" required=""
								value="${accountInstance?.acctNum}" />

						</div>

						<div
							class="fieldcontain ${hasErrors(bean: accountInstance, field: 'cardNumber', 'error')} required">
							<label for="cardNumber"> <g:message
									code="account.cardNumber.label" default="Card Number" /> <span
								class="required-indicator">*</span>
							</label>
							<g:textField name="cardNumber" required=""
								value="${accountInstance?.cardNumber}" />

						</div>


					</fieldset>
					<fieldset class="buttons">
						<g:actionSubmit class="save btn btn-primary" action="save"
							value="Create" />
					</fieldset>
				</g:form>
			</div>

		</div>
	</div>
</body>
</html>