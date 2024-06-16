<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset = "UTF-8">
	<title>메인 페이지</title>
</head>
<body>
    <jsp:include page="header.jsp"/>
    <jsp:include page="center.jsp"/>
    <jsp:include page="footer.jsp"/>
</body>
</html>

<!--

    cd ..\mail
javac -encoding utf-8 -d ../../WEB-INF/classes -classpath ../../WEB-INF/classes User.java
javac -encoding utf-8 -d ../../WEB-INF/classes -classpath ../../WEB-INF/classes UserDAO.java

cd mailTest
javac -d ../../WEB-INF/classes -cp "..\..\WEB-INF\lib\mail-1.4.7.jar" -encoding utf-8 SendMail.java

cd mail
javac -encoding utf-8 -d ../../WEB-INF/classes -classpath ../../WEB-INF/classes RandomCode.java
 -->