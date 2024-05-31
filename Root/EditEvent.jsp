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
            Statement stmt2 = con.createStatement();
            Statement stmt3 = con.createStatement();
            Statement stmt4 = con.createStatement();
            Statement stmt5 = con.createStatement();


                ResultSet rs = stmt.executeQuery("SELECT event.eventID, eventName, description, date_and_time, location FROM ticketmaster.event, ticketmaster.createevent where event.eventID = "+eid+" AND EventPlannerUserID = '"+session_username+"' AND event.eventID = createevent.EventID");
                if (rs.next()) 
                {
                    if((rs.getString(2).equals(ename) == false) && (ename != ""))
                    {
                        int r = stmt2.executeUpdate("Update ticketmaster.event set eventName = '"+ename+"' Where eventID = "+eid);
                    }

                    if((rs.getString(3).equals(desc) == false) && (desc != ""))
                    {
                        int r = stmt4.executeUpdate("Update ticketmaster.event set description = '"+desc+"' Where eventID = "+eid);
                    }

                    if((rs.getString(4).equals(date+" "+time) == false) && (date != "" || time != ""))
                    {
                        int r = stmt5.executeUpdate("Update ticketmaster.event set date_and_time = '"+date+" "+time+"' Where eventID = "+eid);
                    }

                    if((rs.getString(5).equals(location) == false) && (location != ""))
                    {
                        int r = stmt4.executeUpdate("Update ticketmaster.event set location = '"+location+"' Where eventID = "+eid);
                    }

                    response.sendRedirect("http://localhost:8080/PlannerHomePage.html");
                }
                else
                {
                    response.sendRedirect("http://localhost:8080/WrongEventID.html");
                }


            stmt.close();
            con.close();
        } 
        
        catch(SQLException e) 
        { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>