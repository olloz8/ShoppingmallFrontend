<%@ page language="java" contentType="text/html"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<html>
<head>
<meta charset="utf-8">
<title>Seasons</title>

<meta name=viewport content="width=device-width , intial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<%--카테고리 아이콘--%>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">


<style>
.navbar-custom {
	background-color: black;
	border: none;
	z-index: 2;
}

.maintext {
	position: absolute;
	font-family: 'Playfair Display', serif;
	font-size: 80px;
	font-weight: bolder;
	text-align: left;
	line-height: 75%;
	top: 40%;
	left: 60%;
	transform: translate(-30%, -50%);
}

.mainimage {
	text-align: center;
	margin-top: -20px;
	z-index: 1;
}

.welcome {
	position: absolute;
	top: 5%;
	transform: translate(-30%, -50%);
}

.test {
	background-color: black;
	position: absolute;
	height: 8%;
	width: 110%;
	top: -1px;
	left: -10%;
}

footer {
	font-color: gray;
}
</style>

</head>

<body>

	<div class="container">
		<nav class="navbar navbar-inverse navbar-custom">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="<c:url value='/index.jsp' />"></i>Seasons</a>
				</div>

				<%--로그인 상태가 아닐 때--%>

				<c:if test="${!sessionScope.loggedIn}">

					<ul class=" nav navbar-nav">

						<li><a href="<c:url value="/" />"> <i class='fas fa-home'></i>
								HOME
						</a></li>
						
						<li><a href="<c:url value='/allProducts' />"> <i class='fas fa-tags'></i>ALL</a></li>

						<li><a href="<c:url value='/productDisplay/108' />"> <i class='fas fa-tags'></i> OUTER</a></li>
    					<li><a href="<c:url value='/productDisplay/109' />"> <i class='fas fa-tags'></i> TOP</a></li>
    					<li><a href="<c:url value='/productDisplay/110' />"> <i class='fas fa-tags'></i> BOTTOM</a></li>
							
						<li><a href="<c:url value="/board" />"> <i
								class='fas fa-comment'></i> REVIEW
						</a></li>

						<li style="margin-left: 200px;"><a
							href="<c:url value="/login" />"> <i class='fas fa-user-alt'></i>
								LOGIN
						</a></li>
						<li><a href="<c:url value="/register" />"> <i
								class='fas fa-user-plus'></i> REGISTER
						</a></li>
					</ul>
				</c:if>


				<%--로그인 상태 : 관리자--%>
				<c:if test="${sessionScope.loggedIn}">
					<c:if test="${sessionScope.role=='ROLE_ADMIN'}">

						<ul class=" nav navbar-nav">

							<li><a href="<c:url value="/product" />"> <i
									class='fas fa-edit'></i> PRODUCT
							</a></li>

							<li><a href="<c:url value="/category" />"> <i
									class='fas fa-edit'></i> CATEGORY
							</a></li>
							<li><a href="<c:url value='/allProducts' />"> <i class='fas fa-tags'></i> ALL</a></li>

						<li><a href="<c:url value='/productDisplay/108' />"> <i class='fas fa-tags'></i> OUTER</a></li>
    					<li><a href="<c:url value='/productDisplay/109' />"> <i class='fas fa-tags'></i> TOP</a></li>
    					<li><a href="<c:url value='/productDisplay/110' />"> <i class='fas fa-tags'></i> BOTTOM</a></li>
							
							<li><a href="<c:url value="/board" />"> <i
									class='fas fa-comment'></i> REVIEW
							</a></li>
	
					</c:if>

					<%--로그인 상태 : 유저--%>
					<c:if test="${sessionScope.role=='ROLE_USER'}">
						<ul class=" nav navbar-nav">
							<li><a href="<c:url value='/allProducts' />"> <i class='fas fa-tags'></i> ALL</a></li>

						<li><a href="<c:url value='/productDisplay/108' />"> <i class='fas fa-tags'></i> OUTER</a></li>
    					<li><a href="<c:url value='/productDisplay/109' />"> <i class='fas fa-tags'></i> TOP</a></li>
    					<li><a href="<c:url value='/productDisplay/110' />"> <i class='fas fa-tags'></i> BOTTOM</a></li>
							
							<li><a href="<c:url value="/board" />"> <i
                          			 class='fas fa-comment'></i> REVIEW
                     		</a></li>
							<li><a href="<c:url value="/cart" />"> <i
									class='fas fa-shopping-cart'></i> CART
							</a></li>
							
							<li><a href="<c:url value="/wish" />"> <i
                           class='fa fa-heart'></i> WISH
                     		</a></li>
							<li><a href="<c:url value="/myorders" />"> <i
									class='fa fa-shopping-bag'></i> ORDERS
							</a></li>

						</ul>
					</c:if>
				</c:if>

			</div>

			<div class="welcome"></div>
			<c:if test="${sessionScope.loggedIn}">
				<div style="position: absolute; top: 9px; right: 1px;">
					<font color="white" ; face="calibri" size="3" margin-top="5px";>
						Hello, ${sessionScope.username} </font> <a
						href="<c:url value="/perform_logout" />" class="btn btn-danger">
						<i class='fas fa-power-off'></i> Logout
					</a>
				</div>
			</c:if>
	</div>
	</nav>
	</div>
	<div class="test"></div>
</body>
</html> 