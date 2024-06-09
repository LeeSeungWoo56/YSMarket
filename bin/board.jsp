<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>간단한 게시판</title>
</head>
<body>
    <h1>간단한 게시판</h1>
    
    <!-- 글쓰기 폼 -->
    <form action="writePost.jsp" method="post">
        <label for="author">작성자:</label>
        <input type="text" id="author" name="author" required><br>
        <label for="content">내용:</label><br>
        <textarea id="content" name="content" rows="4" cols="50" required></textarea><br>
        <button type="submit">글쓰기</button>
    </form>
    
    <hr>
    
    <!-- 게시물 목록 -->
    <h2>게시물 목록</h2>
    <ul>
        <% 
            // 게시물 목록 출력
            ArrayList<Post> posts = (ArrayList<Post>) request.getAttribute("posts");
            if (posts != null && !posts.isEmpty()) {
                for (Post post : posts) {
        %>
                    <li>
                        <strong><%= post.getAuthor() %>:</strong> <%= post.getContent() %>
                        <ul>
                            <% 
                                // 댓글 목록 출력
                                ArrayList<Comment> comments = post.getComments();
                                if (comments != null && !comments.isEmpty()) {
                                    for (Comment comment : comments) {
                            %>
                                        <li><strong><%= comment.getAuthor() %>:</strong> <%= comment.getContent() %></li>
                            <% 
                                    }
                                }
                            %>
                        </ul>
                        <form action="writeComment.jsp" method="post">
                            <input type="hidden" name="postId" value="<%= post.getId() %>">
                            <label for="commentAuthor">댓글 작성자:</label>
                            <input type="text" id="commentAuthor" name="commentAuthor" required>
                            <label for="commentContent">댓글 내용:</label>
                            <input type="text" id="commentContent" name="commentContent" required>
                            <button type="submit">댓글 작성</button>
                        </form>
                    </li>
        <% 
                }
            } else {
        %>
                <li>게시물이 없습니다.</li>
        <% 
            }
        %>
    </ul>
</body>
</html>