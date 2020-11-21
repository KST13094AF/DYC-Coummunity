<%@page import="kr.ac.doungyang.Community.model.bbs.bbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% 
	String id = (String)session.getAttribute("userId");
	bbsDto bDto = (bbsDto)request.getAttribute("bbsRead");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>메인</title>
<link href="${pageContext.request.contextPath}/resources/plugins/summernote/dist/summernote.css" rel="stylesheet">

<%@ include file="css.jsp"%>
</head>
<body>
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"stroke-width="3" stroke-miterlimit="10" />
            </svg>
		</div>
	</div>
	<div id="main-wrapper" class="show">
		<%@ include file="navbar.jsp"%>
		<%@ include file="sidebar.jsp"%>
		<div class="content-body" style="padding: 0rem 0.5rem">
			<div class="container-fluid" style="padding: 0rem">
				<div class="row page-titles mx-0" style="margin: 0rem">
					<div class="col p-md-0">
						<ol class="breadcrumb">
							<li class="breadcrumb-item">게시판</li>
							<li class="breadcrumb-item active">${bbsRead.major}</li>
							<li class="breadcrumb-item active"><b>유저 게시물</b></li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
                            <div class="p-4">
                                    <div class="media align-items-center">
                                    	<img class="mr-4" src="${pageContext.request.contextPath}/profile/${user.profile}" width="80" height="80" alt="">
                                    <div class="media-body">
                                        <span class="mb-0 h4">${bbsRead.id }</span>
                                        <c:choose>
                                        	<c:when test="${user.maner < 10}">
                                       	 		<span style="color:gray" class="ml-2">(일반유저)</span>
                                        	</c:when>
                                        	<c:when test="${user.maner >= 10 and user.maner < 20}">
                                       	 		<span style="color:blue" class="ml-2">(매너유저)</span>
                                        	</c:when>
                                        	<c:when test="${user.maner >= 30}">
                                       	 		<span style="color:tomato" class="ml-2">(인증유저)</span>
                                        	</c:when>
                                        </c:choose>
                                        <p class="text-muted mb-3">${user.major}</p>
                                        <p>
                                       		<a href="javascript:void();" onclick="userRecomm();" class="btn btn-rounded btn-success">유저추천</a>
                                       		<a href="javascript:void();" onclick="userDisRecomm();" class="btn ml-3 btn-rounded btn-danger">유저비추천</a>
                                        </p>
                                        <p style="margin:0rem">
                                        	<span class="mr-3">분류: ${bbsRead.classType }</span>
                                        	<span class="mr-3">작성일: <fmt:formatDate value="${bbsRead.date}" pattern="yyyy-MM-dd HH:mm"/></span>
                                       		<span class="mr-3">추천: ${bbsRead.recomm}</span>
                                       		<span class="mr-3">비추천: ${bbsRead.dis}</span>
                                       		<span class="mr-3">댓글: ${bbsRead.comments}</span>
                                       		<span>조회수: ${bbsRead.lookup}</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        <div class="col-lg-12">
                        	<div class="card border-primary">
                        		<div class="card-header">
                        		<c:if test="${pre != 0}">
                        			<a href="bbsRead.do?number=${pre}" class="btn mb-1 mr-2 btn-primary btn-xs">이전글</a>
                        		</c:if>
                        		<c:if test="${next != 0}">
                        			<a href="bbsRead.do?number=${next}" class="btn mb-1 btn-primary btn-xs">다음글</a>
                        		</c:if>
                        		</div>
                                    <div class="card-body">
                                        <h3 class="card mb-5"><b>${bbsRead.title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "")}</b></h3>
                                        <p class="card-text">${bbsRead.content}</p>
                                        <p class="text-center">
                                       		<a href="javascript:void()" onclick="recomm();" class="btn mr-3 btn-rounded btn-outline-success">추천 ${bbsRead.recomm}</a>
                                       		<a href="javascript:void()" onclick="disrecomm();" class="btn btn-rounded btn-outline-danger">비추천 ${bbsRead.dis}</a>
                                        </p>
                               		<p class="login-form__footer text-right mb-0">
                               			<c:choose>
                               				<c:when test="${bbsRead.id eq userId}">
                             					<a href="#" onclick="del();" class="btn btn-secondary">삭제</a>
                             					<a href="bbsUpdate.do?number=${bbsRead.num}" class="btn btn-warning">수정</a>
                             					<a href="write.do?major=${bbsRead.major}" class="btn btn-success">글쓰기</a>
                             				</c:when>
                             				<c:otherwise>
                             					<a href="write.do?major=${bbsRead.major}" class="btn btn-success">글쓰기</a>
                             				</c:otherwise>
                                		</c:choose>
                                	</p>
                          		</div>
                                <div class="card-footer">
                        			<p>댓글 ${bbsRead.comments}개</p>
                        			 <div class="dd">
                        			 <c:if test="${comment != null}">
                                     <ol class="pl-2">
                        			 	<c:if test="${bestComment != null}">
                                             <li class="mb-2" data-id="1">
                                             <hr class="mt-1 mb-2" style="border-color:tomato;">
                                             <span style="color:tomato;"><b>베스트 댓글</b></span>
                                                    <div><b>${bestComment.id}</b>
                                                    <span class="ml-1">[<fmt:formatDate value="${bestComment.date}" pattern="yyyy-MM-dd HH:mm" />]</span>
                                                    <c:choose>
                                                  	 	<c:when test="${bestComment.id eq userId}">
                                                 	   		<span class="ml-3">
                                                 	   			<a href="commentRecomm.do?number=${bbsRead.num}&commentId=${bestComment.num}&recomm=5" class="badge badge-primary">
                                                    			추천 ${bestComment.recomm}</a>
                                                    			<button type="button" onclick="Recommupdate(${bestComment.num});" class="badge badge-warning border-0">수정</button>
                                                    			<button type="button" onclick="RecommDel(${bestComment.num});" class="badge badge-secondary border-0">삭제</button>	
                                                    		</span> 
                                                    	</c:when>
                                                    	<c:otherwise>
                                                    		<span class="ml-3">
                                                    			<a href="commentRecomm.do?number=${bbsRead.num}&commentId=${bestComment.num}&recomm=5" class="badge badge-primary">
                                                    				추천  ${bestComment.recomm}</a>
                                                    			<button type="button"  onclick="recommReport();" class="badge badge-danger border-0">신고</button>
                                                    		</span> 
                                                    	</c:otherwise>
                                                    </c:choose>
                                                    <br>
                                                    	<div style="background: antiquewhite;" class="mt-1">
                                                    		<span style="color:tomato">${bestComment.contents.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "")}</span>
                                                    	</div>
                                                    </div>
                                                </li>
                                                <hr class="mt-1 mb-4" style="border-color:tomato;">
                                            </c:if>
		                                    <div id="accordion-two" class="accordion">
                                            <c:forEach var="list" items="${comment}">
                                            	<c:if test="${list.parent == -1}">
                                                <li class="mb-2" data-id="1">
                                                    <div><b>${list.id}</b>
                                                    <span class="ml-1">[<fmt:formatDate value="${list.date}" pattern="yy-MM-dd HH:mm" />]</span>
                                                    <c:choose>
                                                  	 	<c:when test="${list.id eq userId}">
                                                 	   		<span class="ml-3">
                                                 	   			<a href="commentRecomm.do?number=${bbsRead.num}&commentId=${list.num}&recomm=5" class="badge badge-primary">
                                                    			추천 ${list.recomm}</a>
                                                    			<button type="button" onclick="Recommupdate(${list.num});" class="badge badge-warning border-0">수정</button>
                                                    			<button type="button" onclick="RecommDel(${list.num});" class="badge badge-dark border-0">삭제</button>
                                                    			<button type="button"  class="badge badge-secondary border-0" data-toggle="collapse" 
                                                    			data-target="#list${list.num}" aria-expanded="true" aria-controls="collapseOne">답글</button>	
                                                    		</span> 
                                                    	</c:when>
                                                    	<c:otherwise>
                                                    		<span class="ml-3">
                                                    			<a href="commentRecomm.do?number=${bbsRead.num}&commentId=${list.num}&recomm=5" class="badge badge-primary">
                                                    				추천 ${list.recomm }</a>
                                                    			<button type="button"  onclick="recommReport();" class="badge badge-danger border-0">신고</button>
                                                    			<button type="button"  class="badge badge-secondary border-0" data-toggle="collapse" 
                                                    			data-target="#list${list.num}" aria-expanded="true" aria-controls="collapseOne1">답글</button>	
                                                    		</span> 
                                                    	</c:otherwise>
                                                    </c:choose>
                                                    <br>
                                                    	<div style="background: aliceblue;" class="mt-1">
                                                    	<c:if test="${list.recomm < 10}">
                                                    		<span> ${list.contents.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "")}</span>
                                                    	</c:if>
                                                    	<c:if test="${list.recomm >= 10 }">
                                                    		<span style="color:tomato"> ${list.contents.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "")}</span>
                                                    	</c:if>
                                                    	</div>
	                                                    <!-- 답글 아코디언 -->
                                                    		<div class="login-form__footer text-right mb-0 collapse" id="list${list.num}" data-parent="#accordion-two">
                        										<form action="comment.do" class="text-left" method="post">
                        											<div class="mb-1"><img src="${pageContext.request.contextPath}/resources/images/arrow2.png" style="width:1.2rem"/>
                        											 <b>답글작성</b></div>
                        												<input type="hidden" name="number" value="${bbsRead.num}">
                        												<input type="hidden" name="bbsid" value="${bbsRead.id}">
                        												<input type="hidden" name="parent" value="${list.num}">
                        											<div class="input-group mb-3">
                                           	 							<input name="content" size="30" type="text" required class="form-control input-default">
                                           	 						<div class="input-group-append">
                                               	 						<input type="submit" class="btn btn-outline-info" value="작성하기">
                                            						</div>
                                        							</div>
                        										</form>
                        									</div>
                                                    	</div>
                                               	 	</li>
                                               	 	</c:if>
                                               	 	<!-- 대댓글 -->
                                               	 	 <c:forEach var="list2" items="${comment}">
                                               	 	 <c:if test="${list2.parent != -1 and list.num == list2.parent}">
                                               	 	<li class="ml-3 mb-2" data-id="1">
                                               	 	
                                                    <div><img src="${pageContext.request.contextPath}/resources/images/arrow2.png" style="width:1.2rem"/> <b>${list2.id}</b>
                                                    <span class="ml-1">[<fmt:formatDate value="${list2.date}" pattern="yy-MM-dd HH:mm" />]</span>
                                                    <c:choose>
                                                  	 	<c:when test="${list2.id eq userId}">
                                                 	   		<span class="ml-3">
                                                 	   			<a href="commentRecomm.do?number=${bbsRead.num}&commentId=${list2.num}&recomm=5" class="badge badge-primary">
                                                    			추천 ${list2.recomm}</a>
                                                    			<button type="button" onclick="Recommupdate(${list2.num});" class="badge badge-warning border-0">수정</button>
                                                    			<button type="button" onclick="RecommDel(${list2.num});" class="badge badge-dark border-0">삭제</button>
                                                    		</span> 
                                                    	</c:when>
                                                    	<c:otherwise>
                                                    		<span class="ml-3">
                                                    			<a href="commentRecomm.do?number=${bbsRead.num}&commentId=${list2.num}&recomm=5" class="badge badge-primary">
                                                    				추천 ${list2.recomm }</a>
                                                    			<button type="button"  onclick="recommReport();" class="badge badge-danger border-0">신고</button>
                                                    		</span> 
                                                    	</c:otherwise>
                                                    </c:choose>
                                                   	<br>
                                                    	<div style="background: lavender;" class="mt-1">
                                                    		<c:if test="${list2.recomm < 10}">
                                                    			<span> ${list2.contents.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "")}</span>
                                                    		</c:if>
                                                    		<c:if test="${list2.recomm >= 10 }">
                                                    			<span style="color:tomato"> ${list2.contents.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "")}</span>
                                                    		</c:if>
                                                    		</div>
                                                    	</div>
                                               	 	</li>
                                               	 	</c:if>
                                               	 	</c:forEach>
                                               	 	<!-- 대댓긋 -->
                                           		</c:forEach>
                                            	</div>
                                            </ol>
                                        </c:if>
                                        <hr class="mt-1 mb-2">
                                        </div>
                        				<div class="login-form__footer text-right mb-0">
                        					<form action="comment.do" class="text-left" method="post">
                        						<div class="mb-1">댓글작성</div>
                        						<input type="hidden" name="number" value="${bbsRead.num}">
                        						<input type="hidden" name="bbsid" value="${bbsRead.id}">
                        						<div class="input-group mb-3">
                                           	 	<input name="content" size="30" type="text" required class="form-control input-default">
                                           	 	<div class="input-group-append">
                                               	 	<input type="submit" class="btn btn-outline-info" value="작성하기">
                                            	</div>
                                        	</div>
                        				</form>
                        			</div>
                                </div>
                       		</div>
                   		</div>
                	</div>
				</div>
		</div>
		<div class="footer">
			<div class="copyright">
				<p>	DoungYangCommunity ver 0.1(2020/08/17) <br>
					Copyright &copy; Designed & Developed by <a
						href="javascript:void(0);">newyour1964@naver.com</a> 2020
				</p>
			</div>
		</div>
	</div>
	<%@ include file="js.jsp"%>
