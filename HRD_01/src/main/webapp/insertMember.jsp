<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "dto.*" %>
 <%@ page import = "dao.*" %>
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
<% 

if( request.getParameter("action")!= null && request.getParameter("action").equals("action") ){
	MemberDTO dto = new MemberDTO();
	dto.setCustno( Integer.parseInt( request.getParameter("custno")) );
	dto.setCustname( request.getParameter("custname") );
	dto.setPhone( request.getParameter("phone") );
	dto.setAddress( request.getParameter("address") );
	dto.setJoindate( request.getParameter("joindate") );
	dto.setGrade( request.getParameter("grade") );
	dto.setCity( request.getParameter("city") );
	int result = new DAO().insert(dto);	
	if(result ==1 ){out.println("<script>alert('등록이 완료되었습니다.')</script>"); }
}

int nextval = new DAO().getNext();	
	%>
	
	<h3>홈쇼핑 회원등록</h3>
	<form action="insertMember.jsp" name="myform">
	<table border="1">
		<tr>
			<th>회원번호(자동발생)</th>
			<td> <input name="custno" type="text" value="<%=nextval%>"/> </td>
		</tr>
		<tr>
			<th>회원성명</th>
			<td> <input name="custname" type="text"/> </td>
		</tr>
		<tr>
			<th>회원전화</th>
			<td> <input name="phone" type="text"/> </td>
		</tr>
		<tr>
			<th>회원주소</th>
			<td> <input name="address" type="text"/> </td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td> <input name="joindate" type="text"/> </td>
		</tr>
		<tr>
			<th>고객등급 [A:VIP,B:일반,C:직원]</th>
			<td> <input name="grade" type="text"/> </td>
		</tr>
		<tr>
			<th>도시코드</th>
			<td> <input name="city" type="text"/> <input type="hidden" name="action" value="action"/> </td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="등록" onclick="submitdata()"><input type="button" value="조회" onclick="location.href='selectMember.jsp'">  </td>
		</tr>
	</table>
	</form>
</main>
<jsp:include page="footer.jsp"/>
</div>
<script>
function submitdata(){
	if(document.myform.custno.value==""){
		alert('회원번호가 비었습니다');
		document.myform.custno.focus();
	}else if(document.myform.custname.value==""){
		alert('회원성명이 비었습니다');
		document.myform.custname.focus();
	}else if(document.myform.phone.value==""){
		alert('회원전화가 비었습니다');
		document.myform.phone.focus();
	}else if(document.myform.address.value==""){
		alert('회원주소가 비었습니다');
		document.myform.address.focus();
	}else if(document.myform.joindate.value==""){
		alert('가입날짜가 비었습니다');
		document.myform.joindate.focus();
	}else if(document.myform.grade.value==""){
		alert('고객등급이 비었습니다');
		document.myform.grade.focus();
	}else if(document.myform.city.value==""){
		alert('도시코드가 비었습니다');
		document.myform.city.focus();
	}else{
		document.myform.submit();
	}
}
</script>
</body>
</html>