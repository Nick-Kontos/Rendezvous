<div class="row">
	<div class="col-lg-12">
		<h3>
			Statistics for
			<g:formatDate date="${dateSelected}" format="EEE, MM/dd/yyyy" />
		</h3>
		<hr>
		<div class="col-lg-12">
			<div class="col-lg-2">Revenue:</div>
			<div class="col-lg-10">
				<g:formatNumber number="${totalRevenue}" format="\$###,##0.00" />
			</div>
			<div class="col-lg-2">Total Dates:</div>
			<div class="col-lg-10">
				${userDates.size()}
			</div>
		</div>
		<h3>Dates</h3>
		<hr>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Date</th>
					<th>Profile1</th>
					<th>Profile2</th>
					<th>Location</th>
					<th>Profile1 Rating</th>
					<th>Profile2 Rating</th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${userDates}" status="i" var="u">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:formatDate date="${u.dateTime}" format="MM/dd/yyyy" />
						</td>
						<td>
							${u.profile1}
						</td>
						<td>
							${u.profile2}
						</td>
						<td><g:formatNumber number="${u.bookingFee}"
								format="\$###,##0.00" /></td>
						<td>
							${u.user1Rating}
						</td>
						<td>
							${u.user2Rating}
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>
	</div>
</div>