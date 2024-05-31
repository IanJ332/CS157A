<%-- 
    Yingchen Bai, Ray Zhang, Jisheng Jiang, Landon Shishido
    SJSU 2024
    CS157A Final Project
--%>

<%@ page import="java.sql.*"%>
    <% 
    String tid = request.getParameter("tranID");
    String eid = request.getParameter("eventID");
    String tickets = request.getParameter("tickets");
    String card = request.getParameter("pay");

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
            Statement stmt2 = con.createStatement();
            Statement stmt3 = con.createStatement();
            ResultSet rs = stmt2.executeQuery("SELECT tickets.remainingTickets, tickets.price FROM ticketmaster.tickets where ticketmaster.tickets.eventID = "+eid);
            if(rs.next()) 
            {
                String remaining = rs.getString(1);
                int rem = Integer.parseInt(remaining);
                if(Integer.parseInt(tickets)>rem)
                {
                    out.println("Insufficient Tickets. Please select less number of tickets.");
                }
                else
                {
                    rem = rem - Integer.parseInt(tickets);
                }
                int r = stmt3.executeUpdate("Update ticketmaster.tickets set remainingTickets = "+rem+" Where eventID = "+eid);
            }

            String ppt = rs.getString(2);
            int priceperticket = Integer.parseInt(ppt);
            int intTickets = Integer.parseInt(tickets);
            int amt = intTickets * priceperticket;

            Statement stmt = con.createStatement();
            int rows1 = stmt.executeUpdate("insert into ticketmaster.hastickets values('"+session_username+"',"+eid+","+tickets+")");
            int rows2 = stmt.executeUpdate("delete from ticketmaster.cart where cartID = '"+session_username+"' AND eventID = "+eid);
            int rows3 = stmt.executeUpdate("insert into ticketmaster.transaction values("+tid+", "+eid+", '"+session_username+"', "+tickets+", "+amt+")");

            stmt.close();
            con.close();

            response.sendRedirect("http://localhost:8080/BuyerHomePage.html");
        } 
        
        catch(SQLException e) 
        { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
  
