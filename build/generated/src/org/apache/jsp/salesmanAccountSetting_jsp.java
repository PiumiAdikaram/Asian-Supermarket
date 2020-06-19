package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class salesmanAccountSetting_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");

    response.setHeader("Cache-Control","no-cache, no-store, multi-revalidate");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader("Expires", 0); 
    if(session.getAttribute("email") == null){
        response.sendRedirect("login.jsp");
    }
                    
                    

      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">  \n");
      out.write("        <title>adminDashboard</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/dashboard.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\n");
      out.write("\t<script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js\"></script>\n");
      out.write("\t<script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js\"></script>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("       <nav class=\"navbar navbar-expand-sm bg-dark navbar-dark\">\n");
      out.write("            <a class=\"navbar-brand\" href=\"salesman.jsp\">A9 Supermarket</a>\n");
      out.write("            <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbar-collapse\">☰</button> \n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"navbar-collapse\">\n");
      out.write("\t\t<ul class=\"nav navbar-nav ml-auto\">\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a href=\"availability.html\"><i class=\"fa fas fa-cart-arrow-down\"></i> products</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a href=\"index.html\"><i class=\"fa far fa-id\"></i> Salary Calculation</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li class=\"nav-item dropdown\">\n");
      out.write("\t\t\t<a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\">");
 out.println(request.getParameter("f_name")); 
      out.write("</a>\n");
      out.write("                            <div class=\"dropdown-menu dropdown-menu-right\">\n");
      out.write("                                <a class=\"dropdown-item\" href=\"salesmanAccountSetting.jsp\" style=\"color:black;\">Account Settings</a>\n");
      out.write("                            <div class=\"dropdown-divider\"></div>\n");
      out.write("\t\t\t\t<a class=\"dropdown-item\" href=\"logout.jsp\" style=\"color:black;\"><i class=\"fa fa-sign-out\"></i> LogOut</a>\n");
      out.write("                            </div>\n");
      out.write("                    </li>\n");
      out.write("\t\t</ul>\n");
      out.write("            </div>\n");
      out.write("\t</nav>\n");
      out.write("        \n");

    
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

      out.write("\n");
      out.write("                   <div class=\"alert alert-success\">\n");
      out.write("                        <strong>Updated Successfully!</strong>\n");
      out.write("                   </div>    \n");
                   
                }else{

      out.write("\n");
      out.write("                   <div class=\"alert alert-danger\">\n");
      out.write("                        <strong>Error while Updating</strong>\n");
      out.write("                   </div>    \n");

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
                            
      out.write("\n");
      out.write("                                <div class=\"alert alert-success\">\n");
      out.write("                                    <strong>Updated Successfully!</strong>\n");
      out.write("                                </div>    \n");
      out.write("                            ");
 
                            }else{
                            
      out.write("\n");
      out.write("                                <div class=\"alert alert-danger\">\n");
      out.write("                                    <strong>Error while Updating</strong>\n");
      out.write("                                </div>    \n");
      out.write("                            ");
 
                            }
                        }else{
                        
      out.write("\n");
      out.write("                                <div class=\"alert alert-danger\">\n");
      out.write("                                    <strong>Passwords do not match</strong>\n");
      out.write("                                </div>    \n");
      out.write("                        ");
 
                        }
                        
                    }else{
                        
      out.write("\n");
      out.write("                                <div class=\"alert alert-danger\">\n");
      out.write("                                    <strong>You have entered a wrong password</strong>\n");
      out.write("                                </div>    \n");
      out.write("                        ");
 
                    }
                }
                
                
            }
        }catch(Exception e){
            out.println(e.getMessage());
        }
        
    }

      out.write("\n");
      out.write("                <form action=\"\" method=\"POST\">\n");
      out.write("                    <div class=\"topic\" style=\"margin-bottom: 5%;\">\n");
      out.write("                        <h5>Change Your Details</h5>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group row\">\n");
      out.write("                        <label for=\"fname\" class=\"col-sm-3 col-form-label\">First Name</label>\n");
      out.write("                        <div class=\"col-sm-9\">\n");
      out.write("                        <input name=\"fname\" class=\"form-control\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group row\">\n");
      out.write("                        <label for=\"lname\" class=\"col-sm-3 col-form-label\">Last name</label>\n");
      out.write("                        <div class=\"col-sm-9\">\n");
      out.write("                        <input name=\"lname\" class=\"form-control\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group row\">\n");
      out.write("                        <label for=\"email\" class=\"col-sm-3 col-form-label\">Email</label>\n");
      out.write("                        <div class=\"col-sm-9\">\n");
      out.write("                        <input name=\"email\" class=\"form-control\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group row\">\n");
      out.write("                        <label for=\"phone\" class=\"col-sm-3 col-form-label\">Phone No</label>\n");
      out.write("                        <div class=\"col-sm-9\">\n");
      out.write("                        <input name=\"phone\" class=\"form-control\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group row\">\n");
      out.write("                        <div class=\"col-sm-9\">\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-success btn-sm\" name=\"change\">Save Changes</button>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <br>\n");
      out.write("                    <hr>\n");
      out.write("                    <br>\n");
      out.write("\n");
      out.write("                    <div class=\"topic\" style=\"margin-bottom: 5%;\">\n");
      out.write("                        <h5>Change Password</h5>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group row\">\n");
      out.write("                        <label for=\"currrent_pass\" class=\"col-sm-3 col-form-label\">Current Password</label>\n");
      out.write("                        <div class=\"col-sm-9\">\n");
      out.write("                        <input type=\"password\" name=\"current_pass\" class=\"form-control\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group row\">\n");
      out.write("                        <label for=\"new_pass\" class=\"col-sm-3 col-form-label\" >New Password</label>\n");
      out.write("                        <div class=\"col-sm-9\">\n");
      out.write("                        <input type=\"password\" name=\"new_pass\" class=\"form-control\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group row\">\n");
      out.write("                        <label for=\"renew_pass\" class=\"col-sm-3 col-form-label\">Confirm Password</label>\n");
      out.write("                        <div class=\"col-sm-9\">\n");
      out.write("                        <input type=\"password\" name=\"renew_pass\" class=\"form-control\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group row\">\n");
      out.write("                        <div class=\"col-sm-9\">\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-success btn-sm\" name=\"change_pass\">Save Changes</button>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("    </body>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
