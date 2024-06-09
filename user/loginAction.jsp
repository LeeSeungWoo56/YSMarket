<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% 
request.setCharacterEncoding("UTF-8"); 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setHeader("Expires", "0");
%>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPW" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>JSP 게시판 웹 사이트</title>
</head>
<body>

    <% UserDAO userDAO = new UserDAO(); //UserDAO 클래스의 객체(userDAO)를 생성한다.
    String UserID = user.getUserID();
    String UserPW = user.getUserPW();
    int result = userDAO.login(user.getUserID(), user.getUserPW());

    if (result == 1){
        session.setAttribute("UserID",UserID); //session변수에 UserID를 저장한다. 세션변수이름 : "UserID" , 변수에 저장되는 값 : UserID
		response.sendRedirect("/YSMarket/templete/MarketMain.jsp"); //sendRedirect를 통해서 main.jsp로 이동
    }
    else if (result == 0){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비밀번호가 틀립니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
    else if (result == -1){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('존재하지 않는 아이디입니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
    else if (result == -2){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('데이터베이스 오류가 발생했습니다.')");
        script.println("history.back()");
        script.println("</script>");
    }
    %>
</body>
</html>