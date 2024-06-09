<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    int board_num = Integer.parseInt(request.getParameter("board_num"));
    String comment_writer = request.getParameter("comment_writer");
    String comment_content = request.getParameter("comment_content");
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/ysmarket3a";
        String username = "ysmarket3a";
        String password = "ys080808!";
        Connection conn = DriverManager.getConnection(url, username, password);
        
        String sql = "INSERT INTO comment (board_num, writer, content) VALUES (?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, board_num);
        pstmt.setString(2, comment_writer);
        pstmt.setString(3, comment_content);
        pstmt.executeUpdate();
        
        pstmt.close();
        conn.close();
        
        response.sendRedirect("view_post.jsp?num=" + board_num);
    } catch (Exception e) {
        out.println("Exception: " + e.getMessage());
    }
%>
