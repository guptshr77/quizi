<%@ page language="java" import="com.quizi.model.Report, java.util.List"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>
		<%
			if (request.getAttribute("message") != null) {
				out.println(request.getAttribute("message"));
			}
		%>
	</h1>

	<form>
		<%
		List<Report> reports = (List<Report>)request.getAttribute("reports");
		Report report = null;
		if (reports != null){
				
			for (int i = reports.size() - 1; i >= 0; i--) {
				report = reports.get(i);
				int questionType = report.getQuestionType();
		%>
		<h4>
			Question <%=5 - i%>:
		</h4>
		<%
			out.println(report.getQuestionDescription());
		%>
		<br />
		<%
			if (questionType == 2) {
				if (report.getIsCorrect() == true){
		%>
				<p>You got it right! The answer is <%=report.isAnswer()%></p>
		<% 
				}else{
		%>
				<p>You got it wrong. The correct answer is <%=report.isAnswer()%></p>
		<%			
				}
			
			} else if (questionType == 4){
				if (report.getIsCorrect() == true){
		%>			<p> You got it right! The Answer is <%= report.isAnswer() %></p><%	
				}else{
		%> 			<p> You got it wrong. The Answer is <%= report.isAnswer() %></p><%	
				}
			}else if (questionType == 3){
				if(report.getIsCorrect() == true){
		%>			<p> You got it right! The Answer is <%= report.isAnswer() %></p><%
				}else{ %>		
					<p> You got it wrong. The Answer is <%= report.isAnswer() %></p><% 
				}	
			}else{
		%> 		<label>Nothing</label> <%
			}
		 }
		}
		%>

	</form>
</body>
</html>