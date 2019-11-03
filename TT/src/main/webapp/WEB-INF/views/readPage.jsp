<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세 보기</title>

<script type="text/javascript" src="../resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
 
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../resources/assets/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>

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

#header .join{width:150px; height:30px; line-height:30px; position:absolute; top:25px; right:50px; border:1px solid rgba(0, 0, 0, 0.3); border-radius:40px; text-align:center; font-size:12px; font-weight:700;}
#header .join a{position:relative; color:rgba(0, 0, 0, 0.5);}
#header .join span{width:1px; height:10px; line-height:10px; background:rgba(0, 0, 0, 0.5); position:relative; margin:0 8px; display:inline-block; vertical-align:middle; top:-1px;}

.visual{width:100%; min-height:400px; overflow:hidden; padding:80px 0 0 0; background-image:url("../resources/assets/images/review1.jpg"); background-size:100% 100%;}

.login_wrap{width:500px; height:92px; float:left; overflow:hidden;}
.login_wrap>label{width:600px; height:46px; float:left;}
.login_wrap>label>p{width:120px; height:46px; float:left;}
.login_wrap>label>input{width:358px; height:40px; float:left; margin-left:18px; }
.login_bt{width:128px; height:10px; float:left; margin-left:12px;}
.login_wrap img{float:left; display:block; }
.total_wrap{width:650px; height:100px; margin:auto; margin-top:29.5%;}

#footer{width:100%; height:70px; background:gold;  bottom:0;}
.but{
background-color:  #008CBA; /* Green */
    border: none;
    color: white;
    padding: 10px 16px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
}

</style>
			<style type="text/css">
			.popup {position:absolute;}
			.back {background-color: gray; opacity:0.5; width: 100%; height: 300%;
					overflow:hidden; z-index:1101;}
			.front {
				z-index:1110; opacity:1; boarder:1px; margin:auto;
			}
			.show{
				position:relative;
				max-width:1200px;
				max-height:800px;
				overflow:auto;
			}
</style>
<script type="text/javascript">
$(document).ready(function(){

	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$("#modifyBtn").on("click", function(){
		formObj.attr("action", "/modifyPage");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
/* 	$("#removeBtn").on("click", function(){
		formObj.attr("action", "/sboard/removePage");
		formObj.submit();
	}); */

	
	$("#removeBtn").on("click", function(){
		
		var replyCnt =  $("#replycntSmall").html();
		
		
		
		var arr = [];
		$(".uploadedList li").each(function(index){
			 arr.push($(this).attr("data-src"));
		});
		
		console.log(arr);
	 	if(arr.length > 0){
			$.post("/deleteAllFiles",{files:arr}, function(){
				
				formObj.attr("action", "/removePage");
				formObj.submit();
				
			});
		}else{
			
			formObj.attr("action", "/removePage");
			formObj.submit();
		}
		
	 	/*
		formObj.attr("action", "/sboard/removePage");
		formObj.submit();
		 */
	});	
	$("#goListBtn ").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/review");
		formObj.submit();
	});
	
});
</script>
 <script type="text/javascript">
  var name="${name}";
 if(name=="" || name==null){logout();}
function logout(){
	location.href="/Logout";
}
var id="${id}"; 
</script>
<script type='text/javascript'>

</script>
</head>
<body>


<div id="header" >
     <h4>
      <a href="/with2"><img src="../resources/assets/images/logo2.png" alt="logo"></a>
     </h4>
     <!-- <ul class="gnb">
      <li id='tour2' style='display:none;'>
        <a href="/information/" >여행지 명소</a>
      </li>
      <li id='tour3' style='display:none;'>
        <a href="/food/" >여행지 맛집</a>
      </li> 
      <li id='tour'>
        <a href="#"  onClick="show_detail();">여행지 정보</a>
      </li>
      <li>
        <a href="/together/">동행</a>
      </li>
      <li>
        <a href="/review/">여행 후기</a>
      </li>
      <li>
        <a href="/follow_route" >오시는 길</a>
      </li>
      <li>
        <a href="/help/" >고객 센터</a>
      </li>
     
     </ul> -->
        <div class="join">
	      <a href='#'><strong>${name}님</strong></a>
	      <span></span>
	      <a href='#' onclick="logout();" >로그아웃</a> 
       </div>
     </div>
  <div class="visual">
  </div>
<div class='popup back' style="display:none;"></div>
	<div id="popup_front" class='popup front' style="display:none;">
	<img id="popup_img">
