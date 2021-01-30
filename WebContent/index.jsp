<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="quizi.css">
</head>
<body>  
	<table border="0" width="100%">
		<tr>
			<td align="center"><h1>Welcome to Quizi!</h1></td><td align="right">LastName, FirstName</td>
		</tr>
		<tr>
			<td colspan=2><hr color="blue"/></td>
		</tr>
		<tr>
			<td align="center">
				<h1>
					<%
					if (request.getAttribute("message") != null){
							out.println(request.getAttribute("message")); 
					}
					%>
				</h1>
				<br />
				<form action="/quizi/LoginServlet" method="post">
				<table border=0 cellspacing=20 width="40%">
					<tr>
						<td><b>User Name:</b></td><td><input type="text" name="username"/></td>
					</tr>
					<tr>
						<td><b>Password:</b></td><td><input type="password" name="password"/></td> 
					</tr>
					<tr>
						<td><input type="submit" value="Login"></td><td></td>
					</tr>
					<tr>
						<td colspan=2>
							<br/>
							<br/>
							Don't have an account? Sign up <a href=jsps/user/signup.jsp>here</a>
						</td>
					</tr>
				</table>
				</form>
			</td>
			<td></td>
		</tr>
	</table>
	
</body>
</html>