<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quizi</title>
<link rel="stylesheet" href="quizi.css">
<link rel = "icon" href = "QuiziLogo.jpg">
</head>
<body>
	<table border="0" width="100%">
			<tr>
			<td align="left">
				<table>
					<tr>
						<td colspan="2">
							<img src="QuiziLogo.jpg" alt="Quizi">
						</td>
					</tr>
				</table>
			</td>
				<td align="right"  width="50%">
					<a href="index.jsp">Log in</a>
			</td>
		</tr>
		
				<tr>
			<td colspan=2><hr color="blue"/></td>
		</tr>
		<tr>
			<td align="center"><h1>Sign Up</h1></td>
		</tr>
		<tr>
			<td align = "center">
				<h3>Welcome to Quizi! Here you can check your knowledge about FBLA.<br/><br/>Sign up below to start taking tests and see how you do.</h3>
			</td>
		</tr>
		
		<tr>
			<td align = "center">
				<p style="color:red">
					<%
						if (request.getAttribute("message") != null){
						out.println(request.getAttribute("message")); 
					}%>
				</p>
					<br />	
			</td>
		</tr>
		<tr>		
			<td align = "center"> 
				<form action = "/quizi/SignupServlet" method = "post" >
					<table border = 0 cellspacing = 20 width = "40%">
					<tr>	
						<td><b>First Name:</b></td><td><input type = "text" name = "firstName"/></td>
					</tr>
					<tr>		
						<td><b>Last Name:</b></td><td><input type = "text" name = "lastName"/></td>
					</tr>
					<tr>		
						<td><b>User Name:</b></td><td><input type = "text" name = "userName"/></td>
					</tr>
					<tr>		
						<td><b>Password:</b></td><td><input type = "password"  name = "password"/></td>
					</tr>
					<tr>		
						<td><input type = "submit" value = "Submit"/></td>
					</tr>
					</table>
				</form>
			</td>
			<td></td>
		</tr>
	</table>
</body>
</html>