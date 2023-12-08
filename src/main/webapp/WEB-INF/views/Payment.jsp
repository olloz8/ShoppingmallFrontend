<%@ page language="java" contentType="text/html"%>
<%@include file="Header.jsp" %>

<body>

<div class="container">
 <form action="<c:url value="/receipt" />" method = "post"> 
  <table class="table table-bordered" width ="50%" align="center">
    <tr class="success">
      <td colspan="2"><center> Payment Detail </center> </td>
    </tr>
    
    <tr class="info">
      <td colspan="2"> 
        <center>
        <input type="radio" name="pmode" value="CC" checked> Credit Card

        </center>
      </td>
      
    </tr>
    
    <tr class="warning">
      <td> Card Number </td>
      <td> <input type="text" name="cardno"/> </td>
    </tr>
    
    <tr class="warning">
      <td>Valid &nbsp; <input type="text" name="Valid"> </td>
      <td>CVV <input type="text" name="CVV"/> </td>
    </tr>
    
    <tr class="success">
      <td> Name of CardHolder </td>
      <td> <input type="text" name="name"/> </td>
    </tr>
    
    <tr class="success">
      <td colspan="2"><center> <input type="submit" value="Pay" class="btn btn-success"/> </center></td>
    </tr>

  </table>
 </form> 
</div>
</body>