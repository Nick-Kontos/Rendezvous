<%@ page import="dating_system.UserDate"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Upgrade Profile</title>
</head>
<body>
	<g:if test="${!accountList.isEmpty() }">
		<g:form controller="user" action="upgrade">
			<div class="form-group">
				<label for="InputAccountType">Select Account Role</label> <select
					class="form-select" name="InputAccountType" id="InputAccountType">
					<g:each in="${accountList }">
						<option value="${it }">
							${'Account Number: ' + it.acctNum + ' Card: ' + it.cardNumber }
						</option>
					</g:each>
				</select>
			</div>
			<div class="form-group">
				<label for="InputUserType">Select Account Role</label> 
				<g:select class="form-select" name="InputUserType" id="InputUserType" from="${['Super-User', 'Good-User', 'User-User'] }"/>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-default btn-lg btn-block">Search</button>
			</div>
		</g:form>
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