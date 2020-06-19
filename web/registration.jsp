<%-- 
    Document   : registration
    Created on : Dec 1, 2018, 11:34:15 AM
    Author     : acer
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>Registration</title>
    </head>
    <body>
        <%

            String category = request.getParameter("selected");
            String fname = request.getParameter("first_name");
            String lname = request.getParameter("last_name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String phone_number = request.getParameter("phone_number");
            int get_age = Integer.parseInt(request.getParameter("age"));
            String address = request.getParameter("address");
            String gender = request.getParameter("gender");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket", "root", "");
                Statement stmt = con.createStatement();
                String query = "INSERT INTO user(category, f_Name, l_Name, email, password, phone_No, age, address, gender) VALUES ('" + category + "','" + fname + "','" + lname + "','" + email + "','" + password + "','" + phone_number + "'," + get_age + ",'" + address + "','" + gender + "')";
                int a = stmt.executeUpdate(query);
                if (a > 0) {
                        
                    response.sendRedirect("admins.html");
                } else {
                    out.println("Error While resgistering");
                }

            } catch (Exception e) {
                out.println("<p>ERROR: " + e.getMessage() + "</p>");
            }


        %>
    </body>
</html>
