<%-- 
    Yingchen Bai, Ray Zhang, Jisheng Jiang, Landon Shishido
    SJSU 2024
    CS157A Final Project
--%>

<%@ page import="java.sql.*"%>
    <% 
    session.removeAttribute("username");  
    response.sendRedirect("http://localhost:8080/FirstPage.html");
    %>
  
