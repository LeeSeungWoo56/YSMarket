<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <style>
        .login {
            width: 410px; 
            position: absolute; 
            left: 50%; top:50%; 
            transform:translate(-50%,-50%);
        }
        .login h2{
            padding:0 0 20px; 
            border-bottom: 2px solid #111; 
            text-align: center; 
            line-height: 1; 
            font-size: 32px; 
            color: #111;
        }
        .login ul {padding:40px 0 0; margin:0 0 0}
        .login li {padding: 0 0 12px; list-style-type: none;}
        .login li input {width: 100%; height: 46px; box-sizing: border-box; text-indent: 16px;}
        .login > ul li input::-webkit-input-placeholder{font-size: 16px; color:#9fa19f;}
        .login > form ul li input[type="checkbox"] {position:absolute; left: -3000%;}
        .login > form ul li input[type="checkbox"] + label{height:36px; line-height: 36px;}
        .login > form ul li input[type="checkbox"] + label:before{content: ""; display:inline-block; margin:0 10px 0 0; width: 18px; height: 18px; border:1px solid #666; background: #fff; vertical-align: -5px;}
        .login > form ul li input[type="checkbox"]:checked + label:before {background: url(../imageFile/checkbox_icon2.png) no-repeat center #fff; border-color:#333;}
        .login button {width: 100%; height: 56px; border:none; background: #256ba9; font-size: 18px; color: #fff;}
        .login button:hover{cursor: pointer; background:#0F4C81;}
        .login div ul{display: flex; justify-content: center;}
        .login div ul li {padding: 0 18px;}
        .login div ul li a {font-size: 14px; color:#111;}
    </style>
</head>
<body>
    <section class="login">
        <h2>회원탈퇴</h2>
        <form method="post" action="deletePro.jsp">
        <ul>
            <li><input type="password" placeholder="비밀번호" name="userPW" title="비밀번호입력" max="20"></li>
            <li><button>탈퇴하기</button></li>
        </ul>
    </section>
</body>
</html>