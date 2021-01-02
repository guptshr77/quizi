<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<h1>Quizi</h1>
	<h1>
		<%
	if (request.getAttribute("message") != null){
			out.println(request.getAttribute("message")); 
	}%>
	</h1>
	<br />

	<form action="LoginServlet" method="post">
		User Name: <br /> <input type="text" name="username"
			value="myUserName" /><br /> Password: <br /> <input type="password"
			name="password" value="mypassword" /><br /> <input type="submit"
			value="login" />
	</form>
	<a href=jsps/user/signup.jsp>Sign Up</a>
	<br />
</body>
</html>