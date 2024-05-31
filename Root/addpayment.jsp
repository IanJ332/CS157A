<%-- 
    Yingchen Bai, Ray Zhang, Jisheng Jiang, Landon Shishido
    SJSU 2024
    CS157A Final Project
--%>

<%@ page import="java.sql.*"%>
<%
    String cardNo = request.getParameter("cardNo");
    String cardName = request.getParameter("cardName");
    String expMo = request.getParameter("expMo");
    String expYr = request.getParameter("expYr");
    String code = request.getParameter("code");

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
        int rows1 = stmt.executeUpdate("insert into ticketmaster.card values('"+cardNo+"','"+session_username+"','"+cardName+"','"+expMo+"','"+expYr+"','"+code+"')");
        stmt.close();
        con.close();
        response.sendRedirect("http://localhost:8080/cardadded.html");
    }

    catch(SQLException e)
    {
        out.println("SQLException caught: " + e.getMessage());
    }
%>