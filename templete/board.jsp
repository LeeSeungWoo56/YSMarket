<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
</head>
<body>
    <h1>게시판</h1>
    
    <form action="write.jsp" method="post">
        작성자: <input type="text" name="author"><br>
        카테고리:
        <select name="category">
            <%
                // 데이터베이스 연결
                String url = "jdbc:mysql://localhost:3306/yeonsung_id";
                String username = "ysmarket3a";
                String password = "ys080808!";
                Connection conn = DriverManager.getConnection(category, categoryId, categoryName);
                
                // 카테고리 목록 조회
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM categories");
                while (rs.next()) {
                    String categoryId = rs.getString("id");
                    String categoryName = rs.getString("name");
            %>
            <option value="<%= categoryId %>"><%= categoryName %></option>
            <% } %>
        </select><br>
        내용: <textarea name="content" rows="4" cols="50"></textarea><br>
        <input type="submit" value="작성">
    </form>
    
    <hr>
    
    <h2>게시글 목록</h2>
    <%
        // 게시글 목록 조회
        rs = stmt.executeQuery("SELECT posts.*, categories.name AS category_name FROM posts JOIN categories ON posts.category_id = categories.id ORDER BY created_at DESC");
        while (rs.next()) {
            String postId = rs.getString("id");
            String author = rs.getString("author");
            String category = rs.getString("category_name");
            String content = rs.getString("content");
            Timestamp createdAt = rs.getTimestamp("created_at");
    %>
    <div>
        <b><%= author %> (카테고리: <%= category %>)</b><br>
        <%= content %><br>
        작성일: <%= createdAt %><br>
        <!-- 댓글 폼 -->
        <form action="comment.jsp" method="post">
            <input type="hidden" name="post_id" value="<%= postId %>">
            작성자: <input type="text" name="comment_author"><br>
            내용: <textarea name="comment_content" rows="2" cols="30"></textarea><br>
            <input type="submit" value="댓글 작성">
        </form>
        <hr>
    </div>
    <% } %>
    
    <% 
        // 연결 및 자원 닫기
        <!-- rs.close();
        stmt.close();
        conn.close(); -->
    %>
</body>
</html>
