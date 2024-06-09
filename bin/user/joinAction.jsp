<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id ="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPW" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userEmail" />
    <%
    String userId = request.getParameter("userID");
    String userPW = request.getParameter("userPW");
    String userName = request.getParameter("userName");
    String userEmail = request.getParameter("userEmail");
        if (user.getUserID() == null || user.getUserPW() == null || user.getUserName() == null || user.getUserEmail() == null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력하지 않은 사항이 있습니다.');");
            script.println("history.back()");
            script.println("</script>");
        }else{
            UserDAO userDAO = new UserDAO();
            int result = userDAO.join(user);
            if (result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("이미 존재하는 아이디입니다.");
                script.println("history.back()");
                script.println("</script>");
            }
            else if (result == 1) { // 회원가입 성공을 나타내는 값
            out.print(result); // 클라이언트로 성공을 알리는 값을 반환
            System.out.println(result);
            response.sendRedirect("join.jsp");
            } else {
                out.print("회원가입 실패");
                System.out.println(result);
            }
        }
    %>
