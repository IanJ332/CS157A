<%-- 
    Yingchen Bai, Ray Zhang, Jisheng Jiang, Landon Shishido
    SJSU 2024
    CS157A Final Project
--%>

<%@ page import="java.sql.*"%>
    <% 
    String eid = request.getParameter("eventID");
    String ename = request.getParameter("eventName");
    String desc = request.getParameter("description");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String location = request.getParameter("eventLoc");
    String tickets = request.getParameter("tickets");
    String price = request.getParameter("price");

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
            int rows1 = stmt.executeUpdate("insert into ticketmaster.event values('"+eid+"','"+ename+"','"+desc+"','"+date+" "+time+"','"+location+"')");
            int rows2 = stmt.executeUpdate("insert into ticketmaster.createevent values('"+session_username+"',"+eid+")");
            int rows3 = stmt.executeUpdate("insert into ticketmaster.tickets values("+eid+", "+tickets+", "+tickets+", "+price+")");

            stmt.close();
            con.close();

            response.sendRedirect("http://localhost:8080/PlannerHomePage.html");
        } 
        
        catch(SQLException e) 
        { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  
