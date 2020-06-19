package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;

public final class admin_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("            <a class=\"navbar-brand\" href=\"superAdmin.jsp\">A9 Supermarket</a>\n");
      out.write("            <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbar-collapse\">☰</button> \n");
      out.write("            <div class=\"collapse navbar-collapse\" id=\"navbar-collapse\">\n");
      out.write("\t\t<ul class=\"nav navbar-nav ml-auto\">\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("                        <a href=\"availability.html\"><i class=\"fa fas fa-cart-arrow-down\"></i> products</a>\n");
      out.write("                    </li>\n");
      out.write("                    \n");
      out.write("\n");
      out.write("                    <li class=\"nav-item dropdown\">\n");
      out.write("\t\t\t<a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\" role=\"button\" aria-haspopup=\"true\" aria-expanded=\"false\">");
 out.println(request.getParameter("f_name")); 
      out.write("</a>\n");
      out.write("                            <div class=\"dropdown-menu dropdown-menu-right\">\n");
      out.write("                                <a class=\"dropdown-item\" href=\"adminAccountSetting.jsp\" style=\"color:black;\">Account Settings</a>\n");
      out.write("                            <div class=\"dropdown-divider\"></div>\n");
      out.write("\t\t\t\t<a class=\"dropdown-item\" href=\"logout.jsp\" style=\"color:black;\"><i class=\"fa fa-sign-out\"></i> LogOut</a>\n");
      out.write("                            </div>\n");
      out.write("                    </li>\n");
      out.write("\t\t</ul>\n");
      out.write("            </div>\n");
      out.write("\t</nav>\n");
      out.write("                                    <p><br/></p>\n");
      out.write("        <div class = \"row\"> \n");
      out.write("            <div class=\"col-sm-1\"></div>\n");
      out.write("                <div class=\"col-sm-10\">\n");
      out.write("                        <table class = \"table table bordered table-striped table-hover\">\n");
      out.write("                            <thead>\n");
      out.write("                                <tr>\n");
      out.write("                                    <th>User ID</th>\n");
      out.write("                                    <th>Category</th>\n");
      out.write("                                    <th>First Name</th>\n");
      out.write("                                    <th>Last Name</th>\n");
      out.write("                                    <th>Email</th>\n");
      out.write("                                    <th>Password</th>\n");
      out.write("                                    <th>Phone Number</th>\n");
      out.write("                                    <th>Age</th>\n");
      out.write("                                    <th>Address</th>\n");
      out.write("                                    <th>Gender</th>\n");
      out.write("\n");
      out.write("                                </tr>\n");
      out.write("                            </thead>\n");
      out.write("                            <tbody>\n");
      out.write("                                ");

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
                                        data = "SELECT * FROM user WHERE (f_Name like '%" + query + "%' or l_Name like '%" + query + "%' or email like '%" + query + "%' or phone_No like '%" + query + "%' or category like '%" + query + "%' or age like '%" + query + "%') and category='salesman'";
                                    } else {
                                        data = "SELECT * FROM user where category='salesman' ORDER BY user_Id DESC";
                                    }
                                    res = stat.executeQuery(data);
                                    while (res.next()) {

                                
      out.write("\n");
      out.write("                                <tr>\n");
      out.write("                                    <td>");
      out.print(res.getString("user_Id"));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(res.getString("category"));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(res.getString("f_Name"));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(res.getString("l_Name"));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(res.getString("email"));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(res.getString("password"));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(res.getString("phone_No"));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(res.getString("age"));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(res.getString("address"));
      out.write("</td>\n");
      out.write("                                    <td>");
      out.print(res.getString("gender"));
      out.write("</td>\n");
      out.write("                                    \n");
      out.write("                                </tr>\n");
      out.write("                                ");

                                    }
                                
      out.write("\n");
      out.write("                                \n");
      out.write("                            </tbody>  \n");
      out.write("                        </table>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"col-sm-1\"></div>\n");
      out.write("                        </div>\n");
      out.write("                        </body>\n");
      out.write("                        </html>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
