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
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="css/style.css">
        <script src="./jquery-3.7.1.min.js"></script>
        <!-- 부트스트랩 JS 추가 -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            function autoClosingAlert(selector, delay) {
                var alert = $(selector).alert();
                alert.show();
                window.setTimeout(function() { alert.hide() }, delay);
            }
            function submitFunction(){
                var sender_id = '<%= userID %>';
                var receiver_id = '<%= receiver_id %>';
                var content = $('#content').val();
                $.ajax({
                    type: "POST",
                    url: "/YSMarket/ChatSubmitServlet",
                    data: {
                        sender_id: encodeURIComponent(sender_id),
                        receiver_id: encodeURIComponent(receiver_id),
                        content: encodeURIComponent(content),
                    },
                    success: function(result) {
                        if(result == 1) {
                            autoClosingAlert('#successMessage', 2000);
                        } else if (result == 0) {
                            autoClosingAlert('#dangerMessage', 2000);
                        } else {
                            autoClosingAlert('#warningMessage', 2000);
                        }
                    }
                });
                $('#content').val('');
            }
            var lastID = 0;
            function chatListFunction(type) {
                var sender_id = '<%= userID %>';
                var receiver_id = '<%= receiver_id %>';
                $.ajax({
                    type: "POST",
                    url: "/YSMarket/ChatListServlet",
                    data: {
                        sender_id: encodeURIComponent(sender_id),
                        receiver_id: encodeURIComponent(receiver_id),
                        listType: type
                    },
                    success: function(data) {
                        if(data == "") return;
                        var parsed = JSON.parse(data);
                        var result = parsed.result;
                        for(var i = 0; i < result.length; i++) {
                            addChat(result[i][0].value, result[i][2].value, result[i][3].value);
                        }
                        lastID = Number(parsed.last);
                    }
                });
            }
            function addChat(chatName, content, timestamp){
                var sender_id = '<%= userID %>';
                var name = '<%= user.getUserName() %>';
                if(chatName !== sender_id){
                $('#chatList').append('<li class="received">' +
                '<span class="profile">' +
                '<span class="user">' + name + '</span>' +
                '<img class="image" src="../image/profile.png" alt="any">' +
                '</span>' +
                '<span class="message">' + content + '</span>' +
                '<span class="time">' + timestamp + '</span>' +
                '</li>');
                }
                else {
                $('#chatList').append('<li class="sent">' +
                '<span class="message">' + content + '</span>' +
                '<span class="time">' + timestamp + '</span>' +
                '</li>');
                }
                setTimeout(function() {
                    $('.display-container').scrollTop($('.display-container')[0].scrollHeight);
                }, 100);               
            }
            function getInfiniteChat() {
                setInterval(function() {
                    chatListFunction(lastID);
                },3000);
            }
        </script>
    </head>
    <body>
        <div class="alert alert-success" id="successMessage" style="display: none;">
            <string>메시지 전송에 성공했습니다.</strong>
        </div>
        <div class="alert alert-danger" id="dangerMessage" style="display: none;">
            <string>이름과 내용을 모두 입력해주세요</strong>
        </div>
        <div class="alert alert-warning" id="warningMessage" style="display: none;">
            <string>데이터베이스 오류가 발생했습니다.</strong>
        </div>
        
        <div class="wrapper">
            <div class="user-container">
                <label for="nickname">대화명</label>
                <!--<input type="text" id="nickname">-->
            </div>
            <div class="display-container">
                <ul id="chatList" class="chatting-list"></ul>
            </div>
            <div class="input-container">
                <span>
                    <input type="text" id="content" class="chatting-input">
                    <button class="send-button" onclick="submitFunction();">전송</button>
                </span>        
            </div>
        </div>
        <script>
            $(document).ready(function() {
                chatListFunction('ten');
                getInfiniteChat();
            });
        </script>
    </body>
</html>