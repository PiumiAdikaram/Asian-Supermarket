<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
        <title>adminDashboard</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/dashboard.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
       <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <a class="navbar-brand" href="admin.jsp">A9 Supermarket</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse">☰</button> 
            <div class="collapse navbar-collapse" id="navbar-collapse">
		<ul class="nav navbar-nav ml-auto">
                    <li class="nav-item">
                        <a href="availability.html"><i class="fa fas fa-cart-arrow-down"></i> products</a>
                    </li>


                    <li class="nav-item dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><% out.println(request.getParameter("f_name")); %></a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="adminAccountSetting.jsp" style="color:black;">Account Settings</a>
                            <div class="dropdown-divider"></div>
				<a class="dropdown-item" href="logout.jsp" style="color:black;"><i class="fa fa-sign-out"></i> LogOut</a>
                            </div>
                    </li>
		</ul>
            </div>
	</nav>
        
<%
    
    if("POST".equalsIgnoreCase(request.getMethod())){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket", "root", "");
            Statement st = con.createStatement();
            
            
            ResultSet rs;
            String query1 = "select * from user where email='"+session.getAttribute("email")+"'";
            rs = st.executeQuery(query1);
            
            if(request.getParameter("change")!=null){
                
                
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                
                while(rs.next()){
                    if(fname.isEmpty()){
                        fname=rs.getString("f_name");
                    }
                    if(lname.isEmpty()){
                        lname=rs.getString("l_name");
                    }
                    if(email.isEmpty()){
                        email=rs.getString("email");
                    }
                    if(phone.isEmpty()){
                        phone=rs.getString("phone_No");
                    }
                }
                String query = "update user set f_name = '"+fname+"', l_name='"+lname+"',email='"+email+"', phone_No='"+phone+"' where email='"+session.getAttribute("email")+"'";
                int n = st.executeUpdate(query);
                if (n!=0){
%>
                   <div class="alert alert-success">
                        <strong>Updated Successfully!</strong>
                   </div>    
<%                   
                }else{
%>
                   <div class="alert alert-danger">
                        <strong>Error while Updating</strong>
                   </div>    
<%
                }       
        }
            if(request.getParameter("change_pass")!=null){

                String current_pass = request.getParameter("current_pass");
                String new_pass = request.getParameter("new_pass");
                String renew_pass = request.getParameter("renew_pass");
                
                if(rs.next()){
                    if(current_pass.equals(rs.getString("password"))){
                        if(new_pass.equals(renew_pass)){
                            
                            String query3= "update user set password='"+new_pass+"' where email='"+session.getAttribute("email")+"'";
                            int m = st.executeUpdate(query3);
                            if(m!=0){
                            %>
                                <div class="alert alert-success">
                                    <strong>Updated Successfully!</strong>
                                </div>    
                            <% 
                            }else{
                            %>
                                <div class="alert alert-danger">
                                    <strong>Error while Updating</strong>
                                </div>    
                            <% 
                            }
                        }else{
                        %>
                                <div class="alert alert-danger">
                                    <strong>Passwords do not match</strong>
                                </div>    
                        <% 
                        }
                        
                    }else{
                        %>
                                <div class="alert alert-danger">
                                    <strong>You have entered a wrong password</strong>
                                </div>    
                        <% 
                    }
                }
                
                
            }
        }catch(Exception e){
            out.println(e.getMessage());
        }
        
    }
%>
                <form action="" method="POST">
                    <div class="topic" style="margin-bottom: 5%;">
                        <h5>Change Your Details</h5>
                    </div>
                    <div class="form-group row">
                        <label for="fname" class="col-sm-3 col-form-label">First Name</label>
                        <div class="col-sm-9">
                        <input name="fname" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="lname" class="col-sm-3 col-form-label">Last name</label>
                        <div class="col-sm-9">
                        <input name="lname" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="email" class="col-sm-3 col-form-label">Email</label>
                        <div class="col-sm-9">
                        <input name="email" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="phone" class="col-sm-3 col-form-label">Phone No</label>
                        <div class="col-sm-9">
                        <input name="phone" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-9">
                            <button type="submit" class="btn btn-success btn-sm" name="change">Save Changes</button>
                        </div>
                    </div>
                    <br>
                    <hr>
                    <br>

                    <div class="topic" style="margin-bottom: 5%;">
                        <h5>Change Password</h5>
                    </div>
                    <div class="form-group row">
                        <label for="currrent_pass" class="col-sm-3 col-form-label">Current Password</label>
                        <div class="col-sm-9">
                        <input type="password" name="current_pass" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="new_pass" class="col-sm-3 col-form-label" >New Password</label>
                        <div class="col-sm-9">
                        <input type="password" name="new_pass" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="renew_pass" class="col-sm-3 col-form-label">Confirm Password</label>
                        <div class="col-sm-9">
                        <input type="password" name="renew_pass" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-9">
                            <button type="submit" class="btn btn-success btn-sm" name="change_pass">Save Changes</button>
                        </div>
                    </div>
                </form>
                
                
    </body>
    </body>
</html>