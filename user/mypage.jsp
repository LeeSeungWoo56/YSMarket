<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPW" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="photo" />
<% 
  //String UserID ="";//UserID라는 변수를 만들고 값을 넣음
  try{
        String UserID = (String) session.getAttribute("UserID");
	    if(UserID==null || UserID.equals("")){//UserID가 null이거나 아무것도 할당되지 않았다면*/
        response.sendRedirect("login.jsp"); //response.sendRedirect를 통해서 화면을 login.jsp로 이동
        }else{ //로그인 수행 후
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Management</title>
    <!--<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">-->
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
        }
        .profile-card {
            background: linear-gradient(90deg, #00c6ff, #0072ff);
        }
        .section-header {
            background: linear-gradient(90deg, #00c6ff, #0072ff);
        }
        .arrow-icon {
            content: '>';
            color: white;
            font-weight: bold;
        }
    </style>
</head>
<body class="bg-gray-100">
<%
    request.setCharacterEncoding("utf-8");
    //String name_1 = request.getParameter("name");
    //User user = new User();
    user.setUserID(UserID);
    UserDAO dao = new UserDAO();
    List member = dao.selectUser(user);
    
    user = (User) member.get(0); // 첫 번째 User 객체 가져오기
    //String userName = user.getUserName(); // userName 필드 값 가져오기
    //user.setUserName(userName);
%>
    <div class="min-h-screen flex">
        <!-- Sidebar -->
        <div class="w-1/4 bg-white p-6">
            <div class="flex items-center mb-6">
                <!--<img src="https://via.placeholder.com/40" alt="Logo" class="mr-2">-->
                <img src="../image/logo.jpg" width="40" height="40" alt="Logo" class="mr-2">
                <span class="text-xl font-bold">마이페이지</span>
            </div>
            <div class="flex items-center mb-6">
                <!--<img src="https://via.placeholder.com/80" alt="Profile Picture" class="rounded-full mr-4">-->
                <img src="../image/profile.png" width="80" height="80" alt="Profile Picture" class="rounded-full mr-4">
                <div>
                    <h2 class="text-lg font-bold"><%= user.getUserName() %></h2>
                    <p class="text-gray-500"> <%= user.getUserEmail() %> </p>
                </div>
            </div>
            <div class="mb-6">
                <p class="bg-green-100 text-green-700 p-2 rounded">[보안기능] 새로운 환경에서 로그인...</p>
            </div>
            <nav>
                <ul>
                    <li class="mb-4"><a href="#" class="text-gray-700 font-medium">내프로필</a></li>
                    <li class="mb-4"><a href="#" class="text-gray-700 font-medium">보안설정</a></li>
                    <li class="mb-4"><a href="#" class="text-gray-700 font-medium">이력관리</a></li>
                </ul>
            </nav>
            <div class="mt-auto">
                <div class="bg-blue-100 p-4 rounded mb-4">
                    <p class="text-blue-700">새벽 4시에 로그인? 간단히 확인, 늦기 전에 미리 신청!</p>
                </div>
                <div class="text-center text-gray-500">
                    <p><a href="logout.jsp">로그아웃</a> | <a href="/templete/customer/Customer.jsp">고객센터</a> | <a href="userdelete.jsp">탈퇴하기</a></p>
                    <p class="mt-2">연성마켓</p>
                </div>
            </div>
        </div>
        <!-- Main Content -->
        <div class="w-3/4 p-6">
            <div class="grid grid-cols-1 gap-6">
                <!-- Profile Section -->
                <div class="bg-white p-6 rounded-lg shadow">
                    <div class="section-header p-4 rounded-t-lg text-white font-bold flex justify-between items-center">
                        내프로필
                        <span class="arrow-icon"></span>
                    </div>
                    <div class="p-4">
                        <div class="flex justify-between items-center mb-4">
                            <div>
                                <p class="font-medium"><%= user.getUserName() %></p>
                                <!--<p class="text-gray-500"></p>-->
                            </div>
                            <button class="bg-blue-500 text-white px-4 py-2 rounded">수정</button>
                        </div>
                    </div>
                </div>
                <!-- Security Settings Section -->
                <div class="bg-white p-6 rounded-lg shadow">
                    <div class="section-header p-4 rounded-t-lg text-white font-bold flex justify-between items-center">
                        보안설정
                        <span class="arrow-icon"></span>
                    </div>
                    <div class="p-4">
                        <div class="flex justify-between items-center mb-4">
                            <p class="font-medium">비밀번호</p>
                            <button class="bg-blue-500 text-white px-4 py-2 rounded">수정</button>
                        </div>
                        <div class="flex justify-between items-center mb-4">
                            <p class="font-medium">2단계 인증</p>
                            <button class="bg-green-500 text-white px-4 py-2 rounded">설정</button>
                        </div>
                        <div class="flex justify-between items-center mb-4">
                            <p class="font-medium">타지역 로그인 차단</p>
                            <label class="switch">
                                <input type="checkbox">
                                <span class="slider round"></span>
                            </label>
                        </div>
                        <div class="flex justify-between items-center mb-4">
                            <p class="font-medium">해외 로그인 차단</p>
                            <label class="switch">
                                <input type="checkbox" checked>
                                <span class="slider round"></span>
                            </label>
                        </div>
                    </div>
                </div>
                <!-- Activity Management Section -->
                <div class="bg-white p-6 rounded-lg shadow">
                    <div class="section-header p-4 rounded-t-lg text-white font-bold flex justify-between items-center">
                        이력관리
                        <span class="arrow-icon"></span>
                    </div>
                    <div class="p-4">
                        <div class="flex justify-between items-center mb-4">
                            <p class="font-medium">로그인 목록</p>
                            <button class="bg-blue-500 text-white px-4 py-2 rounded">확인</button>
                        </div>
                        <div class="flex justify-between items-center mb-4">
                            <p class="font-medium">내 활동 기록 보기</p>
                            <button class="bg-blue-500 text-white px-4 py-2 rounded">확인</button>
                        </div>
                        <div class="flex justify-between items-center mb-4">
                            <p class="font-medium">연결된 서비스 관리</p>
                            <button class="bg-blue-500 text-white px-4 py-2 rounded">확인</button>
                        </div>
                    </div>
                </div>
            </div>
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