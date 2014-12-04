<div class="row">
	<div class="col-lg-12">
		<g:if test="${statusMessage }">
			<div class="successBox">
				${statusMessage}
			</div>
		</g:if>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Profile Id</th>
					<th>Age</th>
					<th>Height</th>
					<th>Weight</th>
					<th>Hair Color</th>
					<th>Hobbies</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${suggestions}" status="i" var="s">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>
							${s.profileId}
						</td>
						<td>
							${s.age}
						</td>
						<td>
							${s.height}
						</td>
						<td>
							${s.weight}
						</td>
						<td>
							${s.hairColor}
						</td>
						<td>
							${
								s.hobbies
							}
						</td>
						<td><g:form controller="customerRepresentative"
								action="makeSuggestion">
								<g:hiddenField name="profileB" value="${s.profileId }" />
								<g:hiddenField name="profileC" value="${searchId }" />
								<button title="Suggest Profile" type="button"
									class="btn btn-primary btn-xs referBtn">
									<i class="fa fa-arrow-circle-right"></i>
								</button>
							</g:form></td>
					</tr>
				</g:each>
				<script type="text/javascript">
				$(function(){
								$(".referBtn").click(function(){
									var form=$(this).closest("form");
									$.post("${createLink(action: 'makeSuggestion',controller:'customerRepresentative')}
					",

															$(form).serialize(),
															function(data) {
																bootbox
																		.alert(data)
															});
										});
					})
				</script>
			</tbody>
		</table>
		<h3>Previous Suggestions</h3>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Profile Id</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${prevSuggestions}" status="i" var="s">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>${s.profileB }</td>
						<td><g:formatDate date="${s.dateTime }" format="MM/dd/yyyy hh:mm a"/></td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
</div>