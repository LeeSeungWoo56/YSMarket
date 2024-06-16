<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPW" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="photo" />
<!DOCTYPE html>
<html>
<head>
    <meta charset = "UTF-8">
    <link rel="stylesheet" href="/YSMarket/css/market.css">
    <link rel="stylesheet" href="/YSMarket/css/main.css">
    <title>상단</title>

    <!-- 아이콘 -->
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</head>
<body>
	<div id="headerContainer">
		<div id="fixedContainer">
			<div class="loginSerivce">
                <%
                //String UserID ="";//UserID라는 변수를 만들고 값을 넣음
                    try{
                        String UserID = (String) session.getAttribute("UserID");
                        if(UserID == null || UserID.equals("")){//UserID가 null이거나 아무것도 할당되지 않았다면*/
                %>
                    <a href="/YSMarket/user/login.jsp" id="login">로그인</a>
                    <a href="/YSMarket/user/join.jsp" id="membership">회원가입</a>
                    <a href="./customer/Customer.jsp?notice" id="customer">고객센터</a>

                    <%      }else{ //로그인 수행 후
                                user.setUserID(UserID);
                                UserDAO dao = new UserDAO();
                                List member = dao.selectUser(user);

                                user = (User) member.get(0); // 첫 번째 User 객체 가져오기
                            %>
                            <p><%= user.getUserName() %> 님 환영합니다.</p>
                            <a href="/YSMarket/user/logout.jsp" id="logout">로그아웃</a>
                            <a href="./customer/Customer.jsp?notice" id="customer">고객센터</a>
                    <%    
                        }
                    }catch(Exception e){
                        e.printStackTrace();
                    }
                %>
            
            </div>
            <div class="headerMain">
                <div class="logo">
                    <a href="/YSMarket/templete/MarketMain.jsp"> <img src="../image/logo.jpg">
                    </a>
                </div>
                <div class="searchBar">
                    <div class="searchDetail">
                        <form action="/YSMarket/search" method="post" id="searchForm" autocomplete="off" onsubmit="return submitSearch()">
                            <input required id="searchInput" maxlength="20" type="text" placeholder="상품을 입력해주세요.">
                            <button type="reset" id="resetBtn">
                            <ion-icon name="close"></ion-icon>
                            </button>
                        </form>
                        <button type="submit" form="searchForm" id="submitBtn">
                            <img src="../image/search.png " alt=""/>
                        </button>
                    </div>
                </div>
                <div class="memberIcon">
                    <a href="/YSMarket/chatting/chatmain.jsp"> <ion-icon name="storefront-outline" class="storeIcon"></ion-icon> <span>채팅하기</span>
                    </a>
                    <a href="writePost.jsp"> <ion-icon name="storefront-outline" class="storeIcon"></ion-icon> <span>판매하기</span>
                    </a>
                    <a href="mypage.jsp"> <ion-icon name="person-outline" class="myIcon"></ion-icon> 내정보</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
