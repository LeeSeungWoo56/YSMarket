<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  //String UserID ="";//UserID라는 변수를 만들고 값을 넣음
  try{
        String UserID = (String) session.getAttribute("UserID");
	    if(UserID==null || UserID.equals("")){//UserID가 null이거나 아무것도 할당되지 않았다면*/
        response.sendRedirect("/YSMarket/user/login.jsp"); //response.sendRedirect를 통해서 화면을 login.jsp로 이동
        }else{ //로그인 수행 후
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {
            letter-spacing: -.02em;
        }
        *, :after, :before {
            box-sizing: border-box;
        }
        div {
            display: block;
            unicode-bidi: isolate;
        }
        .css-lmnz5cs{
            padding-top: 64px;
            max-height: 100vh;
            overflow: auto;
        }
        .css-19lthbi {
            height: auto;
            position: fixed;
            top: 0px;
            left: 0px;
            right: 0px;
            z-index: 1000;
            background-image: initial;
            background-position: initial;
            background-size: initial;
            background-repeat: initial;
            background-attachment: initial;
            background-origin: initial;
            background-clip: initial;
            border-bottom: 1px solid #eaebee;
            display: flex;
            -webkit-box-pack: center;
            justify-content: center;
            background-color: #fff;
        }
        .css-lmnz5cs .body {
            display: flex;
            -webkit-box-pack: center;
            justify-content: center;
            flex-direction: column;
            height: calc(-64px + 100vh);
        }
        header {
            unicode-bidi: isolate;
        }
        main {
            unicode-bidi: isolate;
            background: #f2f3f6;
        }
        .css-143d18r {
            display: flex;
            overflow-x: auto;
            position: relative;
            margin: 0px auto;
            height: 100%;
        }
        .css-1plme8k {
            display: flex;
            background: white;
            border-right: 1px solid #d1d3d8;
        }
        .css-am8mw7 .empty-box {
            display: flex;
            -webkit-box-pack: center;
            justify-content: center;
            -webkit-box-align: center;
            align-items: center;
            min-width: 100%;
            max-width: 100%;
            flex-direction: column;
        }
        .css-am8mw7 {
            position: relative;
            display: flex;
            flex-direction: column;
            border-right: 1px solid #eaebee;
            min-width: 812px;
            max-width: 812px;
            background-color: #fff;
        }
        ::-webkit-scrollbar {
            opacity: 0;
            width: 7px;
            height: 7px;
            appearance: auto;
        }
    </style>
</head>
<body id="body" class="light-theme" style="overflow: auto;">
    <div id="root">
        <div class="css-lmnz5cs">
            <header class="css-19lthbi">
                <jsp:include page="chatheader.jsp"/>
            </header>
            <main class="body">
                <div class="css-143d18r">
                    <div class="css-1plme8k">
                        <jsp:include page="chatlist.jsp"/>
                        <nav class="sidebar"></nav>
                        <nav class="css-dcpzrh">
                            <div class="css-fycla4"></div>
                            <ul tabindex="0" role="list" aria-label="내 채널 리스트" class="css-8lfz6g"></ul>
                        </nav>
                    </div>
                    <section class="css-am8mw7">
                        <jsp:include page="chat.jsp"/>
                        <div class="empty-box"></div>
                    </section>
                </div>
            </main>
        </div>
    </div>    
</body>
</html>
<%    
}
    }catch(Exception e){
		e.printStackTrace();
	}
%>