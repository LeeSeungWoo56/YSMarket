<%@ page import="user.UserDAO" %>  <%-- UserDAO 클래스를 임포트합니다. --%>
<%
try{
    // 사용자 ID를 요청 파라미터에서 가져옵니다.
    String userId = request.getParameter("userID");
    
    // UserDAO 객체를 생성합니다.
    UserDAO dao = new UserDAO();
    
    // idCheck 메소드를 호출하여 사용 가능 여부를 확인합니다.
    String isAvailable = dao.idCheck(userId);

    // 응답의 컨텐츠 타입을 text으로 설정합니다.
    response.setContentType("text/html");
    
    // 응답의 문자 인코딩을 UTF-8로 설정합니다.
    response.setCharacterEncoding("UTF-8");
    
    // Text 형식의 응답을 작성하여 반환합니다.
    response.getWriter().write(isAvailable);
}catch(Exception e){
    e.printStackTrace();
}  
%>
