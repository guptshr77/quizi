<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<style>
	b{
		font-size = 17px;
	}
	h1{text-align: center;}
</style>
</head>
<body style="background-color:powderblue" style= "text-align:center;">  
	
	<h1>Welcome to Quizi!</h1>
	<h1>
	<%
	if (request.getAttribute("message") != null){
			out.println(request.getAttribute("message")); 
	}
	%>
	</h1>
	<br />

	<form action="/quizi/LoginServlet" method="post">
		<center><b>User Name:</b></center><br/> 
		<br/>
		<center><input type="text" name="username" value="myUserName" /></center><br/> 
		<br/>
		<br/>
		<center><b>Password:</b></center><br/>
		<br/> 
		<center><input type="password" name="password" value="mypassword" /></center><br/> 
		<br/>
		<center><input type="submit" value="login" /></center>
	</form>
	</br>
	<center>Don't have an account? Sign up <a href=jsps/user/signup.jsp>here</a></center>
	<br />
</body>
</html>