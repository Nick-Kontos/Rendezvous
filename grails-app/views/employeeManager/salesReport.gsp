<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Calendar Date Statistics</title>
<script type="text/javascript">
$(function(){
	$("#selectMonthButton").click(function(){
		$.post("${createLink(action: 'renderSalesReport')}",
				{month:$("#monthToView_month").val(),year:$("#monthToView_year").val()},
				function(data){
					$("#salesReportPanel").html(data);
				})
	});
})
</script>
</head>
<body>
	<div class="row">
		<div class="col-lg-6">Select Date:
			<g:datePicker name="monthToView" precision="month" /><button id="selectMonthButton" class="btn btn-primary">Select</button>
		</div>
	</div>
	<hr>
	<div class="row" id="salesReportPanel">
	</div>
</body>
</html>
