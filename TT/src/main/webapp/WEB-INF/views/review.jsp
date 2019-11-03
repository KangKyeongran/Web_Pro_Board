<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>게시판 리스트</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
  <!-- jQuery 1.x.x -->  
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <link href="../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

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

#footer{width:100%; height:70px; background-image:url("../resources/assets/images/review_footer.png"); bottom:0;}
.btn-primary{background-image:url("../resources/assets/images/review_btn.png");}
</style>
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

<script>
	var result="${msg}";
	if(result=="SUCCESS")
		alert("처리가 완료되었습니다");
</script>

 <div id="header" >
     <h4>
      <a href="/with2"><img src="../resources/assets/images/logo2.png" alt="logo"></a>
     </h4>
     
        <div class="join">
	      <a href='#'><strong>${name}님</strong></a>
	      <span></span>
	      <a href='#' onclick="logout();" >로그아웃</a> 
       </div>
     </div>
  <div class="visual">
  </div>
  
<div class="box-body" style="margin-left:360px; margin-top:40px;">
	<select name="searchType">
		<option value="n"
			<c:out value="${cri.searchType == null?'selected':''}"/>>
		---</option>
		<option value="t"
			<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
		Title</option>
		<option value="c"
			<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
		Content</option>
		<option value="w"
			<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
		Writer</option>
		<option value="tc"
			<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
		Title OR Content</option>
		<option value="cw"
			<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
		Content OR Writer</option>
		<option value="tcw"
			<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
		Title OR Content OR Writer</option>
	
	</select>
	<input type="text" name="keyword" id="keywordInput" value="${cri.keyword}">
<button id="searchBtn" class='btn btn-primary'>검색</button>
<button id="newBtn" class='btn btn-primary'>글 쓰기</button>
	
</div>
<div style="width:1200px;margin:auto; margin-top:5px;">
<table class="table table-bordered">
    <colgroup>
       <col style="width:5%;" />
       <col style="width:30%;" />
       <col style="width:30%;" />
       <col style="width:30%;" />
       <col style="width:30%;" />
   </colgroup>
   <thead>
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>글쓴이</th>
      <th>날짜</th>
      <th>조회수</th>
      </tr>
   </thead>
   <tbody>
    <c:forEach items="${list2}" var="boardVO">
		<tr>
			<td>${boardVO.bno}</td>
			<td><a href='/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&bno=${boardVO.bno}&id=${id}'>${boardVO.title}
			<strong>[${boardVO.replycnt }]</strong></a></td>
			<td>${boardVO.writer}</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${boardVO.regdate}" /></td>
			<td><span class="badge bg-red">${boardVO.viewcnt}</span></td>
		</tr>
	</c:forEach>
   </tbody>
</table>
</div>
<div class="text-center">
	<ul class="pagination">
		
		<c:if test="${pageMaker.prev }">
			<li>
			<a href="${pageMaker.makeSearch(pageMaker.startPage -1)}">&laquo;</a></li>
		</c:if>
		
		<c:forEach begin="${pageMaker.startPage}"
		end="${pageMaker.endPage }" var="idx">
			<li
			<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
			<a href="${pageMaker.makeSearch(idx)}">${idx }</a>
			</li>
		</c:forEach>
		
		<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			<li><a href="${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
		</c:if>
	</ul>
</div>
<form id="jobForm">
	<input type="hidden" name="page" value=${pageMaker.cri.page}>
	<input type="hidden" name="perPageNum" value=${pageMaker.cri.perPageNum}>
	<input type="hidden" name="id" value="${id}">
</form>
<div id="footer"></div>

<script type="text/javascript">
${".pagination li a"}.on("click",function(event){
	event.preventDefault();
	
	var targetPage= $(this).attr("href");
	
	var jobForm = $("#jobForm");
	
	jobForm.find("[name='page']").val(targetPage);
	jobForm.attr("action","/review").attr("method","get");
	jobForm.submit();
	
});

</script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#searchBtn').on("click",function(event){
		self.location=""
		+ '${pageMaker.makeQuery(1)}'
		+ "&searchType="
		+ $("select option:selected").val()
		+ "&keyword=" + $('#keywordInput').val();
	});
	
	$('#newBtn').on("click",function(evt){
		self.location="/register";
	});
});
</script>
</body>
</html>