<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <!-- jQuery 1.x.x -->  
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<title>Login</title>
<style>
#header{width:100%; height:80px; background:#fff; position:fixed; top:0; overflow:hidden; z-index:9999;}
#header h4{width:146px; height:40px; position:absolute; top:20px; left:50px;}
#header .gnb{margin:0 auto; text-align:center; overflow:hidden;}
#header .gnb li{margin:0 25px; display:inline-block;}
#header .gnb li a{height:80px; line-height:80px; display:block; font-weight:700; font-size:15px; letter-spacing:2px; position:relative; color:#333;}
#header .gnb li a:before {content:''; width:0; height:2px; background:orange; position:absolute; left:50%; bottom:0;
    -webkit-transition: all 0.3s ease-out;
    -moz-transition: all 0.3s ease-out;
    -o-transition: all 0.3s ease-out;
    transition: all 0.3s ease-out;
}
#header .gnb li a:hover {color:orange; text-decoration:none;}
#header .gnb li a:hover:before {width:100%;left:0;}

#header .join{width:120px; height:30px; line-height:30px; position:absolute; top:25px; right:50px; border:1px solid rgba(0, 0, 0, 0.3); border-radius:30px; text-align:center; font-size:12px; font-weight:700;}
#header .join a{position:relative; color:rgba(0, 0, 0, 0.5);}
#header .join span{width:1px; height:10px; line-height:10px; background:rgba(0, 0, 0, 0.5); position:relative; margin:0 8px; display:inline-block; vertical-align:middle; top:-1px;}

.con{width:100%; height:100vh; min-height:700px; overflow:hidden; padding:80px 0 0 0; background-image:url("../resources/assets/images/login.png"); background-size:cover;}

.login_wrap{width:500px; height:92px; float:left; overflow:hidden;}
.login_wrap>label{width:600px; height:46px; float:left;}
.login_wrap>label>p{width:120px; height:46px; float:left;}
.login_wrap>label>input{width:358px; height:40px; float:left; margin-left:18px; }
.login_bt{width:128px; height:10px; float:left; margin-left:12px;}
.login_wrap img{float:left; display:block; }
.total_wrap{width:650px; height:100px; margin:auto; margin-top:29.5%;}

#footer{width:100%; height:70px; background:gold;}

.butt2:hover{
background-color: white;
   color: black;
   border: 2px solid #f44336;
    text-align: center;
   display: inline-block;
}

</style>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script>
   var result="${msg}";
   if(result=="SUCCESS")
      alert("처리가 완료되었습니다");
</script>
<script type='text/javascript'>
</script>
<script type="text/javascript">

function checkLogin(){
   var sid=document.form1.id.value;
   var spw=document.form1.pw.value;
   
   if(sid==""){
      alert("아이디를 입력해주세요.");
   }else if(spw==""){
      alert("비밀번호를 입력해주세요.");
   }
   
    if(sid!="" && spw!=""){
   $.ajax({
      data:{
         id:sid,
         pw:spw
      },
   url:"/membership/checkLogin",
   success:function(data)
   {
      
      if(data==0){
         alert("존재하지 않는 아이디입니다.");
      }
      if(data==1){
         alert("잘못된 비밀번호입니다");
      }
      if(data==2){
         location.href="/membership/welcome3";
      }
      
   }   
   });
    }
}


   


</script>


 <!-- <link rel="stylesheet" href="../resources/assets/css/stylemj.css"> -->
</head>
<body>
 <div id="header">
     <h4>
      <a href="/with"><img src="../resources/assets/images/logo2.png" alt="logo"></a>
     </h4>
        <div class="join">
      <a href="/">Login</a>
      <span></span>
      <a href="/membership/member" onClick="window.open(this.href,'회원가입','width=700,height=245'); return false;">Join</a>
     </div>
     </div>
  <div class="con">
  
<!--   
 <div class="login" style=" margin-left:650px; margin-top:480px;position:relative;"> 
<form id="SignUpForm"  name="form1" method="post">

    <table cellspacing="1" cellpadding="1">
   	<div class="input_wrap">
      <tr>
         <th><img src="../resources/assets/images/id.png"></th>
         <td><input type="text" name="id" id="id"  required><a href='#' style='cursor:pointer'></a>        
      </tr>

      <tr>
         <th><img src="../resources/assets/images/password.png"></th>
         <td><input type="password" name="pw" id="pw" required ></td>
      </tr>
      </div>
		<div class="login_bt"> <a onClick="checkLogin();"><img src="../resources/assets/images/loginlogo.png" ></a>
	</div>
   </table>
   </form>
  </div>
-->  
	<form id="SignUpForm"  name="form1" method="post">
	<div class="total_wrap">
		<div class="login_wrap">
			<label>
				<p><img src="../resources/assets/images/id.png"></p>
				<input type="text" name="id" id="id"  required>
			</label>
			<label>
				<p id='pw'><img src="../resources/assets/images/password.png"></p>
				<input type="password" name="pw" id="pw" required >
			</label>
		</div>
		<a onClick="checkLogin();" class="login_bt"><img src="../resources/assets/images/loginlogo.png" ></a>
	</div>
	</form>
  
  
  
  
  
</div>
     
      <!--테이블 시작 -->

 
 
   <div id="footer">
      </div>
      
 

   
 </body>
</html>

