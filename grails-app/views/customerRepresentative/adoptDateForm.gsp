<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Record Date</title>
</head>
<body>
	<div class="body">
		<g:if test="${errorMessage}">
			<div class="row">
				<div class="col-lg-11 errorBox">
					${errorMessage}
				</div>
			</div>
		</g:if>
		<div class="row">
			<div class="col-lg-5">
				<g:form controller="customerRepresentative" action="adoptDate">
					<g:hiddenField name="date" value="${date.dateTime }" />
					<g:hiddenField name="profile1" value="${date.profile1 }" />
					<g:hiddenField name="profile2" value="${date.profile2 }" />
					<div class="row">
						<div class="col-lg-5">Date:</div>
						<div class="col-lg-7">
							<g:formatDate date="${date.dateTime}"
								format="MM/dd/yyyy - hh:mm a" />
						</div>
						<div class="col-lg-5">Profile 1:</div>
						<div class="col-lg-7">
							${date.profile1 }
						</div>
						<div class="col-lg-5">Profile 2:</div>
						<div class="col-lg-7">
							${date.profile2 }
						</div>
					</div>
					<div class="row">
						<div class="col-lg-5">Booking Fee:</div>
						<div class="col-lg-7">
							$
							<g:textField name="bookingFee" class="width-90 pull-right" />
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<button type="submit" name="submit"
								class="btn btn-success pull-right">
								<i class="fa fa-plus"></i> Adopt Date
							</button>
						</div>
					</div>
				</g:form>
			</div>
		</div>
	</div>
</body>
</html>