<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%!
		String id, pw; // 변수 선언
	%>
	<%
		id = request.getParameter("id"); // 해당 매개변수 가져옴(요청) 어디에서? login.html
		pw = request.getParameter("pw");
		
		if(id.equals("abcde") && pw.equals("12345")) { // ID, PW 일치하면 아래 코드 실행
			Cookie cookie = new Cookie("id", id); // ID 만 cookie 객체에 넣어 줌
			cookie.setMaxAge(60); //60초 제한시간 설정
			response.addCookie(cookie); //response 객체에 cookie 값을 넣어 줌
			response.sendRedirect("welcome.jsp");
			//쿠키를 가지고 있는 상태로 웹브라우져(로컬)에 전달 하는 동시에, 
			//"welcome.jsp"에 redirect 방식으로 페이지 전달
		} else {
			response.sendRedirect("login.html");
		}
	%>

</body>
</html>