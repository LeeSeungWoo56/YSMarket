<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <a href="/YSMarket/user/logout.jsp" id="logout">로그아웃</a>
                <a href="./customer/Customer.jsp?notice" id="customer">고객센터</a>
            </div>
            <div class="headerMain">
                <div class="logo">
                    <a href="/YSMarket/templete/MarketMain.jsp"> <img src="../image/logo.jpg">
                    </a>
                </div>
                <!--
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
                -->
                <div class="memberIcon">
                    <a href="writePost.jsp"> <ion-icon name="storefront-outline" class="storeIcon"></ion-icon> <span>판매하기</span>
                    </a>
                    <a href="...."> <ion-icon name="person-outline" class="myIcon"></ion-icon> 내정보</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
