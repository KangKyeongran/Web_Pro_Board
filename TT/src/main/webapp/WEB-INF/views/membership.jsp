<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>회원가입</title>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script>
	var result="${msg}";
	if(result=="SUCCESS")
		alert("처리가 완료되었습니다");
</script>
<script type="text/javascript">

function home(){
	  self.location = "/with";
}

function checkPost(){
	window.open("checkPost","","width=500 height=500 scrollbars=yes");
}
function checkId(){
	var idReg=/^[a-z0-9]{8,15}$/g;
	
	var sid=document.form1.id.value;
	var check_id=sid.search(/[0-9]/g);
	var check_id2=sid.search(/[a-z]/ig);
	
	$.ajax({
		data:{
			id:sid
		},
	url:"checkId",
	success:function(data)
	{
		if(data==0)
		{
			if(!idReg.test(sid) ||check_id <0 || check_id2<0){
			$("#id").css("background-color","#FFCECE");
			$(".signupbtn").prop("disabled",true);
			alert("영문/숫자 포함 10~12자를 입력하세요 ");
			}
			else{
				alert("아이디 사용가능");
				$("#id").css("background-color","#B0F6AC");
				$(".signupbtn").prop("disabled",false);
			}
			
		}
		
		
		if(data==1){
			$("#id").css("background-color","#FFCECE");
			alert("이미 존재하는 아이디입니다");
			$(".signupbtn").prop("disabled",true);
		}
	}	
	});
}

function checkPwd(){
	var passReg=/[a-z0-9]{10,15}$/g;
	


	
	
	
var password=$("#pw1").val();
var repassword=$("#pw2").val();
var check_pw=password.search(/[0-9]/g);
var check_pw2=password.search(/[a-z]/ig);


if(password.length<6){
	$(".signupbtn").prop("disabled",true);
	$("#pw1").css("background-color","#FFCECE");
}
if(repassword.length<6){
	$(".signupbtn").prop("disabled",true);
	$("#pw1").css("background-color","#FFCECE");
}
if(password ==""){
	$(".signupbtn").prop("disabled",true);
	$("#pw1").css("background-color","#FFCECE");
}
else if(repassword==""){
	$(".signupbtn").prop("disabled",true);
	$("#pw2").css("background-color","#FFCECE");
}
else if(password!=repassword){
	$("#pw1").css("background-color","#FFCECE");
	$("#pw2").css("background-color","#FFCECE");
	$(".signupbtn").prop("disabled",true);
}
else if(password.length>=6 && repassword.length >=6 && password==repassword && passReg.test(password) &&check_pw >=0 && check_pw2>=0)
{
	$("#pw1").css("background-color","#B0F6AC");
	$("#pw2").css("background-color","#B0F6AC");
	$(".signupbtn").prop("disabled",false);
}

}


</script>


 <!-- <link rel="stylesheet" href="../resources/assets/css/stylemj.css"> -->
</head>
<body>


 
  <!--테이블 시작 -->
  
  <center>

 	<form id="SignUpForm"  name="form1" method="post">
         <table border="2" cellspacing="1" cellpadding="1" >
      	  <tr>
           <th>이름</th>
          <td><input type="text" name="name" required></td>
         </tr>
<!--         <tr> -->
<!--          <th>주민등록번호</th> -->
<!--          <td><input type="text" name="jumin1" required> - -->
<!--          <input type="password" name="jumin2" required></td> -->
<!--       </tr> -->
 
      <tr>
         <th>아이디</th>
         <td> <input type="text" name="id" id="id" " required><a href='#' style='cursor:pointer'></a>(영문+숫자 8~15자) 
         <input type="button" value="아이디 중복확인" onClick="checkId();"></td>
  
      </tr>

      <tr>
         <th>비밀번호</th>
         <td><input type="password" name="pw" id="pw1"  oninput="checkPwd()"  required >(영문+숫자 조합 10~15자)</td>
      </tr>
 
      <tr>
         <th>비밀번호 확인</th>
         <td><input type="password" name="pw2" id="pw2" oninput="checkPwd()"  required></td>
      </tr>

      <tr>
         <th>이메일</th>
         <td>
            <input type="text" name="fullemail" required>
          
            </td>
         </tr>

<!--          <tr> -->
<!--             <th>주소</th> -->
<!--             <td> -->
<!--                <input type="text" name="zip1" id="zip1" required> -->
<!--                <a href='#' style='cursor:hand;'> -->
<!--               	<button type='button' id="search" onClick="checkPost()">검색</button></a><br> -->
<!--                <input type="text" name="addr1" id="addr1" required size="60"><br> -->
<!--                <input type="text" name="addr2" id="addr2" required> -->
<!--             </td> -->
<!--          </tr> -->
 
<!--          <tr> -->
<!--          <th>전화번호</th> -->
<!--          <td><input type="text" name="tel1" required> -  -->
<!--             <input type="text" name="tel2" title="전화번호" required> - -->
<!--             <input type="text" name="tel3" required> -->
<!--          </td> -->
<!--       </tr> -->
 
      <tr>
         <th>핸드폰 번호</th>
         <td><input type="text" name="phone1" required> - 
            <input type="text" name="phone2" required> -
            <input type="text" name="phone3" required>
         </td>
      </tr>


   </table>
 <button type="submit" class="signupbtn" disabled="disabled" onClick="">가입하기</button>
 <button type='button' onClick="home();">취소</button>
  </form>
 </center>

  
 </body>
 
</html>


