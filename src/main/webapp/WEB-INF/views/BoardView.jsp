<%@ page language="java" contentType="text/html"%>

<%@include file="Header.jsp"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
#board-search .search-window {
	padding: 15px 0;
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

table {
	border-collapse: collapse;
	border-spacing: 0;
	border-top: 1px solid #e7e7e7;
	border-bottom: 1px solid #e7e7e7;
}

th, td {
	border-bottom: 1px solid #e7e7e7;
	padding: 10px;
}

td {
	test-align: left;
}

.board-table {
	font-size: 13px;
	width: 80%;
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
}

.board-table .th-content {
	width: 200px;
	text-align: center;
}

.board-table .th-title {
	width: 200px;
	text-align: center;
}

.board-table .th-date {
	width: 200px;
	text-align: center;
}

.board-table .th-user {
	width: 200px;
	text-align: center;
}

.board-table .th-content {
	width: 200px;
	text-align: center;
}

.board-table th, .board-table td {
	padding: 14px 0;
}

.board-table tbody th {
	padding-left: 28px;
	padding-right: 14px;
	text-align: left;
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
</style>

<head>
<meta charset="UTF-8">
</head>
<body>
	<h2 style="text-align: center;">View</h2>
	<div id="board-list">
		<div class="container">
			<table class="board-table" style="margin: 0 auto;">
				<thead>
					<tr>
						<th scope="col" class="th-title">Title</th>
						<td>${board.title}</td>
						<th scope="col" class="th-date"></th>
						<td></td>
					</tr>

					<tr>
						<th scope="col" class="th-user">Name</th>
						<td colspan='2'>${board.customerName}</td>

					</tr>
				<tbody>
					<tr>
						<th scope="col" class="th-content">Content</th>
						<td colspan='2'>${board.content}</td>
				</thead>
				</tbody>


				<tr>
					<td><a href="<c:url value='/board'/>" class="btn btn-dark">pre</a></td>
					<td></td>
					<td>
					            <c:if test="${sessionScope.role == 'ROLE_ADMIN' || sessionScope.username == board.customerName}">
					<a
						href="<c:url value='/updateBoard?boardId=${board.boardId}'/>"
						class="btn btn-dark">edit</a>
						</c:if>
						<c:if test="${sessionScope.role == 'ROLE_ADMIN' || sessionScope.username == board.customerName}">
						
						 <a
						href="<c:url value='/deleteBoard?boardId=${board.boardId}'/>"
						class="btn btn-dark">delete</a></c:if></td>
				</tr>
			</table>
		</div>


<!-- 댓글 작성 폼 -->
<h4 style="margin-left: 20%; font-weight: bold;">Leave a Comment</h4>
<div style="width: 60%; margin: 0 auto;">
    <c:if test="${sessionScope.role == 'ROLE_ADMIN'}">
        <form action="addComment" method="post">
            <input type="hidden" name="boardId" value="${board.boardId}">
            <input type="text" name="content" required
                placeholder="Your comment here" style="width: 90%; height: 5%;">
            <button type="submit" class="btn btn-dark">Submit</button>
        </form>
    </c:if>
</div>


<!-- 댓글 목록 -->
<div style="width: 50%; margin-left: 20%">
    <c:forEach var="comment" items="${comments}">
        <div style="display: flex; align-items: start;">

            <!-- 댓글 리스트 -->
            <p>${comment.customerName}</p>
            <p style="margin-left: 20px;" id="content_${comment.commentId}">${comment.content}</p>

            <!-- 댓글 수정 -->
            <c:if test="${sessionScope.username == comment.customerName}">
                <button onclick="showEditForm(${comment.commentId})"
                    class="btn btn-default btn-xs">Edit</button>
                <form id="editForm_${comment.commentId}" style="display: none;"
                    action="updateComment" method="post">
                    <input type="hidden" name="commentId" value="${comment.commentId}">
                    <input type="hidden" name="boardId" value="${comment.boardId}">
                    <input type="hidden" name="customerName" value="${comment.customerName}">
                    <input type="text" name="content" value="${comment.content}">
                    <button type="submit" class="btn btn-default btn-xs">Update</button>
                </form>
            </c:if>

            <!-- 댓글 삭제 -->
            <c:if test="${sessionScope.username == comment.customerName}">
                <form action="deleteComment" method="post">
                    <input type="hidden" name="commentId" value="${comment.commentId}">
                    <input type="hidden" name="boardId" value="${comment.boardId}">
                    <button type="submit" class="btn btn-default btn-xs">Delete</button>
                </form>
            </c:if>
        </div>
    </c:forEach>
</div>
		<script>
function showEditForm(commentId) {
    document.getElementById('content_' + commentId).style.display = 'none';
    document.getElementById('editForm_' + commentId).style.display = 'block';
}
</script>
</div>
</body>
</html>