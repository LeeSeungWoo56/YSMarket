<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%
    // 글쓰기 폼에서 전송된 데이터 받기
    String author = request.getParameter("author");
    String content = request.getParameter("content");

    // 데이터베이스에 새로운 댓글 추가
    Comment newComment = new Comment(author, content, new Date()); // 새로운 댓글 객체 생성
    CommentDAO.addComment(newComment); // 데이터베이스에 댓글 추가

    // 게시판 페이지로 리다이렉트
    response.sendRedirect("board.jsp");
%>