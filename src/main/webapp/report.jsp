<%@ page language="java" import="com.quizi.model.Report, java.util.List, com.quizi.model.User, java.text.SimpleDateFormat, 
java.util.Date,com.quizi.model.Matching" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
			<td align="left" width="50%">
				<table>
					<tr>
						<td colspan="2">
							<img src="QuiziLogo.jpg" alt="Quizi">
						</td>
					</tr>
				</table>
			</td>
			<td align="right"  width="50%">
				<% 
				User user = (User)request.getAttribute("user");
				%>
<!-- Top Right had Corner Links (Navigation Links) -->
				<p ><%=user.getFirstName()%> <%=user.getLastName()%><br/>
					<a href="/quizi/QuestionServlet?userId=<%=user.getUserId()%>">Take Another Test</a><br/>
					<a href="/quizi/ReportServlet?userId=<%= user.getUserId()%>">Get Report</a><br/>
					<a href="" onclick= "window.print()"/>Print</a><br/>
					<a href="index.jsp">Logout</a>
					
				</p>
			</td>
		</tr>
		<tr>
			<td colspan=2><hr color="blue"/></td>
		</tr>
		
		<tr>
			<td align="center" colspan=2><h1>Report</h1></td>
		</tr>
		<tr>
			<td align="center"  colspan=2>

	<form>
	<table border=0 cellspacing=20 width="85%">
		<tr>
			<td align="left">
				<table>
	
	<!-- Divides the questions into groups of 5 in order of how the question appeared  -->
	
					<%
						List<Report> reports = (List<Report>) request.getAttribute("reports");
						SimpleDateFormat formatter=new SimpleDateFormat("MMM dd, yyyy hh:mm aa");
						int countForDate = 0;
						Report report = null;
						int numCorrect = 0;
						boolean isNumCorrectReset=false;
						
						if (reports != null) {
							%>
							<b>Filter: </b> <select name="reportDate" id="reportDate">
							<%
							for (int i = reports.size() - 1; i >= 0; i--) {
								report = reports.get(i);
								%>
								<option value="<%=formatter.format(report.getDateTime())%>"><%=formatter.format(report.getDateTime())%></option>
								<%
							}
							%></select><%
							for (int i = reports.size() - 1; i >= 0; i--) {
								report = reports.get(i);
								int questionType = report.getQuestionType();%>
	<!-- Divides in groups of 5 -->
								<%
								if (countForDate % 5 == 0){
									%>
									<tr><td>
									<%
										if(isNumCorrectReset){
									%> 
										<p><u>Score: <%=numCorrect%>/5 </u></p>
										<%
										}
										isNumCorrectReset = true;	
										%>
									<br/><hr/><h3>Test taken at: <%
									out.println(formatter.format(report.getDateTime()));
									if(countForDate >= 5){
										countForDate = 0;
										numCorrect = 0;
									}
								}
								%>
								</td></tr>
								</h3><%
								countForDate++;
					%>
					<tr><td>	
					<h4>
	<!-- Print report of each question -->
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
								numCorrect++;
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
							numCorrect++;
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
						numCorrect++;
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
									numCorrect++;
									} else {
								%>
								<p style="color:red">Incorrect! These are the correct definitions.</p>
								<%
									}
								} 
							%></td></tr><%
							}
						}
					%>
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