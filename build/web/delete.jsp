<%-- 
    Document   : delete
    Created on : Dec 3, 2018, 12:14:47 AM
    Author     : acer
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String id = request.getParameter("d");
    int no = Integer.parseInt(id);
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket", "root", "");
    Statement stat = conn.createStatement();
    stat.executeUpdate("delete from user where user_Id = '" + no + "'");
    response.sendRedirect("index.jsp");

%>