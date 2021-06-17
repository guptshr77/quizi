<%@ page import="com.quizi.model.User" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Help Menu</title>
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
		</tr>
		<tr>
			<td>
				<font size="2" face="arial" >
					<table align="center">
						<tr>
							<td><a href="/quizi/QuestionServlet?userId=<%=(String)request.getParameter("userId")%>">Take Another Test</a> &nbsp;&nbsp;|&nbsp;&nbsp;</td>
							<td><a href="/quizi/ReportServlet?userId=<%=(String)request.getParameter("userId")%>">Get Report</a> &nbsp;&nbsp;|&nbsp;&nbsp;</td>
							<td><a href="index.jsp">Logout</a> &nbsp;&nbsp;</td>
						</tr>
					</table>
				</font>
			</td>
			<td>
				<font size="2" face="arial" >
					<table align="right">
						<tr>
							<td><%=(String)request.getParameter("lastname")%>,&nbsp;<%=(String)request.getParameter("firstname")%><br/></td>
						</tr>
					</table>
				</font>
			</td>
		</tr>
		<tr>
			<td colspan=2><hr color="blue"/></td>
		</tr>
		<tr>
			<td align="center" colspan=2><h1>Help Menu</h1></td>
		</tr>
		<tr>
			<td align="center"  colspan=2>
				<table border=0 width="85%">
					<tr>
						<td><h3>Sign Up</h3></td>
					</tr>
					<tr>
						<td>
							<p style="margin-left: 40px">Create an account to take a test</p>
							<p style="margin-left: 80px"><b>Username:</b> Between 0 and 10 characters long</p>
							<p style="margin-left: 80px"><b>Password:</b> between 8 and 15 characters long</p>
							<p style="margin-left: 80px"><b>First Name:</b> Less than 20 characters long</p>
							<p style="margin-left: 80px"><b>Last Name:</b> Less than 20 characters long</p>
						</td>
					</tr>
					<tr>
						<td>
							<h3>Login</h3>
						</td>
					</tr>
					<tr>
						<td>
							<p style="margin-left: 40px">Log in with <i>Username</i> and <i>Password</i> that was used when Signing up</p>
						</td>
					</tr>
					<tr>
						<td>
							<h3>Take a Test</h3>
						</td>
					</tr>
					<tr>
						<td>
							<p style="margin-left: 40px">A five question quiz, randomly chosen from the database, appears. User can answer them and submit. The answers will be evaluated automatically and a report will be presented instantly. </p>
						</td>
					</tr>	
					<tr>
						<td>
							<h3>Get Report</h3>
						</td>
					</tr>
					<tr>
						<td>
							<p style="margin-left: 40px">When the user submits a questionaire, a report of that particular test is presented. <br/>
							If the user clicks the <i>Get Report</i> option in the menu, result of all the tests taken are presented labled by the datetime of the test taken. </p>
						</td>
					</tr>
					<tr>
						<td>
							<h3>Print</h3>
						</td>
					</tr>
					<tr>
						<td>
							<p style="margin-left: 40px">When the user clicks on Print menu item in the Reports page, the whole report visible can be printed into a desired format.</p>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>