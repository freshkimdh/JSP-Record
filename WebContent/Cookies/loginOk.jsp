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
		String id, pw; // ���� ����
	%>
	<%
		id = request.getParameter("id"); // �ش� �Ű����� ������(��û) ��𿡼�? login.html
		pw = request.getParameter("pw");
		
		if(id.equals("abcde") && pw.equals("12345")) { // ID, PW ��ġ�ϸ� �Ʒ� �ڵ� ����
			Cookie cookie = new Cookie("id", id); // ID �� cookie ��ü�� �־� ��
			cookie.setMaxAge(60); //60�� ���ѽð� ����
			response.addCookie(cookie); //response ��ü�� cookie ���� �־� ��
			response.sendRedirect("welcome.jsp");
			//��Ű�� ������ �ִ� ���·� ��������(����)�� ���� �ϴ� ���ÿ�, 
			//"welcome.jsp"�� redirect ������� ������ ����
		} else {
			response.sendRedirect("login.html");
		}
	%>

</body>
</html>