<%@ page
	import="java.util.List , com.quizi.model.Question, com.quizi.model.User, com.quizi.model.Matching"
	language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Questions</title>
</head>
<body style="background-color: powderblue;">
<table width=1315px>
	<tr><td><h1>Take a test</h1></td>
	<td style="text-align: right">
	<% 
	User user = (User) request.getAttribute("user");
	%>
	<p><%=user.getFirstName()%> <%=user.getLastName()%><br/>
		<a href="/quizi/ReportServlet?userId=<%= user.getUserId()%>">Get Report</a><br/>
		<a href="/quizi/index.jsp">Logout</a>
	</td></tr>
</table>


	<p style="text-align: right">
		<% 
		if (request.getAttribute("message") != null){
			out.println(request.getAttribute("message"));
		}%>

		
	</p>
	<form action="/quizi/CheckAnswersServlet" method="post">
		<% 
	List<Question> questions = (List<Question>)request.getAttribute("questions");
	Question q = null;
			
		
	for(int i = 0; i < questions.size(); i++){
		q = questions.get(i);
		int questionType = q.getQuestionType(); %>

		<h4> Question <%= i + 1 %>: </h4>
		
		<% out.println(q.getQuestionDescription()); %>
		<br /> <input type="hidden" name="quesId_<%= i+1 %>" value="<%= q.getQuestionId()%>"> <input type="hidden" name="ques<%=q.getQuestionId()%>_type" value="<%=questionType%>">

		<% if (questionType == 2){ %>
			<input type="radio" name="opt<%= q.getQuestionId()%>" value="true">
			<label>True</label> <input type="radio" name="opt<%= q.getQuestionId()%>" value="false"> <label>False</label> <%
			
		}else if (questionType == 4){ %>
			<input type="text" name="opt<%= q.getQuestionId()%>"><%
			
		}else if(questionType == 3){							
			 List<String> mcOptions = q.getMultipleChoice();
			 for(int mcloop = 0; mcloop < mcOptions.size(); mcloop++){
				%>
				<input type="radio" name="opt<%= q.getQuestionId()%>"
				value="<%=mcOptions.get(mcloop)%>" /> <label>
				<% out.println(mcOptions.get(mcloop));%>
				</label> <br />
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
		
		}else{ %>
		<label>Nothing</label> <%
		}
			}
			
		%>
		<br /> <br /> <input type="hidden" name="userId"
			value="<%= user.getUserId()%>" /> <input type="hidden"
			name="firstName" value="<%= user.getFirstName()%>" /> <input
			type="hidden" name="lastName" value="<%= user.getLastName()%>" /> <input
			type="submit" name="submit" value="Submit" />

	</form>
</body>
</html>