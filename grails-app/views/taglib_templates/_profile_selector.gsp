<div id="profileSelectorContainer">
	<select id="profileSelector">
		<g:each in="${profiles}" var="p">
			<option ${p.profileId==session.activeProfileId?'selected':''}>
				${p}
			</option>
		</g:each>
	</select>
	<g:form name="switchProfileForm" controller="app" action="changeActiveProfile">
		<g:hiddenField name="newProfileId" value="${session.activeProfileId}" />
	</g:form>
</div>
<script>
	$("#profileSelector").change(function(){
		$("#newProfileId").val($(this).val());
		$("#switchProfileForm").submit();	
	});
</script>