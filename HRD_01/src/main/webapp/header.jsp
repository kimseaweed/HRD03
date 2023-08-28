<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
*{ margin:0;padding:0; }
	body{
		background-color: lightgray;
	}
	header>.hero{
		background-color: blue;
		text-align: center;
	}
	header>nav{
		background-color: skyblue;
	}
	header>nav>ul{
		display: flex;
	}
	header>nav>ul>li{
		list-style: none;
		padding:5px 10px;
	}
	header>nav>ul>li>a{
		text-decoration: none;
	}
	footer{
		width:100%;
		position:absolute;
		bottom:0px;
		background-color: blue;
	}
	h3 {
	text-align: center;
}
</style>
</head>
<body>
<header>
<div class="hero"> <h1>쇼핑몰 회원관리 ver 1.0</h1> </div>
<nav> <ul>  
<li> <a href="insertMember.jsp" >회원등록</a> </li>
<li> <a href="selectMember.jsp" >회원목록조회/수정</a> </li>
<li> <a href="rankMember.jsp" >회원매출조회</a> </li>
<li> <a href="index.jsp" >홈으로</a> </li>
</ul> </nav>
</header>
</body>
</html>