<%-- 
    Document   : salesman
    Created on : Dec 3, 2018, 11:49:22 PM
    Author     : acer
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
        <title>Salesman</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css1/login.css">
        <link rel="stylesheet" href="css1/dashboard.css">
        <link rel="stylesheet" href="css1/image.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <a class="navbar-brand" href="#">A9 Supermarket</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-collapse">☰</button> 
            <div class="collapse navbar-collapse" id="navbar-collapse">
		<ul class="nav navbar-nav ml-auto">
                    <li class="nav-item">
                        <a href="availability.html"><i class="fa fas fa-cart-arrow-down"></i> products</a>
                    </li>
                    <li class="nav-item dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><% out.println(request.getParameter("f_name")); %></a>
                            <div class="dropdown-menu dropdown-menu-right">
                                <a class="dropdown-item" href="salesmanAccountSetting.jsp" style="color:black;">Account Settings</a>
                            <div class="dropdown-divider"></div>
				<a class="dropdown-item" href="logout.jsp" style="color:black;"><i class="fa fa-sign-out"></i> LogOut</a>
                            </div>
                    </li>
		</ul>
            </div>
	</nav>
<body>

        <pre>
***********************************************************************************************************************
                                                           RECEIPT
***********************************************************************************************************************
        </pre>
        <p id="demo"></p>
        <script>
            var d = new Date();
            document.getElementById("demo").innerHTML = d.toUTCString();
            
            function cal()
            {
            var a=document.getElementById("q1").value;
            var b=document.getElementById("up").value;
            var c = parseFloat(a) * parseFloat(b); 
            
            document.getElementById("p1").value=c;
            }
             function cal2()
            {
            var a=document.getElementById("q2").value;
            var b=document.getElementById("up2").value;
            var c = parseFloat(a) * parseFloat(b); 
            
            document.getElementById("p2").value=c;
            }
             function cal3()
            {
            var a=document.getElementById("q3").value;
            var b=document.getElementById("up3").value;
            var c = parseFloat(a) * parseFloat(b); 
           
            document.getElementById("p3").value=c;
            }
            
           function add()
            {
                  var item1 = document.getElementById("p1").value;
                  var item2 = document.getElementById("p2").value;
                  var item3 = document.getElementById("p3").value;
                  var sum1 = parseFloat(item1) + parseFloat(item2)+ parseFloat(item3) ;
                  var sum = sum1.toFixed(2);
                 
                  document.getElementById("total").value=sum;
                  document.getElementById("total2").value=sum;
           
            }
            
           function balance()
            {
                var item1 = document.getElementById("p1").value;
                var item2 = document.getElementById("p2").value;
                var item3 = document.getElementById("p3").value;
                var sum = parseFloat(item1) + parseFloat(item2)+ parseFloat(item3) ;
                var cash =  document.getElementById("cash").value;
                var change1 =  document.getElementById("change").value;
                var change1 =parseFloat(cash) - parseFloat(sum);
                var change = change1.toFixed(2);
                document.getElementById("change").value=change;
            
            }
           // public static List<Throwable> getExceptionList(Exception ex) {
    //List<Throwable> causeList = new ArrayList<Throwable>();
    //causeList.add(ex);
    //Throwable cause = null;
    //while ((cause = ex.getCause()) != null && !causeList.contains(cause)) {
    // causeList.add(cause);
    //}
    //return causeList;
    //}
    
        </script>     

        <div>
            <form  name = "form1" action ="receipt.php." method="POST">

                <table border="0">
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Quantity</th>
                            <th>Unit Price(Rs.)</th>
                            <th>Total Price(Rs.)</th>
                        </tr>
                    </thead>
                    <tbody>
               
                        <tr>
                            <td><input type="text" name="id" value="" /></td> 
                            
                            <td id ="n1"><input type="text" name="name" value="<%
                     String Id1 = request.getParameter("id");   
                     
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket", "root", "");
                        Statement stmt = con.createStatement();
                        String query = "SELECT product_Name FROM product WHERE product_Id='"+Id1+"' ";
                                             
                    ResultSet rs = stmt.executeQuery(query);
                  if(rs.next()){
                      String vegName = rs.getString("product_Name");
                      
                          out.println(vegName);
                  }
                     else {
                          out.println("Invalied Product_Id");
                        }
                    
                    stmt.close();
                    con.close();
                    
                }catch (Exception e) {
                out.println(e.getMessage());
                }%>" /></td>
                            <td><input id="q1" type="text" name="q1" value="" /></td>
                           
                            <td><input id="up" type="text" name="u1" value="<%
                           Id1 = request.getParameter("id");   
                     
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket", "root", "");
                        Statement stmt = con.createStatement();
                        String query = "SELECT unit_Price FROM product WHERE product_Id='"+Id1+"' ";
                                             
                    ResultSet rs = stmt.executeQuery(query);
                  if(rs.next()){
                      String unitPrice1 = rs.getString("unit_Price");
                      
                          out.println(unitPrice1);
                  }
                     else {
                          //out.println("Invalied Product_Id");
                        }
                    
                    stmt.close();
                    con.close();
                    
                }catch (Exception e) {
                out.println(e.getMessage());
                }%>" /></td>
                            <td><input id="p1" type="text" name="price1" value="" /></td>
                        </tr>
                        
                        
                        <tr>
                            <td><input type="text" name="id2" value="" /></td>
                            <td><input type="text" name="name" value="<%
                      String Id2 = request.getParameter("id2");   
                     
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket", "root", "");
                        Statement stmt = con.createStatement();
                        String query = "SELECT product_Name FROM product WHERE product_Id='"+Id2+"' ";
                                             
                    ResultSet rs = stmt.executeQuery(query);
                  if(rs.next()){
                      String vegName = rs.getString("product_Name");
                      
                          out.println(vegName);
                  }
                     else {
                          out.println("Invalied Product_Id");
                        }
                    
                    stmt.close();
                    con.close();
                    
                }catch (Exception e) {
                out.println(e.getMessage());
                }%>" /></td>
                            <td><input id="q2" type="text" name="q2" value="" /></td>
                            <td><input id="up2" type="text" name="u2" value="<%
                      Id2 = request.getParameter("id2");   
                     
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket", "root", "");
                        Statement stmt = con.createStatement();
                        String query = "SELECT unit_Price FROM product WHERE product_Id='"+Id2+"' ";
                                             
                    ResultSet rs = stmt.executeQuery(query);
                  if(rs.next()){
                      String price2 = rs.getString("unit_Price");
                      
                          out.println(price2);
                  }
                     else {
                          //out.println("Invalied Product_Id");
                        }
                    
                    stmt.close();
                    con.close();
                    
                }catch (Exception e) {
                out.println(e.getMessage());
                }%>" /></td>
                            <td><input id="p2" type="text" name="price2" value="" /></td>
                        </tr>
                        
                        
                        <tr>
                            <td><input type="text" name="id3" value="" /></td>
                            <td><input type="text" name="name" value="<%
                      String Id3 = request.getParameter("id3");   
                     
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket", "root", "");
                        Statement stmt = con.createStatement();
                        String query = "SELECT product_Name FROM product WHERE product_Id='"+Id3+"' ";
                                             
                    ResultSet rs = stmt.executeQuery(query);
                  if(rs.next()){
                      String vegName = rs.getString("product_Name");
                      
                          out.println(vegName);
                  }
                     else {
                          out.println("Invalied Product_Id");
                        }
                    
                    stmt.close();
                    con.close();
                    
                }catch (Exception e) {
                out.println(e.getMessage());
                }%>" /></td>
                            <td><input id="q3" type="text" name="q3" value="" /></td>
                            <td><input id="up3" type="text" name="u3" disable value="<%
                      Id3 = request.getParameter("id3");   
                     
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket", "root", "");
                        Statement stmt = con.createStatement();
                        String query = "SELECT unit_Price FROM product WHERE product_Id='"+Id3+"' ";
                                             
                    ResultSet rs = stmt.executeQuery(query);
                  if(rs.next()){
                      String price3 = rs.getString("unit_Price");
                      
                          out.println(price3);
                  }
                     else {
                          //out.println("Invalied Product_Id");
                        }
                    
                    stmt.close();
                    con.close();
                    
                }catch (Exception e) {
                out.println(e.getMessage());
                }%>" /></td>
                            <td><input id="p3" type="text" name="price3" value="" /></td>
                        </tr>
                        <tr><td><input type="submit" name="submit" value="Order" formaction ="selection.jsp"/></td></tr>
                        <tr>
                            <td><input type="button" value="TOTAL" onclick = 'cal(),cal2(),cal3(),add()'></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><input id ="total" type="text" name="total" value="" /></td>
                        </tr>
                     
                        <tr>
                            <td>CASH</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><input id ="cash" type="text" name="cash" value=""></td>
                        </tr>
                        <tr>
                           <td><input type="button" value="CHANGE" onclick = 'balance()'></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><input id ="change" type="text" name="change" value="" /></td>
                        </tr>
                        
                    </tbody>
                </table>
                       <input type="submit" value="Enter" onclick="<%
                      String product_Name = request.getParameter("name");
                      String quantity = request.getParameter("q1");
                      String unit_Price = request.getParameter("p1");
                      String total_Price = request.getParameter("total");   
                     String sum = request.getParameter("total"); 
                     String cash = request.getParameter("cash"); 
                     String balance = request.getParameter("change"); 
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/supermarket", "root", "");
                        Statement stmt = con.createStatement();
                        
                           String query = "INSERT INTO item (product_Name,quentity,unit_Price,total_Price,sum,cash,balance) VALUES ('"+product_Name+"','"+quantity+"', '"+unit_Price+"','"+total_Price+"','"+sum+"','"+cash+"','"+balance+"')";                  
                   int n = stmt.executeUpdate(query);
                        if (n!=0){
                            //out.println("Item entered successfully");
                        }else{
                            out.println("Error while entering items.");
                        }
                        
                    
                }catch (Exception e) {
                out.println(e.getMessage());
                }%> "class="btn btn-dark" style="margin-left: 1000px;"></button>
                 
            </form>
            <br>
            <pre>*******************************************************Thank You!********************************************************</pre>

        </div>
                
               
        
    </body>
</html>
