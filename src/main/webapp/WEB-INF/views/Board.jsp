<%@ page language="java" contentType="text/html"%>

<%@include file="Header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
table {
	border-collapse: collapse;
	border-spacing: 0;
}

.page-title {
	margin-bottom: 40px;
}

.page-title h3 {
	font-size: 28px;
	color: #333333;
	font-weight: 400;
	text-align: center;
}

#board-search .search-window {
	padding: 15px 0;
	background-color: #f9f7f9;
}

#board-search .search-window .search-wrap {
	position: relative;
	/*   padding-right: 124px; */
	margin: 0 auto;
	width: 80%;
	max-width: 564px;
}

#board-search .search-window .search-wrap input {
	height: 40px;
	width: 100%;
	font-size: 14px;
	padding: 7px 14px;
	border: 1px solid #ccc;
}

#board-search .search-window .search-wrap input:focus {
	border-color: #333;
	outline: 0;
	border-width: 1px;
}

#board-search .search-window .search-wrap .btn {
	position: absolute;
	right: 0;
	top: 0;
	bottom: 0;
	width: 108px;
	padding: 0;
	font-size: 16px;
}

.board-table {
	font-size: 13px;
	width: 100%;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.board-table a {
	color: #333;
	display: inline-block;
	line-height: 1.4;
	word-break: break-all;
	vertical-align: middle;
}

.board-table a:hover {
	text-decoration: underline;
}

.board-table th {
	text-align: center;
}

.board-table .th-num {
	width: 100px;
	text-align: center;
}

.board-table .th-date {
	width: 200px;
}

.board-table th, .board-table td {
	padding: 14px 0;
}

.board-table tbody td {
	border-top: 1px solid #e7e7e7;
	text-align: center;
}

.board-table tbody th {
	padding-left: 28px;
	padding-right: 14px;
	border-top: 1px solid #e7e7e7;
	text-align: left;
}

.board-table tbody th p {
	display: none;
}

.btn-dark:hover, .btn-dark:focus {
	background: #373737;
	border-color: #373737;
	color: #fff;
}

.btn-dark {
	background: #555;
	color: #fff;
}

/* reset */
* {
	list-style: none;
	text-decoration: none;
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

.clearfix:after {
	content: '';
	display: block;
	clear: both;
}

/*.container {
	width: 1100px;
	margin: 0 auto;
}*/
.blind {
	position: absolute;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	margin: -1px;
	width: 1px;
	height: 1px;
}
</style>

<body>
	<section class="Board">
		<div class="page-title">
			<div class="container">
				<h3>REVIEW</h3>
			</div>
		</div>

		<!-- board search area -->
		<div id="board-search">
			<div class="container">
				<div class="search-window">
					<form action="">
						<div class="search-wrap">
							<label for="search" class="blind">search</label> <input
								id="search" type="search" name="" placeholder="" value="">
							<button type="submit" class="btn btn-dark">search</button>
						</div>
					</form>
				</div>
			</div>
		</div>


		<!-- board list area -->
		<div id="board-list">
			<div class="container">
				<table class="board-table">
					<thead>
						<tr>
							<th scope="col" class="th-num">No</th>
							<th scope="col" class="th-title">Title</th>
							<th scope="col" class="th-user">User</th>
							<th scope="col" class="th-date">Date</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="board" items="${boardList}">
							<tr>
								<td>${board.boardId}</td>
								<td><a
									href="<c:url value='/boardView?boardId=${board.boardId}' />">${board.title}</a></td>
								<td>${board.customerName}</td>
								<td><fmt:formatDate value="${board.date}"
										pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
				<br>
				<td><a href="<c:url value="/boardWrite" />"
					class="btn btn-dark">Post</a></td>
			</div>
			<br>
			<br>

		</div>
	</section>
	
	<%@include file="/WEB-INF/views/Footer.jsp"%>
</body>