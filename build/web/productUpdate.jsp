<%-- 
    Document   : productUpdate
    Created on : Nov 25, 2018, 9:35:31 PM
    Author     : shaki
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Product</title>
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
                    <li class="selected">
                        <a href="UpdateProduct.html">Update Product</a>
                    </li>
                    <li>
                        <a href="availability.html">Available Product</a>
                    </li>
                </ul>
           
        <div id="result">
       
        <%
                    String product_Id = request.getParameter("product_Id");
                    String product_Name = request.getParameter("product_Name");
                    String category = request.getParameter("category");
                    String unit_Price = request.getParameter("unit_Price");
                    String exp_Date = request.getParameter("exp_Date");
                    String quentity = request.getParameter("quentity");
                    String available= request.getParameter("available");
                    
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket", "root", "");
                        Statement stmt = con.createStatement();
                      String query = "UPDATE product SET  product_Name = '"+product_Name+"' , category= '"+category+"' ,unit_Price='"+unit_Price+"', exp_Date = '"+exp_Date+"', quentity ='"+quentity+"' , available ='"+available+"' WHERE  product_Id = '"+ product_Id+"'";
                    //Execute Query
                  int n = stmt.executeUpdate(query);
                  if (n!=0){
                          out.println("<h1>Record Update Successful</h1>");
                  }
                     else {
                          out.println("<h1>Error while Update</h1>");
                        }
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }
                %>
                 </div>  
           <div id="footer">
            <div>
                <p>
                    © Copyright - 2018. All rights reserved.
                </p>
            </div>
        </div>    
    </body>
</html>
