<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="wrapper">
            <div class="user-container">
                <label for="nickname">대화명</label>
                <!--<input type="text" id="nickname">-->
            </div>
            <div class="display-container">
                <ul class="chatting-list">
                    <li class="sent">
                        <span class="profile">
                            <span class="user">손흥민</span>
                            <!--<img class="image" src="https://placeimg.com/50/50/any" alt="any">-->
                            <img class="image" src="image/son.jpg" alt="any">
                        </span>
                        <span class="message">팔렸나요?</span>
                        <span class="time">오후 2:10</span>
                    </li>
                    <li class="sent">
                        <span class="profile">
                            <span class="user">손흥민</span>
                            <!--<img class="image" src="https://placeimg.com/50/50/any" alt="any">-->
                            <img class="image" src="image/son.jpg" alt="any">
                        </span>
                        <span class="message">팔렸나요?</span>
                        <span class="time">오후 2:10</span>
                    </li>
                    <li class="sent">
                        <span class="profile">
                            <span class="user">손흥민</span>
                            <!--<img class="image" src="https://placeimg.com/50/50/any" alt="any">-->
                            <img class="image" src="image/son.jpg" alt="any">
                        </span>
                        <span class="message">팔렸나요?</span>
                        <span class="time">오후 2:10</span>
                    </li>
                    <li class="received">
                        <span class="profile">
                            <span class="user">이주빈</span>
                            <img class="image" src="image/lee.jpg" alt="any">
                        </span>
                        <span class="message">안팔렸어요</span>
                        <span class="time">오후 2:11</span>
                    </li>
                </ul>
            </div>
            <div class="input-container">
                <span>
                    <input type="text" class="chatting-input">
                    <button class="send-button">전송</button>
                </span>        
            </div>
        </div>

        <script src=""></script>
        <script src=""></script>
    </body>
</html>