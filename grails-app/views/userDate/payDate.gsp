<%@ page import="dating_system.UserDate"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Date payment</title>
</head>
<body>
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
</body>