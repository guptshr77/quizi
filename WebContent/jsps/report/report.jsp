<%@ page language="java" import="com.quizi.model.Report, java.util.List, com.quizi.model.User, java.text.SimpleDateFormat, 
java.util.Date,com.quizi.model.Matching" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Report</title>
</head>
<body  style="background-color:powderblue" >

<table width=1315px>
	<tr><td><h1>Report</h1></td>
	<td style="text-align: right">
	<% 
	User user = (User) request.getAttribute("user");
	%>
	<p><%=user.getFirstName()%> <%=user.getLastName()%><br/>
			<a href="/quizi/QuestionServlet?userId=<%= user.getUserId()%>">Take a test</a><br/>
			<a href="/quizi/index.jsp">Logout</a></p>
	</td></tr>
</table>



	<h2>
		<%
			if (request.getAttribute("message") != null) {
				out.println(request.getAttribute("message"));
			}		
		%>
	</h2>

	<form>
		<%
			List<Report> reports = (List<Report>) request.getAttribute("reports");
			SimpleDateFormat formatter=new SimpleDateFormat("MMM dd, yyyy hh:mm aa");
			int countForDate = 0;
			Report report = null;
			if (reports != null) {

				for (int i = reports.size() - 1; i >= 0; i--) {
					report = reports.get(i);
					int questionType = report.getQuestionType();
					if (countForDate % 5 == 0){
						%> <br/><h3>Test taken at: <%
						out.println(formatter.format(report.getDateTime()));
						if(countForDate >= 5){
							countForDate = 0;
						}
					}
					%></h3><%
					countForDate++;
		%>
		<h4>
			Question
			<%=countForDate%>:
		</h4>
		<%
			out.println(report.getQuestionDescription());
		%>
		
		<br />
		<%
			if (questionType == 2) {
				%><input type="radio" name="opt<%= report.getQuestionId()%>" disabled = "true"/>
					<label>True</label> 
				   <input type="radio" name="opt<%= report.getQuestionId()%> " disabled = "true"/>
					 <label>False</label>
						<%
				if (report.isCorrect()) {
					%>
						<p style="color:green">Correct! The answer you selected was: <%=report.getAnswer()%></p>
					<%
				}else{
					%>
						<p style="color:red">Incorrect! Correct Answer is: <%=report.getAnswer()%></p>
					<%
				}
				

					} else if (questionType == 4) {
						if (report.isCorrect() == true) {
		%>
		<p style="color:green">Correct! The answer you selected was: <%=report.getAnswer()%></p>
		<%
			} else {
		%>
		<p style="color:red"> Incorrect! The correct answer is: <%=report.getAnswer()%></p>
		<%
			}
					} else if (questionType == 3) {
						if (report.isCorrect() == true) {
		%>
		<p style="color:green">Correct! The answer you selected was: <%=report.getAnswer()%></p>
		<%
			} else {
		%>
		<p style="color:red">Incorrect! The correct answer is: <%=report.getAnswer()%></p>
		<%
			}
					} else if (questionType == 1) {
						List<Matching> matching = report.getMatching();
						%><ul><%
						for(int optCount = 0; optCount < 4; optCount++){%>
						<li>
							<b><%=matching.get(optCount).getWord()%></b>: <label for="ques_<%= report.getQuestionId()%>_opt<%=optCount%>"><%=matching.get(optCount).getDefinition()%></label><br /> 
						</li>	
							<%
						}
						%></ul><%
						if (report.isCorrect() == true) {
		%>
		<p style="color:green">Correct! </p>
		<%
			} else {
		%>
		<p style="color:red">Incorrect! These are the correct definitions.</p>
		<%
			}

					} else {
		%>
		<label>Nothing</label>
		<%
			}
				}
			}
		%>

	</form>
</body>
</html>