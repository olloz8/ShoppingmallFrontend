<%@ page language="java" contentType="text/html"%>

<%@include file="Header.jsp"%>


<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
table {
    border-collapse: collapse;
    width: 500px;
    margin: 1rem auto;
    background-color: white;
}

td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
    text-align: center;
    box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.1);
    white-space: nowrap;
}

.btn-success {
    background-color: black;
    color: #ffffff;
    border-width: 2px;
    border-style: solid;
    border-color: black;
    border-radius: 5px;
}
</style>

<body>
    <table class="table-bordered" align="center">
        <tr>
            <td rowspan="9"><img
                src="<c:url value="/resources/images/${product.productId}.jpg" />"
                alt="Generic placeholder thumbnail" width="400" height="600">
            </td>
        </tr>

        <tr>
            <td>Product Name</td>
            <td>${product.productName}</td>
        </tr>

        <tr>
            <td>Price</td>
            <td>${product.price}</td>
        </tr>

        <tr>
            <td>Stock</td>
            <td>${product.stock}</td>
        </tr>

        <tr>
            <td>Description</td>
            <td>${product.productDesc}</td>
        </tr>

       <tr>
    <td>Quantity</td>
    <td>
        <select name="quantity" id="quantitySelect">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
        </select>
    </td>
</tr>

<script>
    // 수량 선택이 변경되었을 때 이벤트 처리
    document.getElementById("quantitySelect").addEventListener("change", function() {
        var selectedQuantity = this.value;
        document.getElementById("selectedQuantity").value = selectedQuantity;
    });
</script>

            <td colspan="2">
                 <form action="<c:url value="/addToCart/${product.productId}" />" method="post">
        		<input type="hidden" id="selectedQuantity" name="quantity" value="1">
        		<input type="submit" value="Add to Cart" class="btn btn-success">
    			</form>
                <span style="margin: 0 10px;"></span>
                <form action="<c:url value="/addToWish/${product.productId}" />" method="post">
                    <input type="hidden" name="quantity" value="1">
                    <input type="submit" value="Add to Wish List" class="btn btn-success">
                </form>
            </td>
        </tr>
    </table>
</body>