</div>

<form role="form" method="post" action="modifyPage">
	<input type="hidden" name="bno" value="${boardVO.bno }">
	<input type="hidden" name="page" value="${cri.page }">
	<input type="hidden" name="perPageNum" value="${cri.perPageNum }">
	<input type="hidden" name="searchType" value="${cri.searchType }">
	<input type="hidden" name="keyword" value="${cri.keyword }">
</form>


<div class="box-body" style="padding:50px">
	<div class="form-group">
		<label for="exampleInputEmail1">제목</label> <input type="text" 
		name="title" class="form-control" value="${boardVO.title }"
		 readonly="readonly">
	</div>
	<div class="form-group">
		<label for="exampleInputPassword1">내용</label>
		<textarea class="form-control" name="content" rows="3" readonly="readonly">${boardVO.content}</textarea>
	</div>
	<div class="form-group">
		<label for="exampleInputEmail1">글쓴이</label>
		<input type="text" name="writer" class="form-control" value="${boardVO.writer }"
		readonly="readonly">
	</div>
</div>

<div class="box-footer" style="border-top:none; padding:50px; margin-top:-50px;">

 	<div><hr></div>

    <ul class="mailbox-attachments clearfix uploadedList" style="margin-bottom:40px;">
    </ul>
       <script>
     if("${boardVO.writer}"=="${name}"){
		document.write("<button type='submit' class='btn btn-warning' id='modifyBtn'>수정</button>");
		document.write("<button type='submit' class='btn btn-danger' id='removeBtn' style='margin-left:5px;'>삭제</button>");
		document.write("<button type='submit' class='btn btn-primary' id='goListBtn' style='margin-left:5px;'>목록</button>");
    }
    else
    {
    	document.write("<button type='submit' class='btn btn-primary' id='goListBtn' style='margin-left:50px;'>목록</button>");

    }	
	</script>
</div>

<div id="modifyModal" class="modal modal-primary fade" role="dialog">
	<div class="modal-dialog">
		
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body" data-rno>
				<p><input type="text" id="replytext" class="form-control"></p>
			</div>
			<div class="modal-footer">
			
				<button type="button" class="btn btn-info" id="replyModBtn">수정</button>
				<button type="button" class="btn btn-danger" id="replyDelBtn">삭제</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<div class="row" style="padding:50px;">
	<div class="col-md-12">
		<div class="box box-success">
			<h3 class="box-title">댓글 달기</h3>
		</div>
		<div class="box-body">
			<label for="exampleInputEmail1">글쓴이</label>
			
			<input class="form-control" type="text" placeholder="USER ID" id="newReplyWriter" value="${name}" readonly> 
 			<label for="exampleInputEmail1">내용</label>
			<input class="form-control" type="text" placeholder="Reply TEXT" id="newReplyText">
		</div>
		<div class="box-footer">
			<button type="submit" class="but" id="replyAddBtn">등록</button>
		</div>
	</div>
</div>

<ul class="timeline" style="margin-left:50px;">
	<li class="time-label" id="repliesDiv"><span class="bg-green">
	 댓글 목록<small id="replycntSmall">[${boardVO.replycnt }]</small></span></li>
</ul>
<div class="text-center">
	<ul id="pagination" class="pagination pagination-sm no-margin">
	
	</ul>
</div>



<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{rno}}>
<i class="fa fa-comments bg-blue"></i>
	<div class="timeline-item">
	<span class="time">
		<i class="fa fa-clock-o"></i>{{prettifyDate regdate}}
	</span>
	<h3 class="timeline-header"><strong>{{rno}}</strong> -{{replyer}}</h3>
	<div class="timeline-body">{{replytext}} </div>
		<div class="timeline-footer">
		<a id={{rno}} class="btn btn-primary btn-xs"
		data-toggle="modal" data-target="#modifyModal">Modify</a>
	</div>
</div>
</li>
{{/each}}

</script>

<script id="templateAttach" type="text/x-handlebars-template">
<li data-src='{{fullName}}'>
	<span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}"
alt="Attachment"></span>
	<div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
</span>
</div>
</li>
</script>

<script>


Handlebars.registerHelper("prettifyDate",function(timeValue){
	var dateObj= new Date();
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth() +1;
	var date = dateObj.getDate();
	return year +"/"+month+"/"+date;
});


