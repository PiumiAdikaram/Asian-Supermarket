<%-- 
    Document   : register
    Created on : Dec 1, 2018, 12:58:21 PM
    Author     : Madushani
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>

<%
    try{
        String email = request.getParameter("email");
        String pwd = request.getParameter("pwd");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket", "root", "");
        Statement st = con.createStatement();
        ResultSet rs;
        String query="select * from user where email='"+email+"' and password='"+pwd+"'";
        rs = st.executeQuery(query);
        
        if(rs.next()){
            session.setAttribute("email",rs.getString("email"));
            
            if(rs.getString("category").equals("salesman")){
                response.sendRedirect("salesman.jsp?f_name="+rs.getString("f_name"));
            }
            else if(rs.getString("category").equals("admin")){
                response.sendRedirect("admin.jsp?f_name="+rs.getString("f_name"));
            }
        }
        else{
            String query1="select * from superadmin where email='"+email+"' and password='"+pwd+"'";
            rs = st.executeQuery(query1);
            if(rs.next()){
                
                session.setAttribute("email",rs.getString("email"));
                response.sendRedirect("superAdmin.jsp?f_name="+rs.getString("f_name"));
                response.sendRedirect("admins.html?f_name="+rs.getString("f_name"));
            }
            else{
                 out.println("<h4>Enter correct username and password!</h4>");
            }
        }
        
    }catch(Exception e){
        out.println(e.getMessage());
    }
%>