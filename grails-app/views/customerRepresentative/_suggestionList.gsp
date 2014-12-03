<div class="row">
	<div class="col-lg-12">
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
						<td>
						<g:link title="Suggest Profile" class="btn btn-primary btn-xs" controller="customerRepresentative" action="makeSuggestion">
						<i class="fa fa-arrow-circle-right"></i>
						</g:link>
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
</div>