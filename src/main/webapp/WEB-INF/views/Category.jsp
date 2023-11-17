<%@ page language="java" contentType="text/html"%>

<%@include file="Header.jsp"%>

<body
	background="https://www.noupe.com/wp-content/uploads/2009/10/hybrid-genesis.jpg">

	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<form action="<c:url value="/AddCategory"/>" method="post">

		<table align="center" class="table">

			<tr>
				<td colspan="2">
					<h3>
						<center>Category</center>
					</h3>
				</td>
			</tr>

			<tr>
				<td style="text-align: center;">Category Name</td>
				<td><input type="text" name="catgName" /></td>
			</tr>

			<tr>
				<td style="text-align: center;">Category Description</td>
				<td><input type="text" name="catgDesc" /></td>
			</tr>

			<tr>
				<td colspan="2">
					<center>
						<input type="submit" value="ADD CATEGORY" />
					</center>
				</td>
			</tr>

		</table>
	</form>


	<table class="table-bordered" style="margin: 0 auto;">
		<tr>
			<td>Category Id &nbsp</td>
			<td>Category Name &nbsp</td>
			<td>Category Description &nbsp</td>
			<td>Operations</td>
		</tr>

		<c:forEach items="${listCategories}" var="category">
			<tr>
				<td>
					<center>${category.categoryId}</center>
				</td>
				<td>
					<center>${category.categoryName}</center>
				</td>
				<td>
					<center>${category.categoryDesc}</center>
				</td>

				<td><a
					href="<c:url value="/editCategory/${category.categoryId}"/>"
					class="btn btn-success"> EDIT </a></td>
				<td><a
					href="<c:url value="/deleteCategory/${category.categoryId}"/>"
					class="btn btn-danger"> DELETE </a></td>
			</tr>
		</c:forEach>
	</table>

</body>