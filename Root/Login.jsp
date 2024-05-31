<%-- 
    Yingchen Bai, Ray Zhang, Jisheng Jiang, Landon Shishido
    SJSU 2024
    CS157A Final Project
--%>

<%@ page import="java.sql.*"%>
    <% 
    String uid = request.getParameter("userID");
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
                ResultSet rs = stmt.executeQuery("SELECT * FROM ticketmaster.buyer where userID = '"+uid+"'");
                if (rs.next()) 
                {
                    if(rs.getString(4).equals(pass))
                    {
                        session.setAttribute("username", uid);  
                        response.sendRedirect("http://localhost:8080/BuyerHomePage.html");
                    }
                    else
                    {
                        out.println("Incorrect password");
                    }
                }
                else
                {
                    out.println("Incorrect userID");
                }
            }
            else if(utype.equals("seller"))
            {
                ResultSet rs = stmt.executeQuery("SELECT * FROM ticketmaster.eventplanner where userID = '"+uid+"'");
                if (rs.next()) 
                {
                    if(rs.getString(4).equals(pass))
                    {
                        session.setAttribute("username", uid);
                        response.sendRedirect("http://localhost:8080/PlannerHomePage.html");
                    }
                    else
                    {
                        out.println("Incorrect password");
                    }
                }
                else
                {
                    out.println("Incorrect userID");
                }
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
  
