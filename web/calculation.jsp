<%-- 
    Document   : calculation.jsp
    Created on : Nov 27, 2018, 10:57:12 PM
    Author     : DELL
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Summary Page</title>
         <link rel="stylesheet" href="css3/bootstrap.min.css">
         <link rel="stylesheet" href="css3/login.css">
    </head>
    <body>
         

     <div>
         <h1 class="danger" align="center" > SALARY STATEMENT</h1>
                
     </div>
        <div class="col-sm-12">
     <div class="row">
         <div class="col-sm-6">  
             <img src="give.jpg" align="left" style="width:100%; height:750px;">
         </div>
         
         <div class="col-sm-6" style="border:5px;"> 
             
           <%
                    	out.println("<h3>Employee Details </h3>");
                    out.println("<table border=5 height=100 width=600 align=center>");
                    String email = request.getParameter("email");
                      
               try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket", "root", "");
                        
                        String query = "Select* from user where email ='"+email+"'";
                        
                       PreparedStatement ptmt = con.prepareStatement(query);
                        ResultSet rs = ptmt.executeQuery();
                        if (rs.next()){
                              
                out.println("<tr>");
				out.println("<td>Employee Name</td>");
                                
                   out.println("<form>");
                    String f_Name = rs.getString("f_Name");
                    out.print("<td> <input type=text value='"+f_Name+"' name='f_Name'></td>");
                  
				out.println("</tr>");
              out.println("<tr>");
			out.println("<td>Designation</td>");
                        String category = rs.getString("category");
                         out.print("<td><input type=text value='"+category+"' name='category'></td>");
			
				out.println("</tr>");
                                out.println("</form>");
                        }        
                 }catch (Exception e) {
                        out.println(e.getMessage());
                    }
                out.println("</table>");
                
               %>
            
   
                    <%          
                                        
                    double basic_Salary=Double.valueOf(request.getParameter("basic_Salary"));
                    double ot_Hours =Double.valueOf(request.getParameter("ot_Hours"));
                    double loan=Double.valueOf(request.getParameter("loan"));
                    
                    double ot_Amount=ot_Hours*100;
	            double epf = basic_Salary * 10 / 100;
                    double allowances;
                    double deduction;
                    double gross_Salary;
                    double net_Salary;

                    allowances = basic_Salary * 40/100;
                    deduction = epf + loan;
                    gross_Salary= basic_Salary + allowances + ot_Amount;
                    net_Salary = gross_Salary - deduction;
          
                %>

                <h3>Salary Calculation</h3>
         <table border=5 height=500 width=600 align=center>
                <tr  align=center>
					<th> Gross Salary</th>
					<th>Amount</th>
				</tr>

                <tr align=center>
					<td>Basic Salary(Rs)</td>
					<td><%= basic_Salary %></td>
				</tr>
				
                <tr align=center>
					<td>Allowances(Rs)</td>
					<td><%= allowances %></td>
				</tr>
				
                <tr align=center>
					<td>OT Amount</td>
					<td><%= ot_Amount %></td>
				</tr>
                <tr  align=center>
					<th> Gross Salary  </th>
					<td><%= gross_Salary %></td>
				<tr>
				
                <tr  align=center>
					<th> Deductions</th>
					<th>Amount</th>
				</tr>
                <tr align=center>
					<td>EPF(10%)(Rs)</td>
					<td><%= epf %></td>
				</tr>

                <tr align=center>
					<td>Loan(Rs)</td>
					<td><%= loan %></td>
				</tr>
                <tr  align=center>
					<th> Total Deduction(Rs)</th>
					<td colspan=2><%= deduction %></td>
				<tr>


                <tr  align=center>
					<th> Net Salary</th>
					<td colspan=2><%= net_Salary %></td>
					</tr>
            </table>
           
            
     </div>
   
                                        
     </div>
        </div>
    </body>
</html>
