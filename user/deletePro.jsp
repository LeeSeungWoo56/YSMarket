<!-- deletePro.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<%
    String UserID = (String) session.getAttribute("UserID");
    String userPW = request.getParameter("userPW");

    UserDAO userDAO = new UserDAO();
    int result = userDAO.deleteUser(UserID, userPW);


    if (result == 1){ 
    %>
        <script>
            alert("회원탈퇴가 완료되었습니다.");
        </script>
    <%
        session.invalidate(); // 세션 무효화
		response.sendRedirect("/YSMarket/templete/MarketMain.jsp"); //sendRedirect를 통해서 MarketMain.jsp로 이동
    }
    else if (result == 0){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('비밀번호가 틀립니다.')");
        script.println("history.back()");
        script.println("</script>");
        System.out.println(userPW);
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
