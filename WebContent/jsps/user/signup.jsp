<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Sign up</h1>
	
	<h3>Welcome to Quizi! Here you can check your knowledge about FBLA. Sign up below to start taking tests and see you how you do.</h3>
	
		<h1>
		<%
	if (request.getAttribute("message") != null){
			out.println(request.getAttribute("message")); 
	}%>
	</h1>
	<br />
	
	<form action = "/SignupServlet" method = "post" >
		First Name:<br/>
			<input type = "text" name = "firstName" value="myFirstName"/><br/>
		Last Name:<br/>
			<input type = "text" name = "lastName" value="myLastName"/><br/>
		User Name:<br/>
			<input type = "text" name = "userName" value="myUserName"/><br/>
		Password:<br/>
			<input type = "password"  name = "password" value="mypassword"/><br/>
			
		<input type = "submit" value = "Submit"/>
	</form>
</body>
</html>