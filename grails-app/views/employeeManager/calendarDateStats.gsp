<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Calendar Date Statistics</title>
<script type="text/javascript">
$(function(){
	$("#selectDateButton").click(function(){
		$.post("${createLink(action: 'renderCalendarStats')}",
				{day:$("#dateToView_day").val(),month:$("#dateToView_month").val(),year:$("#dateToView_year").val()},
				function(data){
					$("#statsPanel").html(data);
				})
	});
})
</script>
</head>
<body>
	<div class="row">
		<div class="col-lg-6">Select Date:
			<g:datePicker name="dateToView" precision="day" /><button id="selectDateButton" class="btn btn-primary">Select</button>
		</div>
	</div>
	<hr>
	<div class="row" id="statsPanel">
	</div>
</body>
</html>
