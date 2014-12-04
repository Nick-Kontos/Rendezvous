<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Profile Suggestions</title>
<script type="text/javascript">
$(function(){
	$("#viewButton").click(function(){
		$.post("${createLink(action: 'getSuggestions')}",
				{profileId:$("#profileIdTextbox").val()},
				function(data){
					$("#suggestionPanel").html(data);
				})
	});
})
</script>
</head>
<body>
	<div class="body">
	<h1>Make Date Suggestion</h1>
		<div class="row border-bottom">
			<div class="col-lg-2">Enter Profile:</div>
			<div class="col-lg-10">
				<input id="profileIdTextbox" type="text">
				<button id="viewButton" class="btn btn-primary">View</button>
			</div>
		</div>
		<div class="row">
			<div id="suggestionPanel" class="col-lg-12"></div>
		</div>
	</div>
</body>
</html>