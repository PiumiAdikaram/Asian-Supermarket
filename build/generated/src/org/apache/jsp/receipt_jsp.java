package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.Statement;

public final class receipt_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Selection JSP Page</title>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("         <pre>\n");
      out.write("**********************************************************************************\n");
      out.write("                                  Super market     RECEIPT\n");
      out.write("**********************************************************************************\n");
      out.write("        </pre>\n");
      out.write("        \n");
      out.write("\n");
      out.write("        <div>\n");
      out.write("           \n");
      out.write("                <table border=\"0\">\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            \n");
      out.write("                            <th>Product Name</th>\n");
      out.write("                            <th>Quantity</th>\n");
      out.write("                            <th>Unit Price(Rs.)</th>\n");
      out.write("                            <!--<th>Total Price(Rs.)</th>\n");
      out.write("                            <th>Sum(Rs.)</th>\n");
      out.write("                            <th>Cash Price(Rs.)</th>\n");
      out.write("                            <th>Balance(Rs.)</th>-->\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    ");

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket", "root", "");
                        Statement stmt = con.createStatement();
                        String query = "SELECT * FROM item ";
                                             
                    ResultSet rs = stmt.executeQuery(query);
                         while(rs.next()){
                         
      out.write("\n");
      out.write("                    <tbody>\n");
      out.write("               \n");
      out.write("                        <tr>\n");
      out.write("                        \n");
      out.write("                    <td>");
      out.print(rs.getString("product_Name") );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(rs.getString("quentity") );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(rs.getString("unit_Price") );
      out.write("</td>\n");
      out.write("                   <!-- <td>");
      out.print(rs.getString("total_Price") );
      out.write("</td> \n");
      out.write("                    <td>");
      out.print(rs.getString("sum") );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(rs.getString("cash") );
      out.write("</td>\n");
      out.write("                    <td>");
      out.print(rs.getString("balance") );
      out.write("</td> -->\n");
      out.write("                    </tr>\n");
      out.write("                           \n");
      out.write("                    </tbody>\n");
      out.write("                    ");

                        }
                    }
                     catch (Exception e) {
                        out.println(e.getMessage());
                    }
      out.write("\n");
      out.write("                </table>\n");
      out.write("                 \n");
      out.write("            </form>\n");
      out.write("            <br>\n");
      out.write("            <pre>**********************************Thank You!**************************************</pre>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("                      \n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
      out.write("\n");
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
