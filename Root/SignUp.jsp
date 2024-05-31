<%-- 
    Yingchen Bai, Ray Zhang, Jisheng Jiang, Landon Shishido
    SJSU 2024
    CS157A Final Project
--%>

<%@ page import="java.sql.*"%>
    <% 
    String uid = request.getParameter("userID");
    String fname = request.getParameter("name");
    String em = request.getParameter("email");
    String pass = request.getParameter("pw");
    String utype = request.getParameter("userType");

     String db = "ticketmaster";
        String user; // assumes database name is the same as username
        user = "root";
        String password = "baiyingchen";
        try 
        {
            java.sql.Connection con; 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ticketmaster?autoReconnect=true&useSSL=false",user, password);
            Statement stmt = con.createStatement();
            
            if(utype.equals("buyer"))
            {
                int rows = stmt.executeUpdate("insert into ticketmaster.buyer values('"+uid+"','"+fname+"','"+em+"','"+pass+"')");
                session.setAttribute("username", uid);
                response.sendRedirect("http://localhost:8080/BuyerHomePage.html");
            }
            else if(utype.equals("seller"))
            {
                int rows = stmt.executeUpdate("insert into ticketmaster.eventplanner values('"+uid+"','"+fname+"','"+em+"','"+pass+"')");
                session.setAttribute("username", uid);
                response.sendRedirect("http://localhost:8080/PlannerHomePage.html");
            }
            else
            {
            }

            stmt.close();
            con.close();
        } 
        
        catch(SQLException e) 
        { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  
