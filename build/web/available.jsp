<%-- 
    Document   : available
    Created on : Nov 29, 2018, 7:56:55 PM
    Author     : shaki
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Available Product</title>
          <link rel="stylesheet" href="css/product.css">
    </head>
    <body>
          
         <div id="header">
            </div> 
        
                <div id="logo">
                    <a href="index.html"><span>Super Market</span></a>
                </div>
                <ul id="navigation">
                   
                    <li>
                        <a href="AddProduct.html">Add Product</a>
                    </li>
                    <li>
                        <a href="DeleteProduct.html">Delete Product</a>
                    </li>				
                    <li>
                        <a href="UpdateProduct.html">Update Product</a>
                    </li>
                    <li class="selected">
                        <a href="availability.html">Available Product</a>
                    </li>
                </ul>
          
        
        
        <%
String available= request.getParameter("available");
String category =request.getParameter("category");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "supermarket";
String userId = "root";
String password = "";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#f1b0b7">
<td><b>Product Id</b></td>
<td><b>Product Name</b></td>
<td><b>Category</b></td>
<td><b>Expire Date</b></td>
<td><b>Unit Price</b></td>
<td><b>Quantity</b></td>
<td><b>Available</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM product WHERE available = '"+available+"' AND category = '"+category+"'";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor=" #f5c6cb">

<td><%=resultSet.getString("product_Id") %></td>
<td><%=resultSet.getString("product_Name") %></td>
<td><%=resultSet.getString("category") %></td>
<td><%=resultSet.getDate("exp_Date") %></td>
<td><%=resultSet.getDouble("unit_Price") %></td>
<td><%=resultSet.getString("quentity") %></td>
<td><%=resultSet.getString("available") %></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
                 
           <div id="footer">
            <div>
                <p>
                    © Copyright - 2018. All rights reserved.
                </p>
            </div>
        </div>    
    </body>
</html>
