<%@ page language="java" contentType="text/html"%>
<%@include file="Header.jsp" %>


<body background="https://www.noupe.com/wp-content/uploads/2009/10/hybrid-genesis.jpg">

<div class="container">
<table class="table table-bordered">

  <tr class="danger">
    <td colspan="5"><center>${sessionScope.username} Orders </center> </td>
  </tr>
  
  <tr>
    <td> Product Id </td>
    <td> Product Name </td>
    <td> Quantity </td>
    <td> Price </td> 
    <td> SubTotal </td>
    <td> Payment Status </td>
  </tr>
  
  <c:forEach items="${paidItemList}" var="paidItem">
  
  
    <tr class="info">
      <td> ${paidItem.productId}</td>
      <td> ${paidItem.productName}</td>
      <td> ${paidItem.quantity} </td>
      <td> ${paidItem.price}</td>
      <td> ${paidItem.price * paidItem.quantity}</td>
      <td>  ${paidItem.paymentStatus }</td>
      
    </tr>
  
 
  </c:forEach>


</table>
</div>

</body>