<script>
function Recommupdate(id){
	swal({
		  title: "댓글 수정",
		  text: "수정할 댓글을 써주세요!",
		  type: "input",
		  showCancelButton: true,
		  closeOnConfirm: false,
		  confirmButtonText: "수정 하기",
		  cancelButtonText: "그냥 둘래요",
		  inputPlaceholder: "수정할 댓글을 적어주세요.",
		},function(inputValue){
		  if (inputValue === false) return false;
		  
		  if (inputValue === "") {
		    swal.showInputError("수정내용을 적어주세요!");
		    return false;
		  }else{
				location.href="commentUpdate.do?number="+<%=bDto.getNum()%>+"&commentid="+id+"&content="+inputValue;
		  }
		});
}
</script>
<script>
function RecommDel(id){
	swal({
		  title: "삭제하실꺼에요?",
		  text: "Would you like to delete the comment?",
		  imageUrl:"${pageContext.request.contextPath}/resources/images/bbsdel.png",
		  showCancelButton: true,
		  confirmButtonClass: "btn-danger",
		  confirmButtonText: "버려주세요",
		  cancelButtonText: "그냥두세요",
		  closeOnConfirm: false,
		},
		function() {
			  location.href="commentDelete.do?number="+<%=bDto.getNum()%>+"&commentid="+id;
		});
}
</script>
<script>
function del(){
	swal({
		  title: "글 삭제하실꺼에요?",
		  text: "Would you like to delete the post?",
		  imageUrl:"${pageContext.request.contextPath}/resources/images/bbsdel.png",
		  showCancelButton: true,
		  confirmButtonClass: "btn-danger",
		  confirmButtonText: "버려주세요",
		  cancelButtonText: "그냥두세요",
		  closeOnConfirm: false,
		},
		function() {
			  location.href="bbsDel.do?major=<%=bDto.getMajor()%>&number=<%=bDto.getNum()%>";
		});
}
</script>
<script>
function recomm(){
	if(<%=id.equals(bDto.getId())%>){
		swal({
			title:"으으음..",
			text:"자신의 게시물을 추천하시는거에요?",
			cancelButtonText: "아니오..",
			imageUrl:"${pageContext.request.contextPath}/resources/images/recomm.png",
		});
	}else{
		location.href="recomm.do?number=<%=bDto.getNum()%>&recomm=1";
	}
}
</script>
<script>
function disrecomm(){
	if(<%=id.equals(bDto.getId())%>){
		swal({
			title:"어어!",
			text:"자신의 게시물에 비추천하시게요?",
			imageUrl:"${pageContext.request.contextPath}/resources/images/discomm.png",
		});
	}else{
		location.href="recomm.do?number=<%=bDto.getNum()%>&recomm=2";
	}
}
</script>

