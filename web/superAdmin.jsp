<%-- 
    Document   : register
    Created on : Nov 23, 2018, 7:29:24 AM
    Author     : Madushani
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Super Admin</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/dashboard.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
       <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <a class="navbar-brand" href="#">A9 Supermarket</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse">☰</button> 
            <div class="collapse navbar-collapse" id="navbar-collapse">
		<ul class="nav navbar-nav ml-auto">
                    <li class="nav-item">
                        <a href="availability.html"><i class="fa fas fa-cart-arrow-down"></i> products</a>
                    </li>
                    <li class="nav-item">
                        <a href="admins.html"><i class="fa far fa-id-badge"></i> Employees</a>
                    </li>
                    <li class="nav-item">
                        <a href="index.html"><i class="fa far fa-id"></i> Calculate Salary</a>
                    </li>
                    <li class="nav-item dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><% out.println(request.getParameter("f_name")); %></a>
                            <div class="dropdown-menu dropdown-menu-right">
                            <div class="dropdown-divider"></div>
	<a class="dropdown-item" href="logout.jsp" style="color:black;"><i class="fa fa-sign-out"></i> LogOut</a>
                            </div>
                    </li>
		</ul>
            </div>
	</nav>
                            
        <p><br/></p>
        <div class = "row"> 
            <div class="col-sm-1"></div>
                <div class="col-sm-10">
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
                                    
                                </tr>
                                <%
                                    }
                                %>
                                
                            </tbody>  
                        </table>
                        </div>
                        <div class="col-sm-1"></div>
                        </div>
                        </body>
                        </html>
    </body>
</html>
