<%@ page import = "java.util.List , com.quizi.model.Question, com.quizi.model.User" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style= "background-color:powderblue;"">
	<h1>Welcome to Questions</h1>
	<p style= "text-align:right"><% 
		User user = (User)request.getAttribute("user"); 
		out.println(user.getFirstName());
		out.println(user.getLastName());
		
		if (request.getAttribute("message") != null){
			out.println(request.getAttribute("message"));
		}
	%>
	<a href = "/quizi/ReportServlet?userId=<%= user.getUserId()%> ">Get Report</a>
	</p>
	<form action = "/quizi/CheckAnswersServlet" method = "post">
		<% 
			List<Question> questions = (List<Question>)request.getAttribute("questions");
			Question q = null;	
		
			for(int i = 0; i < questions.size(); i++){
				q = questions.get(i);
				int questionType = q.getQuestionType(); 
				%>
				<h4>Question <%= i + 1 %>:</h4>
				<% out.println(q.getQuestionDescription()); %>
				<br/>
				<% if (questionType == 2){ %> 
						   <input type = "hidden" name = <%= i+1%> value = "<%= q.getQuestionId()%>"/>
						   <input type = "radio" name = "<%= q.getQuestionId()%>" value = "true">
							<label>True</label>
						   <input type = "radio" name = "<%= q.getQuestionId()%>" value = "false">
						    <label>False</label>
				<% 	
				} else if (questionType == 4){ %>
							<input type = "hidden" name = <%= i+1%> value = "<%= q.getQuestionId()%>"/>
							<input type = "text" name = "<%= q.getQuestionId()%>">
				<%}else if(questionType == 3){
						
				%>			<input type = "hidden" name = <%= i+1 %> value = "<%= q.getQuestionId()%>"/>

				<%
							List<String> mcOptions = q.getMultipleChoice();
							for(int mcloop = 0; mcloop < mcOptions.size(); mcloop++){
				%>				<input type = "radio" name = "<%= q.getQuestionId()%>" value = "<%=mcOptions.get(mcloop)%>"/>
								<label><% out.println(mcOptions.get(mcloop));%></label>
								<br/>
				<%			}
				}else{
					%> <label>Nothing</label> <%
				}
			}
			
		%>
		<br/>
		<br/>
		
		<input type = "hidden" name ="userId" value = "<%= user.getUserId()%>"/>
		<input type = "hidden" name ="firstName" value = "<%= user.getFirstName()%>"/>
		<input type = "hidden" name ="lastName" value = "<%= user.getLastName()%>"/>
		
				<input type = "submit" name = "submit" value = "Submit"/>
		
	</form>
</body>
</html>