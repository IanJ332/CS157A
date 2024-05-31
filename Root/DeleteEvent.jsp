<%-- 
    Yingchen Bai, Ray Zhang, Jisheng Jiang, Landon Shishido
    SJSU 2024
    CS157A Final Project
--%>

<%@ page import="java.sql.*"%>
    <% 
    String eid = request.getParameter("eventID");
    String answer = request.getParameter("userType");

    String session_username = (String)session.getAttribute("username");

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
            
            if(answer.equals("yes"))
            {
                int rs = stmt.executeUpdate("DELETE FROM ticketmaster.createevent where EventID = "+eid+" AND EventPlannerUserID = '"+session_username+"'");
                response.sendRedirect("http://localhost:8080/PlannerHomePage.html");
            }
            else
            {
                response.sendRedirect("http://localhost:8080/PlannerHomePage.html");
            }
            stmt.close();
            con.close();

        } 
        
        catch(SQLException e) 
        { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  
