<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    // 로그인되어 있는지 확인합니다.
    if (session.getAttribute("UserID") == null) {
        // 로그인되어 있지 않은 경우, loginAfter.jsp로 이동합니다.
        response.sendRedirect("/YSMarket/user/loginAfter.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset = "UTF-8">
	<title>마이 페이지</title>
    <link rel="stylesheet" href="/YSMarket/css/main.css">
    <link rel="stylesheet" href="/YSMarket/css/market.css">
</head>
<body>
    <ul>
        <li><a href = "change.jsp">내 정보 변경</a></li>
        <!-- 이승우 -->
        <li><a href = "star.jsp">별점</a></li>
        <!-- 안재혁 -->
        <li><a href = "chat.jsp">채팅내역</a></li>
        <!-- 이승우 -->
        <li><a href = "buylist.jsp">구매내역</a></li>
        <li><a href = "selllist.jsp">판매내역</a></li>
        <li><a href = "delete.jsp">탈퇴하기</a></li>
        <!-- 이승우 -->
        <li><a href = "rule.jsp">이용규칙</a></li>
        <li><a href = "report.jsp">신고하기 (비매너유저신고)</a></li>
        <li><a href = "https://ecrm.police.go.kr/minwon/main">신고하기 (사기꾼신고)<img src="../image/police.jpg"></a></li>
        <li><a href = "https://thecheat.co.kr/rb/?mod=_search">더치트 (사기 대비)</a></li>
    </ul>
</body>
</html>