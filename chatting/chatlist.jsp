<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPW" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="photo" />
<%
    String userID = null;
    if (session.getAttribute("UserID") != null) {
        userID = (String) session.getAttribute("UserID");
    }
    String receiver_id = null;
    if (request.getParameter("receiver_id") != null) {
        receiver_id = (String) request.getParameter("receiver_id");
    }
%>
<% 
            user.setUserID(userID);
            UserDAO dao = new UserDAO();
            List member = dao.selectUser(user);

            user = (User) member.get(0); // 첫 번째 User 객체 가져오기
        %>
<!DOCTYPE html>
<html lang="ko">
    <head>    
        <title></title>    
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />    
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">    
        <link rel="stylesheet" href="css/common.css">
        <script src="./jquery-3.7.1.min.js"></script>
        <!-- 부트스트랩 JS 추가 -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            function chatBoxFunction() {
                var userID = '<%= userID %>'
                $.ajax({
                    type: "POST",
                    url: "/YSMarket/ChatBoxServlet",
                    data: {
                        userID: encodeURIComponent(userID),
                    },
                    success: function(data) {
                        if(data == "") return;
                        $('#boxTable').html('');
                        var parsed = JSON.parse(data);
                        var result = parsed.result;
                        for(var i = 0; i < result.length; i++) {
                            if(result[i][0].value == userID) {
                                result[i][0].value = result[i][1].value;
                            } else {
                                result[i][1].value = result[i][0].value;
                            }
                            addBox(result[i][0].value, result[i][1].value, result[i][2].value, result[i][3].value)
                        }
                    }
                });
            }
            function addBox( lastID ,receiver_id, content, chatTime){
                if (content.length >= 20) {
                    content = content.substring(0, 30) + "...";
                } 
                $('#boxTable').append('<button class="list-btn" onClick="location.href=\'chatmain.jsp?receiver_id=' + encodeURIComponent(receiver_id) + '\'">' +
                '<li>' + 
                '<table cellpadding="0" cellspacing="0">' + 
                '<tr>' + 
                '<td class="profile_td">' + 
                '<img style="border-radius:50%;" src="../image/profile.png" />' + 
                '</td>' + 
                '<td class="chat_td">' +
                '<div class="email">' + receiver_id + '</div>' +
                '<div class="chat_preview">' + content  + '</div>' +
                '</td>' + 
                '<td class="time_td">' +
                '<div class="time">' + chatTime + '</div>' +
                '<div class="check">' +
                '</div>' +
                '</td>' +
                '</tr>' +
                '</table>' +
                '</li>' +
                '</button>');                                                                     
            }
            function getInfiniteBox() {
                setInterval(function() {
                    chatBoxFunction();
                }, 3000);
            }
        </script>
        </head>
        <% 
            if(userID != null) {
            
        %>
            <script type="text/javascript">
                $(document).ready(function() {
                    chatBoxFunction();
                    getInfiniteBox();
                });
            </script>
        <%
            }
        %>    
        <body>
            <div class="chat_list_wrap">    
            <div class="header">        
                채팅목록  
            </div>    
            <div class="search">        
                <input type="text" placeholder="검색" />    
            </div>    
            <div class="list">        
                <ul id="boxTable"></ul>    
            </div>
        </div>
        </body>
        </html>
