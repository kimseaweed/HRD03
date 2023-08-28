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
<h3>회원목록조회/수정</h3>
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>회원성명</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>가입일자</th>
			<th>고객등급</th>
			<th>거주지역</th>
		</tr>
		<% 
		List<MemberDTO> list = new DAO().getList();
		for(MemberDTO dto : list){
		%>
		<tr>
			<td><a href="updateMember.jsp?custno=<%=dto.getCustno() %>"><%=dto.getCustno()%></a></td>
			<td><%=dto.getCustname() %></td>
			<td><%=dto.getPhone() %></td>
			<td><%=dto.getAddress() %></td>
			<td><%=dto.getJoindate() %></td>
			<td><%=dto.getGrade() %></td>
			<td><%=dto.getCity() %></td>
		</tr>		
		<%} %>
	</table>
</main>
<jsp:include page="footer.jsp"/>
</div>
</body>
</html>