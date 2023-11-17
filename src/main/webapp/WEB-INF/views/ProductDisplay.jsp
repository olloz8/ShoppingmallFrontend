<%@ page language="java" contentType="text/html"%>

<%@include file="Header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<body>
 <div class="row">
        <c:forEach items="${productList}" var="product">
            <div class="col-sm-4 col-md-3">
                <a href="<c:url value='/totalProductDisplay/${product.productId}' />" class="thumbnail">
                    <img src="<c:url value='/resources/images/${product.productId}.jpg' />" alt="Generic placeholder thumbnail" width="400" height="700">
                </a>
                <p align="center">${product.productName}</p>
                <p align="center">
                    Price: <fmt:formatNumber type="number" pattern="#,##0" value="${product.price}" />
                </p>
                <p align="center">Stock: ${product.stock}</p>
            </div>
        </c:forEach>
    </div>
    <footer style="text-align: center; background-color: black; color: white;">
        <br>
        <p>Copyright (C) Seasons All Right Reserved</p>
        <br>
    </footer>
	
</body>