<%@ page language="java" contentType="text/html"%>
<%@include file="Header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<body>

<div class="container">
  <table class="table table-bordered">

    <tr class="danger">
      <td colspan="5"><center>${sessionScope.username} Cart </center> </td>
    </tr>
  
    <tr>
      <td> Product Id </td>
      <td> Product Name </td>
      <td> Quantity </td>
      <td> Price </td> 
      <td> SubTotal </td>
      <td> Operation </td>
    </tr>
  
     <c:forEach items="${cartItemList}" var="cartItem">
            <form action="<c:url value="/updateCartItem/${cartItem.cartItemId}"/>" method="post">
                <tr class="info">
                    <td> ${cartItem.productId}</td>
                    <td> ${cartItem.productName}</td>
                    <td> <input type="text" value="${cartItem.quantity}" name="quantity"></td>
                    <td> <fmt:formatNumber value="${cartItem.price}" pattern="#,##0" /> </td>
                    <td> <fmt:formatNumber value="${cartItem.price * cartItem.quantity}" pattern="#,##0" /> </td>
                    <td>
                        <input type="submit" value="UPDATE" class="btn btn-success" />
                        <a href="<c:url value="/deleteCartItem/${cartItem.cartItemId}"/>" class="btn btn-danger"> DELETE </a>
                    </td>
                </tr>
            </form>
        </c:forEach>
  
    <tr class="warning">
      <td colspan="4"> Total Purchase Amount </td>
      <td colspan="2"><fmt:formatNumber value="${grandTotal}" pattern="#,##0" /> </td> 
    </tr>
  
    <tr class="info">
      <td colspan="3">
        <center> <a href="<c:url value="/productDisplay" />" class="btn btn-success"> Continue Shopping </a> </center>
      </td>
      <td colspan="3"> 
        <center> <a href="<c:url value="/checkout" />" class="btn btn-success"> Check Out </a> </center>
      </td>
    </tr>

  </table>
</div>
</body>