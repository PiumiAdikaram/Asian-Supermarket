package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class calculation_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Summary Page</title>\n");
      out.write("         <link rel=\"stylesheet\" href=\"css3/bootstrap.min.css\">\n");
      out.write("         <link rel=\"stylesheet\" href=\"css3/login.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("         \n");
      out.write("\n");
      out.write("     <div>\n");
      out.write("         <h1 class=\"danger\" align=\"center\" > SALARY STATEMENT</h1>\n");
      out.write("                \n");
      out.write("     </div>\n");
      out.write("        <div class=\"col-sm-12\">\n");
      out.write("     <div class=\"row\">\n");
      out.write("         <div class=\"col-sm-6\">  \n");
      out.write("             <img src=\"give.jpg\" align=\"left\" style=\"width:100%; height:750px;\">\n");
      out.write("         </div>\n");
      out.write("         \n");
      out.write("         <div class=\"col-sm-6\" style=\"border:5px;\"> \n");
      out.write("             \n");
      out.write("           ");

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
                
               
      out.write("\n");
      out.write("            \n");
      out.write("   \n");
      out.write("                    ");
          
                                        
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
          
                
      out.write("\n");
      out.write("\n");
      out.write("                <h3>Salary Calculation</h3>\n");
      out.write("         <table border=5 height=500 width=600 align=center>\n");
      out.write("                <tr  align=center>\n");
      out.write("\t\t\t\t\t<th> Gross Salary</th>\n");
      out.write("\t\t\t\t\t<th>Amount</th>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\n");
      out.write("                <tr align=center>\n");
      out.write("\t\t\t\t\t<td>Basic Salary(Rs)</td>\n");
      out.write("\t\t\t\t\t<td>");
      out.print( basic_Salary );
      out.write("</td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\n");
      out.write("                <tr align=center>\n");
      out.write("\t\t\t\t\t<td>Allowances(Rs)</td>\n");
      out.write("\t\t\t\t\t<td>");
      out.print( allowances );
      out.write("</td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\n");
      out.write("                <tr align=center>\n");
      out.write("\t\t\t\t\t<td>OT Amount</td>\n");
      out.write("\t\t\t\t\t<td>");
      out.print( ot_Amount );
      out.write("</td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("                <tr  align=center>\n");
      out.write("\t\t\t\t\t<th> Gross Salary  </th>\n");
      out.write("\t\t\t\t\t<td>");
      out.print( gross_Salary );
      out.write("</td>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\n");
      out.write("                <tr  align=center>\n");
      out.write("\t\t\t\t\t<th> Deductions</th>\n");
      out.write("\t\t\t\t\t<th>Amount</th>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("                <tr align=center>\n");
      out.write("\t\t\t\t\t<td>EPF(10%)(Rs)</td>\n");
      out.write("\t\t\t\t\t<td>");
      out.print( epf );
      out.write("</td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\n");
      out.write("                <tr align=center>\n");
      out.write("\t\t\t\t\t<td>Loan(Rs)</td>\n");
      out.write("\t\t\t\t\t<td>");
      out.print( loan );
      out.write("</td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("                <tr  align=center>\n");
      out.write("\t\t\t\t\t<th> Total Deduction(Rs)</th>\n");
      out.write("\t\t\t\t\t<td colspan=2>");
      out.print( deduction );
      out.write("</td>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <tr  align=center>\n");
      out.write("\t\t\t\t\t<th> Net Salary</th>\n");
      out.write("\t\t\t\t\t<td colspan=2>");
      out.print( net_Salary );
      out.write("</td>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("            </table>\n");
      out.write("           \n");
      out.write("            \n");
      out.write("     </div>\n");
      out.write("   \n");
      out.write("                                        \n");
      out.write("     </div>\n");
      out.write("        </div>\n");
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
