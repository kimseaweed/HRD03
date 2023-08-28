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

<% 

if( request.getParameter("action")!= null && request.getParameter("action").equals("action") ){
	MemberDTO dto = new MemberDTO();
	dto.setCustno( Integer.parseInt(request.getParameter("custno") ) );
	dto.setCustname( request.getParameter("custname") );
	dto.setPhone( request.getParameter("phone") );
	dto.setAddress( request.getParameter("address") );
	dto.setJoindate( request.getParameter("joindate") );
	dto.setGrade( request.getParameter("grade") );
	dto.setCity( request.getParameter("city") );
	int result = new DAO().doUpdate(dto);	
	if(result ==1 ){out.println("<script>alert('등록이 완료되었습니다.')</script>"); }
}
int custno = Integer.parseInt(request.getParameter("custno") );
MemberDTO dto =  new DAO().getUpdate( custno );
%>

<main>

	<h3>홈쇼핑 회원수정</h3>
	<form action="updateMember.jsp" name="myform">
		<input type="hidden" name="action"value="action">
	<table border="1">
		<tr>
			<th>회원번호(자동발생)</th>
			<td> <input type="text" name="custno" id="custno" value="<%=custno%>"/> </td>
		</tr>
		<tr>
			<th>회원성명</th>
			<td> <input type="text" name="custname" id="custname"  value="<%=dto.getCustname()%>"/> </td>
		</tr>
		<tr>
			<th>회원전화</th>
			<td> <input type="text" name="phone" id="phone"  value="<%=dto.getPhone()%>"/> </td>
		</tr>
		<tr>
			<th>회원주소</th>
			<td> <input type="text" name="address" id="address" value="<%=dto.getAddress()%>"/> </td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td> <input type="text" name="joindate"  id="joindate"  value="<%=dto.getJoindate()%>"/> </td>
		</tr>
		<tr>
			<th>고객등급 [A:VIP,B:일반,C:직원]</th>
			<td> <input type="text" name="grade" id="grade" value="<%=dto.getGrade()%>"/> </td>
		</tr>
		<tr>
			<th>도시코드</th>
			<td> <input type="text" name="city" id="city"  value="<%=dto.getCity()%>"/> </td>
		</tr>
		<tr>
			<td colspan="2"> <input type="button" value="수정" onclick="submitdata()"><input type="button" value="조회" onclick="location.href='selectMember.jsp'"> </td>
		</tr>
		
	</table>
	</form>
</main>
<jsp:include page="footer.jsp"/>
</div>
<script>
function submitdata(){
	if(document.querySelector('#custno').value==""){
		alert('회원번호가 비었습니다');
		document.querySelector('#custno').focus();
	}else if(document.querySelector('#custname').value==""){
		alert('회원성명이 비었습니다');
		document.querySelector('#custname').focus();
	}else if(document.querySelector('#phone').valuee==""){
		alert('회원전화가 비었습니다');
		document.querySelector('#phone').focus();
	}else if(document.querySelector('#address').value==""){
		alert('회원주소가 비었습니다');
		document.querySelector('#address').focus();
	}else if(document.querySelector('#joindate').value==""){
		alert('가입날짜가 비었습니다');
		document.querySelector('#joindate').focus();
	}else if(document.querySelector('#grade').value==""){
		alert('고객등급이 비었습니다');
		document.querySelector('#grade').focus();
	}else if(document.querySelector('#city').value==""){
		alert('도시코드가 비었습니다');
		document.querySelector('#city').focus();
	}else{
		document.myform.submit();
	}
}
</script>
</body>
</html>