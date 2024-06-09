<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="user.mail.SendMail" %>
<%@ page import="java.io.PrintWriter" %>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id ="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP 게시판 웹 사이트</title>
</head>
<body>
    <%
    String id = user.getUserID();
    String name = user.getUserName();
    String email = user.getUserEmail();
        if (id == null || name == null || email == null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력하지 않은 사항이 있습니다. ')");
            script.println("history.back()");
            script.println("</script>");
        }else{
            UserDAO userDAO = new UserDAO();
            String pw = userDAO.findUserPW(id, name, email);
            if (pw == null){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('존재하지 않는 계정입니다.')");
                script.println("history.back()");
                script.println("</script>");
            }
            else{
                SendMail sendmail = new  SendMail();
                String result = sendmail.findPW_Email(email, pw.trim(), name);
                if(result.trim() == "success"){
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('비밀번호가 이메일로 전송되었습니다..')");
                    script.println("location.href = 'login.jsp'");
                    script.println("</script>");
                }
                else{
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('이메일 통신 오류')");
                    script.println("history.back()");
                    script.println("</script>");
                }
            }
        }
    %>
</body>
</html>