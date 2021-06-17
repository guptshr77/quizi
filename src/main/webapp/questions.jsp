<%@ page
	import="java.util.List , com.quizi.model.Question, com.quizi.model.User, com.quizi.model.Matching"
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
		</tr>
		<tr>
			<td>
				<font size = "2" face="arial">
					<table align="center">
						<tr>
							<% 
							User user = (User) request.getAttribute("user");
							%>
							<td><a href="/quizi/ReportServlet?userId=<%= user.getUserId()%>">Get Report</a>&nbsp;&nbsp;|&nbsp;&nbsp;</td>
							<td><a href="index.jsp">Logout</a>&nbsp;&nbsp;| &nbsp;&nbsp;</td>
							<td><a href="help.jsp?userId=<%= user.getUserId()%>&firstname=<%=user.getFirstName()%>&lastname=<%=user.getLastName()%>">Help Menu</td>
						</tr>
					</table>
				</font>
			</td>
			<td>
				<font size="2" face="arial">
					<table align="right">
						<tr>
							<td><%=user.getLastName()%>,&nbsp;<%=user.getFirstName()%><br/> </td>
						</tr>
					</table>
				</font>
			</td>
		</tr>
		<tr>
			<td colspan=2><hr color="blue"/></td>
		</tr>
		<tr>
			<td align="center"><h1>Take a Test</h1></td>
		</tr>
		<tr>
			<td align="center">
			<form action="/quizi/CheckAnswersServlet" method="post">
				<p style="color:red">
				<% 
				if (request.getAttribute("message") != null){
					out.println(request.getAttribute("message"));
				}%>
				</p>
				<table border=0 cellspacing=20 width="85%">
				<tr>
					<td align="left">
						<table>
				<% 
					List<Question> questions = (List<Question>)request.getAttribute("questions");
					Question q = null;
							
						
					for(int i = 0; i < questions.size(); i++){
						q = questions.get(i);
						int questionType = q.getQuestionType(); %>
						<tr><td>
						<h4> Question <%= i + 1 %>: </h4>
						
						<% out.println(q.getQuestionDescription()); %>
						<br /> <input type="hidden" name="quesId_<%= i+1 %>" value="<%= q.getQuestionId()%>"> <input type="hidden" name="ques<%=q.getQuestionId()%>_type" value="<%=questionType%>">
						<!-- Question Type: True False -->
						<% if (questionType == 2){ %>
							<input type="radio" name="opt<%= q.getQuestionId()%>" value="true">
							<label>True</label> <input type="radio" name="opt<%= q.getQuestionId()%>" value="false"> <label>False</label> 
						<!-- Question Type: Fill in the Blank -->	
						<%	
						}else if (questionType == 4){ %>
							<input type="text" name="opt<%= q.getQuestionId()%>">
						<!-- Question Type: Multiple Choice -->	
						<%
						}else if(questionType == 3){							
							 List<String> mcOptions = q.getMultipleChoice();
							 for(int mcloop = 0; mcloop < mcOptions.size(); mcloop++){
								%>
								<input type="radio" name="opt<%= q.getQuestionId()%>"
								value="<%=mcOptions.get(mcloop)%>" /> <label>
								<% out.println(mcOptions.get(mcloop));%>
								</label> <br />
						<!-- Question Type: Matching (Drop Down) -->
						<%	 }
							 
						}else if (questionType == 1){%>
						<%				
							List<Matching> matching = q.getMatching();
							for(int optCount = 0; optCount < 4; optCount++){%>
								<select id="ques_<%= q.getQuestionId()%>_opt<%=optCount%>" name="matching">
									<option></option>
									<option value="<%=matching.get(0).getWordId()%>"><%=matching.get(0).getWord()%></option>
									<option value="<%=matching.get(1).getWordId()%>"><%=matching.get(1).getWord()%></option>
									<option value="<%=matching.get(2).getWordId()%>"><%=matching.get(2).getWord()%></option>
									<option value="<%=matching.get(3).getWordId()%>"><%=matching.get(3).getWord()%></option>
								</select> <label for="ques_<%= q.getQuestionId()%>_opt<%=optCount%>"><%=matching.get(optCount).getDefinition()%></label>
								<input type="hidden" name="defnitionId<%=optCount%>" value="<%= matching.get(optCount).getDefinitionId()%>"> <br /> <%
							}
						
						}
						%></td></tr><%
							}
							
						%>
						<tr><td>
						<!-- hidden fields to pass on -->
							<br /> <br /> 
							<input type="hidden" name="userId" value="<%= user.getUserId()%>" /> 
							<input type="hidden" name="firstName" value="<%= user.getFirstName()%>" /> 
							<input type="hidden" name="lastName" value="<%= user.getLastName()%>" /> 
							<input type="submit" name="submit" value="Submit" />
						</td></tr>	
							</table>
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