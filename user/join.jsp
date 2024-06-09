<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <style>
        .join {
            width: 410px; 
            position: absolute; 
            left: 50%; top:50%; 
            transform:translate(-50%,-50%);
        }
        .join h2{
            padding:0 0 20px; 
            border-bottom: 2px solid #111; 
            text-align: center; 
            line-height: 1; 
            font-size: 32px; 
            color: #111;
        }
        .join ul {padding:40px 0 0; margin:0 0 0}
        .join li {padding: 0 0 12px; list-style-type: none;}
        .join li input {width: 100%; height: 46px; box-sizing: border-box; text-indent: 16px;}
        .join > ul li input::-webkit-input-placeholder{font-size: 16px; color:#9fa19f;}
        .join button {width: 100%; height: 56px; border:none; background: #256ba9; font-size: 18px; color: #fff;}
        .join button:hover{cursor: pointer; background:#0F4C81;}
        .join div ul{display: flex; justify-content: center;}
        .join div ul li {padding: 0 18px;}
        .join div ul li a {font-size: 14px; color:#111;}

        .email-container {
            display: flex; /* Flexbox를 사용하여 내부 요소들을 가로로 배치 */
            /justify-content: space-between; /* 요소들 사이에 공간을 균등하게 배분 */
            align-items: center; /* 요소들을 세로 중앙에 배치 */
        }
        .email-container input[type="text"] {
            
        }
        .email-container input[type="submit"] {
            width: 200;/* 버튼 스타일링 (필요에 따라 수정) */
            flex-grow: 1; /* 이메일 입력 필드가 가능한 많은 공간을 차지하도록 설정 */
            margin-left: 8px; /* 입력창과의 간격을 설정 */
        }
        #check1{
            display: flex; /* Flexbox를 사용하여 내부 요소들을 가로로 배치 */
            /justify-content: space-between; /* 요소들 사이에 공간을 균등하게 배분 */
            align-items: center; /* 요소들을 세로 중앙에 배치 */
        }
        #check1[type="text"]{
            margin-right: 8px; /*버튼과의 간격을 설정*/
        }
        #check1[type="button"]{
            width: 200;
            flex-grow: 1;
        }
    </style>
    
</head>
<body>
    <section class="join">
        <h2>회원가입</h2>
        <form>
        <ul>
            <li>
                <input type="text" placeholder="아이디" name="userID" id="userID" title="아이디입력" onkeyup="idOverlap(); btn_disabled()" max="20">
                <span id="confirmId"></span>
            </li>
            <li>
                <input type="text" placeholder="이름" name="userName" id="userName" title="이름입력" onkeyup="nameCheck(); btn_disabled()" max="20">
                <span id="nameRegExp"></span>
            </li>
            <li><input type="password" placeholder="비밀번호" name="userPW" id="userPW" title="비밀번호입력" onkeyup="pwRegExp(); btn_disabled()" max="20">
                <span id="pwRegExp"></span>
            </li>
            <li><input type="password" placeholder="비밀번호" id="checkPw" onkeyup="pwOverlap(); btn_disabled()" max="20">
                <span id="confirmPw"></span>
            </li>
            <li>
                <div class="email-container">
                    <input type="text" placeholder="학번" name="userEmail" id="userEmail" title="이메일을입력" onkeyup="emailRegExp(); btn_disabled()" max="10">
                    <span>@</span>
                    <input type="text" readonly value="yeonsung.ac.kr" name="domein" id="domein" title="도메인" max="20">
                    <input type="submit" id="EmailButton" onclick="confirmEmail()" value="인증번호 받기" disabled/>
                </div>
                <span id="emailRegExp"></span>           
            </li>
            <li>   
                <div id="check1"></div>
                <span id="emailCodeCheck"></span>
            </li>
            <li><button id="joinbtn" onclick="sendData()" disabled>회원가입</button></li>
        </ul>
        <div>
            <ul></form>
            <li><a href="login.jsp">로그인</a></li>
            <li><a href="findingID.jsp">아이디 찾기</a></li>
            <li><a href="findingPW.jsp">비밀번호 찾기</a></li>
            </ul>
        </div>
    </section>
    <script>
        let a = false;
        let b = false;
        let c = false;
        let d = false;
        let e = false;
        let f = false;
        let emailCode="";
        
        function btn_disabled(){
            if(a==true && b==true && c==true && d==true && e==true && f==true){// 비밀번호 && 비밀번호 확인
                document.getElementById("joinbtn").disabled = false; //버튼 활성화
            }
            else{
                document.getElementById("joinbtn").disabled = true; //버튼 비활성화
            }
        }
        //아이디 중복체크
        function idOverlap(){
            let idCheck = document.getElementById("userID").value;
            let confirmId = document.getElementById("confirmId");

            $.ajax({
                type : "POST",
                url : "idCheck.jsp",
                data : { "userID" : idCheck} ,
                dataType : "text" ,
                success : function(data){
                    // 성공시
                    if(data.trim()=="OK" && idCheck.length > 3){ //trim() : 공백제거
                        confirmId.style.color="#0000ff";
                        confirmId.innerHTML = "사용 가능한 아이디";
                        a=true;
                    }else if(data.trim()=="DUPLICATE"){
                        confirmId.style.color="#ff0000";
                        confirmId.innerHTML="사용중인 아이디입니다.";
                        a=false;
                    }
                    else if(idCheck.length < 4){
                        confirmId.style.color="#ff0000";
                        confirmId.innerHTML="4자리 이상 입력해주세요";
                        a=false;
                    }
                    else{
                        alert("데이터베이스 오류");
                    }
                },
                error : function(){
                    // 실패시
                    alert("idOverlap함수 통신 실패");
                }
            });
        }
        function nameCheck(){
            let name = document.getElementById("userName").value;
            let nameRegExp = document.getElementById("nameRegExp");

            if(name.length < 2 || name.length > 20){
                nameRegExp.style.color="#ff0000";
                nameRegExp.innerHTML = "2자리 ~ 20자리 이내로 입력해주세요"
                b=false;
            }
            else{
                nameRegExp.style.color="#0000ff";
                nameRegExp.innerHTML = "사용가능";
                b=true;
            }
        }
        //비밀번호 정규식
        function pwRegExp(){
            let Pw = document.getElementById("userPW").value;
            let pwRegExp = document.getElementById("pwRegExp");

            let num = Pw.search(/[0-9]/g);
            let eng = Pw.search(/[a-z]/ig);
            let spe = Pw.search(/['~!@#$%^&*|\\\'\";:\/?]/gi);

            if(Pw.length < 8 || Pw.length > 15){
                pwRegExp.style.color="#ff0000";
                pwRegExp.innerHTML = "8자리 ~ 15자리 이내로 입력해주세요!";
                c=false;
            }
            else if(Pw.search(/\s/) != -1){
                pwRegExp.style.color="#ff0000";
                pwRegExp.innerHTML="비밀번호는 공백없이 입력해주세요";
                c=false;
            }
            else if(num < 0 || eng < 0 || spe < 0){
                pwRegExp.style.color="#ff0000";
                pwRegExp.innerHTML="영문, 숫자, 특수문자를 혼합하여 입력해주세요";
                c=false;
            }
            else{
                pwRegExp.style.color="#0000ff";
                pwRegExp.innerHTML="적절한 비밀번호";
                pwOverlap();
                c=true;
            }
        }

        //비밀번호 일치여부 확인
        function pwOverlap(){
            let pw= document.getElementById("userPW").value;
            let pwRegExp = document.getElementById("pwRegExp");

            let checkPw = document.getElementById("checkPw").value;
            let confirmPw = document.getElementById("confirmPw");

            //pwRegExp.innerHTML="";

            if(pw==checkPw){
                confirmPw.style.color="#0000ff";
                confirmPw.innerHTML="비밀번호가 일치합니다.";
                d=true;
            }else{
                confirmPw.style.color="#ff0000";
                confirmPw.innerHTML="비밀번호가 일치하지 않습니다.";
                d=false;
            }
        }

        //이메일 형식 확인
        function isValidEmail(email) {
            // @ 기호의 개수 세기
            let atCount = 0;
            for (let i = 0; i < email.length; i++) {
                if (email[i] === '@') {
                    atCount++;
                }
            }
            // @ 기호가 1개이고, 도메인에 '.'기호가 포함되어있고, 첫 글자가 '@' 기호가 아닐 때
            return atCount == 1 && email.split('@')[1].includes('.') && email[0] != '@';
        }
        
        function emailRegExp(){
            let email = document.getElementById("userEmail").value +"@yeonsung.ac.kr";
            let emailRegExp = document.getElementById("emailRegExp");
            if (isValidEmail(email)) {
                console.log('유효한 이메일 주소입니다.');
                emailRegExp.style.color="#0000ff";
                emailRegExp.innerHTML="유효한 이메일 주소입니다.";
                document.getElementById("EmailButton").disabled = false; //버튼 활성화
                e=true;
            } else {
                console.log('유효하지 않은 이메일 주소입니다.');
                emailRegExp.style.color="#ff0000";
                emailRegExp.innerHTML="유효하지 않은 이메일 주소입니다.";
                document.getElementById("EmailButton").disabled = true; //버튼 활성화
                e=false;
            }
        }

        //인증번호 전송 버튼
        function confirmEmail(){
            let MEmail = document.getElementById("userEmail").value+"@yeonsung.ac.kr";
            //let emailConfirmText = document.getElementById("emailConfirmText");
            let check1 = document.getElementById("check1");

            $.ajax({
                type : "POST" ,
                url : "emailAction.jsp",
                data : {"userEmail" : MEmail} ,
                dataType : "text" ,
                success : function(data){
                    if(data.trim()=="error"){
                        alert("이메일 전송 실패");
                    }
                    else{
                        alert("입력하신 이메일로 인증번호가 발송되었습니다.");
                        document.getElementById("userEmail").readOnly = true;
                        emailCode=data.trim();
                        check1.innerHTML = "<input type='text' id='check2' value=''> <input type='button' id='check3' class='check3' value='인증번호 확인'>";
                        // 사용자가 이메일 입력란에 값을 입력할 때마다 인증을 시도합니다.
                        document.getElementById('check3').addEventListener('click', confirmVerificationCode);
                        document.getElementById('check3').addEventListener('click', btn_disabled);

                        // 3분 후에 hideInput 함수 호출
                        setTimeout(hideInput, 3 * 60 * 1000);
                    }
                } ,
                error : function(){
                    alert("서버 통신 오류"+MEmail);
                }
            })   
            event.preventDefault(); //기본 동작을 막습니다.
        }

        // 사용자가 이메일 입력란에 값을 입력할 때마다 인증을 시도합니다.
        function confirmVerificationCode(event){
            event.preventDefault();
            value = document.getElementById("check2").value;
            if(value==emailCode){
                emailCodeCheck.style.color="#0000ff";
                emailCodeCheck.innerHTML = "인증되었습니다.";
                f=true;
            }
            else{
                emailCodeCheck.style.color="#ff0000";
                emailCodeCheck.innerHTML = "인증번호가 일치하지 않습니다.";
                f=false;
            }
        }
        /*
        //새로고침 막기
        function handleToDoSubmit() {
  
        }
        toDoForm.addEventListener("submit", handleToDoSubmit);
        */
        // inputContainer 요소의 내용을 지워서 입력창을 숨김
        function hideInput() {
            document.getElementById("check1").innerHTML = "";
        }
        
        //회원가입 버튼 클릭
        function sendData(){
            let Id = document.getElementById("userID").value;
            let Pw = document.getElementById("userPW").value;
            let Name = document.getElementById("userName").value;
            let Email = document.getElementById("userEmail").value+"@yeonsung.ac.kr";

            $.ajax({
                type : "POST" ,
                url : "joinAction.jsp",
                data : {
                    "userID" : Id,
                    "userPW" : Pw,
                    "userName" : Name,
                    "userEmail" : Email,
                } ,
                dataType : "text" ,
                success : function(data){
                    if(data.trim() == 1){
                        alert("회원가입 성공");
                        window.location.href = "login.jsp";
                        console.log(data.trim());
                    }
                    else{
                        alert(data.trim());
                        console.log(data.trim());
                    }
                } ,
                error : function(){
                    alert("서버 통신 오류");
                }
            })
        }
    </script>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>