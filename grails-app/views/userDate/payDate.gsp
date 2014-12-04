<%@ page import="dating_system.UserDate"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Date payment</title>
</head>
<body>
	<g:if test="${!accountList.isEmpty() }">
		<label for="InputAccountType">Select Account Role</label>
		<select class="form-select" name="InputAccountType"
			id="InputAccountType">
			<g:each in="${accountList }">
				<option value="${it }">
					${'Account Number: ' + it.acctNum + ' Card: ' + it.cardNumber }
				</option>
			</g:each>
		</select>
		<g:link class="btn btn-primary btn-lg" controller="userDate"
			action="finalizePayment"
			params="${[payedDateProf1: payedDateProf1, payedDateProf2: payedDateProf2, payedDateDate: payedDateDate] }">
			Submit Payment
		</g:link>
	</g:if>
	<g:else>
		<div class="panel panel-danger">
			<div class="panel-heading">
				<h3 class="panel-title">Warning</h3>
			</div>
			<div class="panel-body">You do not yet have a credit card
				account associated with this user account. Please visit the MY
				ACCOUNTS page to add one.</div>
		</div>
	</g:else>
</body>