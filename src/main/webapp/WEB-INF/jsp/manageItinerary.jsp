<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:import url="/WEB-INF/jsp/header.jsp" />



<div class="container">
	<div class="row">
		<div class="panel panel-default panel-table">
			<div class="panel-heading">
				<div class="row">
					<div class="col col-xs-6">
						<h3 class="panel-title">Panel Heading</h3>
					</div>
					<div class="col col-xs-6 text-right">
						<button type="button" class="btn btn-sm btn-primary btn-create">Create
							New</button>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<table class="table table-striped table-bordered table-list">
					<thead>
						<tr>
							<th><em class="fa fa-cog"></em></th>
							<th class="hidden-xs">ID</th>
							<th>Name</th>
							<th>Email</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td align="center"><a class="btn btn-default eButton"><em
									class="fa fa-pencil"></em></a> <a class="btn btn-danger dButton"><em
									class="fa fa-trash"></em></a></td>
							<td class="hidden-xs">1</td>
							<td>John Doe</td>
							<td>johndoe@example.com</td>
						</tr>
					</tbody>
				</table>

			</div>
			<div class="panel-footer">
				<div class="row">
					<div class="col col-xs-4">Page 1 of 5</div>
				</div>
			</div>
		</div>
	</div>
</div>




<c:import url="/WEB-INF/jsp/footer.jsp" />