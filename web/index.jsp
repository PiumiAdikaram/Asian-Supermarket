<%-- 
    Document   : index
    Created on : Dec 2, 2018, 8:25:47 PM
    Author     : acer
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control","no-cache, no-store, multi-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires", 0); 
    if(session.getAttribute("email") == null){
    response.sendRedirect("login.jsp");
    }                       
%>
<html>

    <head>

        <title>View the Records</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
    </head>
    <body>
        <p><br/></p>
        <div class = "row">
            <div class = "col-md-3">
                <h2>Employee Data<h2>
                        </div>
                        <div class = "col-md-4">
                            <form action ="" method = "get">
                                <input type = "text" class = "form-control" name = "q" placeholder = "Search here..."/>
                        </div>
                        <div class = "col-md-2">
                            <a href = "index.jsp" class = "btn btn-default">View All Records</a>
                        </div>
                        <div class = "col-md-3 text-right">
                            <a href = "admins.html" class = "btn btn-primary">Add New Employee</a>
                        </div>
                        </div>
                        <p></p>   
                        <table class = "table table bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>User ID</th>
                                    <th>Category</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Email</th>
                                    <th>Password</th>
                                    <th>Phone Number</th>
                                    <th>Age</th>
                                    <th>Address</th>
                                    <th>Gender</th>

                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String host = "jdbc:mysql://localhost:3306/supermarket";
                                    Connection conn = null;
                                    Statement stat = null;
                                    ResultSet res = null;
                                    Class.forName("com.mysql.jdbc.Driver");
                                    conn = DriverManager.getConnection(host, "root", "");
                                    stat = conn.createStatement();
                                    String query = request.getParameter("q");
                                    String data;
                                    if (query != null) {
                                        data = "SELECT * FROM user WHERE f_Name like '%" + query + "%' or l_Name like '%" + query + "%' or email like '%" + query + "%' or phone_No like '%" + query + "%' or category like '%" + query + "%' or age like '%" + query + "%'";
                                    } else {
                                        data = "SELECT * FROM user ORDER BY user_Id DESC";
                                    }
                                    res = stat.executeQuery(data);
                                    while (res.next()) {

                                %>
                                <tr>
                                    <td><%=res.getString("user_Id")%></td>
                                    <td><%=res.getString("category")%></td>
                                    <td><%=res.getString("f_Name")%></td>
                                    <td><%=res.getString("l_Name")%></td>
                                    <td><%=res.getString("email")%></td>
                                    <td><%=res.getString("password")%></td>
                                    <td><%=res.getString("phone_No")%></td>
                                    <td><%=res.getString("age")%></td>
                                    <td><%=res.getString("address")%></td>
                                    <td><%=res.getString("gender")%></td>
                                    <td class = "text-center">
                                        <a href ='delete.jsp?d=<%=res.getString("user_Id")%>' class = "btn btn-danger">Delete</a>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                                
                            </tbody>  
                        </table>
                        </body>
                        </html>
