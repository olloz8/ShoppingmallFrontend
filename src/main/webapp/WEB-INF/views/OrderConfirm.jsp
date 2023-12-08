<%@ page language="java" contentType="text/html"%>
<%@include file="Header.jsp" %>

<body>

<div class="container">
<table class="table table-bordered">

<tr class="danger">
    <td colspan="3"><center> Your Order </center> </td>
  </tr>
  
  <tr>
    <td> Product Id </td>
    <td> Product Name </td>
    <td> Quantity </td>
    <td> Price </td> 
    <td> SubTotal </td>
  </tr>
  
  <c:forEach items="${cartItemList}" var="cartItem">
  
  
    <tr class="info">
      <td> ${cartItem.productId}</td>
      <td> ${cartItem.productName}</td>
      <td> ${cartItem.quantity}</td>
      <td> ${cartItem.price}</td>
      <td> ${cartItem.price * cartItem.quantity}</td>
      
   </tr>
  </c:forEach>
  
  <tr class="warning">
     <td colspan="4"> Total Purchase Amount </td>
     <td colspan="1"> ${grandTotal} </td> 
  </tr>
  
  <tr class="warning">
    <td colspan="5"> Shipping Address</td>
    
  </tr>
  
  <form action="<c:url value="/updateAddress" />" method="post">
  <tr class="info">
   
    <td> Address </td>
    <td colspan="3"> <textarea name="addr" cols="100" rows="3"> ${addr} </textarea></td>
    <td> <input type="submit" value="Update Addess" class="btn btn-success" /> </td>
    
  </tr>
  </form>
  
  <tr class = "info">
    <td colspan="3">
      <center> <a href="<c:url value="/cart" />" class="btn btn-success"> Modify Cart </a> </center>
    </td>
    
    <td colspan="3"> 
      <center> <a href="<c:url value="/payment" />" class="btn btn-success"> Confirm Order </a> </center>
    </td>
   
  </tr>
  


</table>
</div>

</body>