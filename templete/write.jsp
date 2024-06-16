<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String category_id = request.getParameter("category_id");
    String author = request.getParameter("author");
    String content = request.getParameter("content");
    
    // 데이터베이스 연결을 위한 정보
    String url = "jdbc:mysql://localhost:3306/yeonsung_id";
    String username = "ysmarket3a";
    String password = "ys080808!";
    
    // 데이터베이스 연결
    Connection conn = DriverManager.getConnection(url, username, password);
    
    // SQL 쿼리 작성
    String sql = "INSERT INTO posts (category_id, author, content) VALUES (?, ?, ?)";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, category_id);
    pstmt.setString(2, author);
    pstmt.setString(3, content);
    
    // 쿼리 실행
    pstmt.executeUpdate();
    
    // 자원 해제
    pstmt.close();
    conn.close();
    
    // 게시판 페이지로 리다이렉트
    response.sendRedirect("board.jsp");
%>
