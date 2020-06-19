<%-- 
    Document   : receipt
    Created on : Dec 2, 2018, 4:09:24 PM
    Author     : Piyumi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>

<!DOCTYPE html>

<html>
    <head>
        <title>Selection JSP Page</title>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
    </head>
    <body>
         <pre>
**********************************************************************************
                                  Super market     RECEIPT
**********************************************************************************
        </pre>
        

        <div>
           
                <table border="0">
                    <thead>
                        <tr>
                            
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Unit Price(Rs.)</th>
                            <!--<th>Total Price(Rs.)</th>
                            <th>Sum(Rs.)</th>
                            <th>Cash Price(Rs.)</th>
                            <th>Balance(Rs.)</th>-->
                        </tr>
                    </thead>
                    <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket", "root", "");
                        Statement stmt = con.createStatement();
                        String query = "SELECT * FROM item ";
                                             
                    ResultSet rs = stmt.executeQuery(query);
                         while(rs.next()){
                         %>
                    <tbody>
               
                        <tr>
                        
                    <td><%=rs.getString("product_Name") %></td>
                    <td><%=rs.getString("quentity") %></td>
                    <td><%=rs.getString("unit_Price") %></td>
                   <!-- <td><%=rs.getString("total_Price") %></td> 
                    <td><%=rs.getString("sum") %></td>
                    <td><%=rs.getString("cash") %></td>
                    <td><%=rs.getString("balance") %></td> -->
                    </tr>
                           
                    </tbody>
                    <%
                        }
                    }
                     catch (Exception e) {
                        out.println(e.getMessage());
                    }%>
                </table>
                 
            </form>
            <br>
            <pre>**********************************Thank You!**************************************</pre>

        </div>
                      
    </body>
</html>