<script>
function userRecomm(){
	if(<%=id.equals(bDto.getId())%>){
		swal({
			title:"흐흐흥",
			text:"스스로 추천하시는거에요?",
			imageUrl:"${pageContext.request.contextPath}/resources/images/userRe.png",
		});
	}else{
		location.href="userRecomm.do?number=<%=bDto.getNum()%>&bbsId=<%=bDto.getId()%>&recomm=3";
	}
}
</script>
<script>
function userDisRecomm(){
	if(<%=id.equals(bDto.getId())%>){
		swal({
			title:"헉!",
			text:"스스로 비추천 하지말아요..",
			imageUrl:"${pageContext.request.contextPath}/resources/images/userDis.png",
		});
	}else{
		location.href="userRecomm.do?number=<%=bDto.getNum()%>&bbsId=<%=bDto.getId()%>&recomm=4";
	}
}
</script>
<script>
function userDisRecomm(){
	if(<%=id.equals(bDto.getId())%>){
		swal({
			title:"헉!",
			text:"스스로 비추천 하지말아요..",
			imageUrl:"${pageContext.request.contextPath}/resources/images/userDis.png",
		});
	}else{
		location.href="userRecomm.do?number=<%=bDto.getNum()%>&bbsId=<%=bDto.getId()%>&recomm=4";
	}
}
</script>
<script>
function recommReport(){
	swal({
		  title: "댓글 신고",
		  text: "Please report the comments",
		  type: "input",
		  showCancelButton: true,
		  closeOnConfirm: false,
		  inputPlaceholder: "자세한 신고내역을 적어주세요."
		},
		function(inputValue){
		  if (inputValue === false) return false;
		  
		  if (inputValue === "") {
		    swal.showInputError("신고내역을 적어주셔야죠!");
		    return false
		  }
		  swal({
		    	title: "신고성공",
		    	closeOnClickOutside: false,
		    	text: "제보에 감사합니다!",
		    	imageUrl:"${pageContext.request.contextPath}/resources/images/report.png",
		    	buttons: "확인",
					}).then((확인)=>{
		    			if (확인) {
		    				history.back(-1);
		    		}
			});
		});
}
</script>
</body>
</html>