<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<%
		Cookie[] cookies = request.getCookies(); // 쿠키 요청
		
		if(cookies != null) { // "cookies"가 null이 아니면 코드 실행
			for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getValue().equals("abcde")){
					cookies[i].setMaxAge(0); //쿠키 날리는 것 "0"초로 선언 (삭제)
					// 삭제가 아니라, 웹 브라우져에서 보관을 하던 삭제를 하던 스스로 하게끔 하는 것
					response.addCookie(cookies[i]); // 쿠키를 웹브라우져에 전달 (0초짜리)
				}
			}
		}
		
		//response.sendRedirect("login.html"); // "login.html" 으로 연결
		response.sendRedirect("cookietest.jsp"); // "cookietest.jsp" 으로 연결
		//고유의 세션ID로 난수가 생성되는데, 누가 누구인지 확인 하기 위한 난수 세션ID 확인 가능 
	%>
	
</body>
</html>