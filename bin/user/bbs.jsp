<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<%
  //String UserID ="";//UserID라는 변수를 만들고 값을 넣음
  try{
        String UserID = (String) session.getAttribute("UserID");
	    if(UserID==null || UserID.equals("")){//UserID가 null이거나 아무것도 할당되지 않았다면*/
        response.sendRedirect("login.jsp"); //response.sendRedirect를 통해서 화면을 login.jsp로 이동
        }else{ //로그인 수행 후
        int pageNumber = 1;
        if (request.getParameter("pageNumber") != null) {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        }
%>          
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.css">
    <style>
    .navbar-right {
        margin-right: 5px;
        margin-top:10px;
        margin-bottom: 10px;
    }
    a, a:hover {
        color: #000000;
        text-decoration: none;
    }
</style>
    <title>메인페이지</title>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="main.jsp">JSP 게시판 웹 사이트</a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="main.jsp">메인</a></li>
            <li class="active"><a href="bbs.jsp">게시판</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <div class="d-grid gap-2 d-md-block">
            <strong><%=UserID%></strong>님이 로그인 하셨습니다. 
        <button class="btn btn-danger" type="button" onclick="window.location.href='logout.jsp'">로그아웃</button>
                <button class="btn btn-primary" type="button" onclick="window.location.href='delete.jsp'">탈퇴하기</button>
            </div>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="row">
        <a href="write.jsp" class="btn btn-primary pull-right" style="margin-bottom:10px;">글쓰기</a>
        <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
            <thead>
                <tr>
                    <th style="background-color: #eeeeee; text-align: center;">번호</th>
                    <th style="background-color: #eeeeee; text-align: center;">제목</th>
                    <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                    <th style="background-color: #eeeeee; text-align: center;">작성일</th>
                </tr>
            </thead>
            <tbody>
                <%
                    BbsDAO bbsDAO = new BbsDAO();
                    ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
                    for(int i = 0; i < list.size(); i++){
                %>
                <tr>
                    <td><%= list.get(i).getBbsID() %></td>
                    <td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%=list.get(i).getBbsTitle() %></td>
                    <td><%= list.get(i).getUserID() %></td>
                    <td><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <%
            if(pageNumber != 1) {
        %>
            <a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arrow-left">이전</a>
        <%
            } if(bbsDAO.nextPage(pageNumber + 1)){
        %>
            <a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success pull-right">다음</a>
        <%
            }
        %>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>
<%
}
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
