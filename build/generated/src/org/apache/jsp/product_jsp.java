package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class product_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Add Products</title>\n");
      out.write("          <link rel=\"stylesheet\" href=\"css/product.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("         \n");
      out.write("         <div id=\"header\">\n");
      out.write("            </div> \n");
      out.write("        \n");
      out.write("                <div id=\"logo\">\n");
      out.write("                    <a href=\"index.html\"><span>Super Market</span></a>\n");
      out.write("                </div>\n");
      out.write("                <ul id=\"navigation\">\n");
      out.write("                   \n");
      out.write("                    <li class=\"selected\">\n");
      out.write("                        <a href=\"AddProduct.html\">Add Product</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"DeleteProduct.html\">Delete Product</a>\n");
      out.write("                    </li>\t\t\t\t\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"UpdateProduct.html\">Update Product</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <a href=\"availability.html\">Available Product</a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("          \n");
      out.write("        <div id=\"result\">\n");
      out.write("        \n");
      out.write("        \n");
      out.write("          ");

                    String product_Id = request.getParameter("product_Id");
                    String product_Name = request.getParameter("product_Name");
                    String category = request.getParameter("category");
                    String unit_Price = request.getParameter("unit_Price");
                    String exp_Date = request.getParameter("exp_Date");
                    String quentity = request.getParameter("quentity");
                    String available= request.getParameter("available");
                    
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket", "root", "");
                        Statement stmt = con.createStatement();
                        String query = "INSERT INTO product (product_Id, product_Name ,category ,unit_Price,exp_Date, quentity,available) Values  ('"+product_Id+"', '"+product_Name+"' , '"+category+"' ,'"+unit_Price+"', '"+exp_Date+"',  '"+quentity+"' ,  '"+available+"') ";
                    //Execute Query
                  int n = stmt.executeUpdate(query);
                  if (n!=0){
                          out.println("<h1>Record Add Successful</h1>");
                  }
                     else {
                          out.println("<h1>Error while Adding</h1>");
                        }
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }
                
      out.write("\n");
      out.write("                \n");
      out.write("        </div>  \n");
      out.write("           <div id=\"footer\">\n");
      out.write("            <div>\n");
      out.write("                <p>\n");
      out.write("                    © Copyright - 2018. All rights reserved.\n");
      out.write("                </p>\n");
      out.write("            </div>\n");
      out.write("        </div>     \n");
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
