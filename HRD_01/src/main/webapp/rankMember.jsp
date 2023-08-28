<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="dto.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
<div class="container">
<jsp:include page="header.jsp"/>
<main>
	<h3>회원매출조회</h3>
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>고객등급</th>
			<th>매출</th>
		</tr>
		<%
		List<SaleRankDTO> list = new DAO().getRank();
		for(SaleRankDTO dto : list){%>
		<tr>
			<td><%=dto.getCustno() %></td>
			<td><%=dto.getCutname() %></td>
			<td><%=dto.getGrade() %></td>
			<td><%=dto.getSale() %></td>
		</tr>
		<%} %>
	</table>
</main>
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>