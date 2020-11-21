<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>우편함</title>
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
							<li class="breadcrumb-item">Home</li>
							<li class="breadcrumb-item active">우편함</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12 mb-4">
                        <div class="card mb-4 p-2 text-center">
                        	<span style="font-size:0.8rem; color:black;"><b>받은 우편 (최근 10개)</b></span>
                        </div>
                        <c:forEach var="post" items="${recive}" varStatus="status">
                        <div class="card mb-2">
                            <div class="p-2">
                                <div class="bootstrap-media">
                                    <div class="media">
                                        <img src="${pageContext.request.contextPath}/profile/${profile.get(status.index)}" class="mr-3" style="width:2rem; height:2rem;" alt="">
                                        <div class="media-body mt-1">
                        					<p class="m-0"><a href="postUser.do?user=${post.fromid}"><b>From : ${post.fromid}</b>
                        					<span class="ml-1">${post.content}</span></a>
                        					<span class="ml-1">[<fmt:formatDate value="${post.date}" pattern="yyyy-MM-dd HH:mm"/>]</span>
                                           	<a href="javascript:void(-1)" onclick="del('${post.fromid}',1)" class="btn ml-1 btn-outline-secondary btn-xs" style="float:right">전체삭제</a>
                                            <c:if test="${post.look eq 1}">
                                           		<span class="ml-3" style="float:right">안읽음</span>
                                           	</c:if>
                                           	<c:if test="${post.look eq 0}">
                                           		<span class="ml-3" style="float:right">읽음</span>
                                           	</c:if>
                        					</p>
                                           	</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <c:if test="${recive.size() > 10}">
                        	<div class="card p-2 text-center mt-1" style="background:#7571f9">
                        		<a href="postHome.do?recivelimit=All">
                        		<span style="font-size:0.8rem; color:white;"><b>받은 우편 전체보기</b></span>
                        		</a>
                        	</div>
                        </c:if>
                        <c:if test="${recive.size() <= 0}">
                         <div class="card mb-2">
                            <div class="card-body">
                                <div class="bootstrap-media text-center">
                                    <div class="media mb-4 justify-content-center">
                                        <img src="${pageContext.request.contextPath}/resources/images/post.png" class="mr-3" style="width:5rem; border:1px" alt="">
                                    </div>
                                  	<h5><b>아무 메일두 도착하지 않았어요..</b></h5>
                                </div>
                            </div>
                        </div>
                        </c:if>
                        </div>
                        <div class="col-lg-12">
                        <div class="card mb-4 p-2 text-center">
                        	<span style="font-size:0.8rem; color:black;"><b>보낸 우편 (최근 10개)</b></span>
                        </div>
                        <c:forEach var="post" items="${send}" varStatus="status">
                        <div class="card mb-2">
                            <div class="p-2">
                                <div class="bootstrap-media">
                                    <div class="media">
                                        <img src="${pageContext.request.contextPath}/profile/${userProfile}" class="mr-3" style="width:2rem; height:2rem;" alt="">
                                        <div class="media-body mt-1">
                        					<p class="m-0"><a href="postUser.do?user=${post.toid}"><b>TO : ${post.toid}</b>
                        					<span class="ml-1">${post.content}</span></a>
                        					<span class="ml-1">[<fmt:formatDate value="${post.date}" pattern="yyyy-MM-dd HH:mm"/>]</span>
                                           	<a href="javascript:void(-1)" onclick="del('${post.toid}',2)" class="btn ml-1 btn-outline-secondary btn-xs" style="float:right">전체삭제</a>
                                            <c:if test="${post.look eq 1}">
                                           		<span class="ml-3" style="float:right">안읽음</span>
                                           	</c:if>
                                           	<c:if test="${post.look eq 0}">
                                           		<span class="ml-3" style="float:right">읽음</span>
                                           	</c:if>
                        					</p>
                                           	</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <c:if test="${send.size() > 10}">
                        	<div class="card p-2 text-center mt-1" style="background:#7571f9">
                        		<a href="postHome.do?sendlimit=All">
                        		<span style="font-size:0.8rem; color:white;"><b>보낸 우편 전체보기</b></span>
                        		</a>
                        	</div>
                        </c:if>
                        <c:if test="${send.size() <= 0}">
                         <div class="card mb-2">
                            <div class="card-body">
                                <div class="bootstrap-media text-center">
                                    <div class="media mb-4 justify-content-center">
                                        <img src="${pageContext.request.contextPath}/resources/images/post.png" class="mr-3" style="width:5rem; border:1px" alt="">
                                    </div>
                                  	<h5><b>아무 메일두 보내지 않았어요..</b></h5>
                                </div>
                            </div>
                        </div>
                        </c:if>
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
<script>
function del(id, type){
	swal({
		  title: "삭제하실건가요?",
		  text: "유저와 우편 데이터가 사라집니다.",
		  imageUrl:"${pageContext.request.contextPath}/resources/images/postdelall.png",
		  showCancelButton: true,
		  confirmButtonClass: "btn-danger",
		  confirmButtonText: "삭제할게요",
		  cancelButtonText: "고민해볼게요",
		  closeOnConfirm: false,
		},
		function() {
			  location.href="postDeleteAll.do?type="+type+"&user="+id;
		});
}
</script>
</body>
<%@ include file="js.jsp"%>
</html>