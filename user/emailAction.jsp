<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="user.mail.SendMail" %>
<%@ page import="user.mail.RandomCode" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id ="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userEmail" />
<%
try{
    String email = request.getParameter("userEmail"); // 사용자 email을 요청 파라미터에서 가져옵니다.
    String code;
    String result="";
    SendMail sendmail = new SendMail();
    RandomCode randomcode = new RandomCode();
    if (email == null){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이메일을 입력해주세요')");
        script.println("history.back()");
        script.println("</script>");
    }else{
        code = randomcode.generateAuthCode();
        result = sendmail.mail(email,code);
    }
    
response.setContentType("text/html");// 응답의 컨텐츠 타입을 text으로 설정합니다.
response.setCharacterEncoding("UTF-8");// 응답의 문자 인코딩을 UTF-8로 설정합니다.
response.getWriter().write(result);// Text 형식의 응답을 작성하여 반환합니다.
}catch(Exception e){
    e.printStackTrace();
}  
%>