var printData = function(replyArr,target,templateObject){
	console.log(replyArr);
	var template = Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	$(".replyLi").remove();
	target.after(html);
	for (var i = 0; i < replyArr.length; i++)
	{
		if ("${name}" != replyArr[i].replyer){
			$("#2").css("display","none")
			$("#"+replyArr[i].rno).css("display","none");
		}
	} 
}

var bno = ${boardVO.bno};
var replyPage= 1;

function getPage(pageInfo){
	$.getJSON(pageInfo,function(data){
		printData(data.list,$("#repliesDiv"),$("#template"));
		printPaging(data.pageMaker,$(".pagination"));
		$("#modifyModal").modal('hide');
		$("#replycntSmall").html("[ " +data.pageMaker.totalCount +" ]");
	});
}

var printPaging= function(pageMaker,target){
	
	var str="";
	if(pageMaker.prev){
		str+= "<li><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
	}
	for(var i=pageMaker.startPage,len=pageMaker.endPage;i<=len;i++)
		{
		var strClass= pageMaker.cri.page==i?'class=active':'';
		str+="<li "+strClass+"><a href='"+i+"'>"+i+"</a></li>";
		}
	if(pageMaker.next){
		str+="<li><a href='"+(pageMaker.endPage +1)+"'> >> </a></li>";
	}
	target.html(str);
};

$("#repliesDiv").on("click",function(){
	
	if($(".timeline li").size() >1){
		return;
	}
	getPage("/replies/"+bno+"/1");
});

$(".pagination").on("click","li a",function(event){
	event.preventDefault();
	replyPage =$(this).attr("href");
	getPage("/replies/"+bno+"/"+replyPage);
});

$("#replyAddBtn").on("click",function(){
	
	var replyerObj = $("#newReplyWriter");
	var replytextObj = $("#newReplyText");
	var replyer = replyerObj.val();
	var replytext= replytextObj.val();
	$.ajax({
		type:'post',
		url:'/replies/',
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"},
		dataType:'text',
		processData:false,
		data: JSON.stringify({bno:bno,replyer:replyer,replytext:replytext}),
		success:function(result){
			console.log("result: "+result);
			if(result == 'SUCCESS'){
				alert("등록 되었습니다.");
				replyPage=1;
				getPage("/replies/"+bno+"/"+replyPage);
				replytextObj.val("");
			}
		
		}});
});

$(".timeline").on("click",".replyLi",function(event){
	
	var reply=$(this);
	
	$("#replytext").val(reply.find('.timeline-body').text());
	$(".modal-title").html(reply.attr("data-rno"));
});

$("#replyModBtn").on("click",function(){
	
	var rno = $(".modal-title").html();
	var replytext=$("#replytext").val();
	
	$.ajax({
		type:'put',
		url:'/replies/'+rno,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"PUT"},
		dataType:'text',
		processData:false,
		data: JSON.stringify({replytext:replytext}),
		success:function(result){
			console.log("result: "+result);
			if(result == 'SUCCESS'){
				alert("수정 되었습니다.");
				getPage("/replies/"+bno+"/"+replyPage);
				
			}
		
		}});
});

$("#replyDelBtn").on("click",function(){
	
	var rno = $(".modal-title").html();
	var replytext=$("#replytext").val();
	
	$.ajax({
		type:'delete',
		url:'/replies/'+rno,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"DELETE"},
		dataType:'text',
		processData:false,
		success:function(result){
			console.log("result: "+result);
			if(result == 'SUCCESS'){
				alert("삭제 되었습니다.");
				getPage("/replies/"+bno+"/"+replyPage);
				
			}
		
		}});
});


</script>
<script>
var bno =${boardVO.bno};
var template = Handlebars.compile($("#templateAttach").html());

$.getJSON("/getAttach/"+bno,function(list){
	$(list).each(function(){
		var fileInfo = getFileInfo(this);
		var html = template(fileInfo);
		
		$(".uploadedList").append(html);
	})
})

$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
		
		var fileLink = $(this).attr("href");
		
		if(checkImageType(fileLink)){
			
			event.preventDefault();
					
			var imgTag = $("#popup_img");
			imgTag.attr("src", fileLink);
			
			console.log(imgTag.attr("src"));
					
			$(".popup").show('slow');
			imgTag.addClass("show");		
		}	
	});
	
	$("#popup_img").on("click", function(){
		
		$(".popup").hide('slow');
		
	});	
	


</script>

<%@include file="footer.jsp" %>

</body>
</html>