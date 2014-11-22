<div id="profileSelectorContainer">
	<select id="profileSelector">
		<g:each in="${profiles}" var="p">
			<option ${p.profileId==session.activeProfileId?'selected':''}>
				${p}
			</option>
		</g:each>
	</select>
	<g:form controller="App" action="switchProfile">
		<g:hiddenField name="newProfile" value="session.activeProfileId" />
		<g:hiddenField name="currentPage" value="${request.getRequestURI()}"/>
	</g:form>
</div>
<script>
	
</script>