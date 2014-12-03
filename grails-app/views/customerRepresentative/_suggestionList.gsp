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
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
</div>