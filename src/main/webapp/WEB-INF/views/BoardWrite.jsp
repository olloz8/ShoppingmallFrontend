<%@ page language="java" contentType="text/html"%>

<%@include file="Header.jsp"%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<!-- include summernote css/js-->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<style>
.navbar-custom {
	background-color: black;
	border: none;
	z-index: 2;
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
<title>글쓰기</title>

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : 'content',
			minHeight : 370,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR'
		});
	});
</script>
<head>
<meta charset="UTF-8">
</head>

<body>

	<center>

		<h3>Posting</h3>

	</center>
	<div style="width: 60%; margin: auto;">
		<form:form action="addBoard" modelAttribute="board" method="post"
			enctype="multipart/form-data">
			<form:hidden path="boardId" />
			<form:hidden path="customerName" />
				<div class="form-group">
					<form:input type="text" path="title" class="form-control"
						placeholder="Enter title" id="title" />
				</div>

				<div class="form-group">

					<form:textarea id="summernote" path="content" placeholder="content" />
				</div>
						<center>
							<input type="submit" class="btn btn-dark" value="Update Board" />
						</center>
		</form:form>
	</div>
</body>
</html>