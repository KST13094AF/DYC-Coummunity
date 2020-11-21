<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>내 정보</title>
<%@ include file="css.jsp"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<c:choose>
	<c:when test="${userInfo.maner < 10}">
		<c:set var="u" value="progress-bar bg-info active progress-bar-striped"/>
	</c:when>
	<c:when test="${userInfo.maner < 20}">
		<c:set var="u" value="progress-bar bg-success active progress-bar-striped"/>
	</c:when>
	<c:otherwise>
		<c:set var="u" value="progress-bar active progress-bar-striped bg-danger"/>
	</c:otherwise>
</c:choose>
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
							<li class="breadcrumb-item active"><b>내 정보</b></li>
						</ol>
					</div>
				</div>
				<div class="row">
					 <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="media align-items-center mb-4">
                                    <img class="mr-3" src="${pageContext.request.contextPath}/profile/${userProfile}" width="80" height="80" alt="">
                                    <div class="media-body">
                                        <h3 class="mb-0">${userId}</h3>
                                        <p class="text-muted mb-0">
                                        ${userInfo.major}
                                        
                                        </p>
                                    </div>
                                </div>
                                <div class="mb-2">유저등급:
                              	  	<c:choose>
                                        <c:when test="${userInfo.maner < 10 }">
                                       	 	<span style="color:gray" class="ml-2">일반유저</span>
                                        </c:when>
                                        <c:when test="${userInfo.maner < 20 }">
                                       	 	<span style="color:blue" class="ml-2">매너유저</span>
                                        </c:when>
                                        <c:when test="${userInfo.maner <= 30 }">
                                       	 	<span style="color:tomato" class="ml-2">인증유저</span>
                                        </c:when>
                                     </c:choose>
                                </div>
                                <div class="mb-2">
                                	좋아요 : ${userInfo.maner}
                                </div>
                                <div class="progress mb-5" style="height:10px">
                                    <div class="${u}" style="width:${userInfo.maner *3.3333}%;" role="progressbar"><span class="sr-only"></span>
                                    </div>
                                </div>
                                <div class="row mb-5">
                                    <div class="col">
                                        <div class="card card-profile text-center">
                                            <span class="mb-1 text-primary" style="margin-top:1rem"><img src="${pageContext.request.contextPath}/resources/images/write.png" style="width:2rem" alt=""></span>
                                            <h3 class="mb-0">${recode}</h3>
                                            <p class="text-muted px-4">나의 글</p>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card card-profile text-center">
                                            <span class="mb-1 text-warning" style="margin-top:1rem"><img src="${pageContext.request.contextPath}/resources/images/comment.png" style="width:2rem" alt=""></span>
                                            <h3 class="mb-0">${comment}</h3>
                                            <p class="text-muted">나의 댓글</p>
                                        </div>
                                    </div>
                                </div>
                                <h4>내 정보</h4>
                                <p class="text-muted">동양미래대학교 커뮤니티 사이트에 등록된 정보입니다.</p>
                                <ul class="card-profile__info mb-5">
                                    <li class="mb-2"><strong class="text-dark mr-4">학과</strong><span>${userInfo.major}/span></li>
                                    <li class="mb-2"><strong class="text-dark mr-4">학번</strong><span>${userInfo.number}</span></li>
                                    <li><strong class="text-dark mr-4">이메일</strong><span>${userInfo.email}</span></li>
                                </ul>
                                <div class="col-12 text-right" >
                                   	<a href="javascript:void()" onclick="del();" class="btn mb-1 btn-secondary">회원 탈퇴 <span class="btn-icon-right"><i class="fa fa-close"></i></span></a>
                                   	<a href="pwUpdate.do" class="btn mb-1 btn-primary">비밀번호변경 <span class="btn-icon-right"><i class="fa fa-star"></i></span></a>
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
</body>
<%@ include file="js.jsp"%>
<script>
function del(){
	swal({
		  title: "정말 삭제하실꺼에요?",
		  text: "지금까지 작성하신 게시물 및 댓글이 없어져요!",
		  imageUrl:"${pageContext.request.contextPath}/resources/images/del2.png",
		  showCancelButton: true,
		  confirmButtonClass: "btn-danger",
		  confirmButtonText: "삭제할게요",
		  cancelButtonText: "고민해볼게요",
		  closeOnConfirm: false,
		},
		function() {
			  location.href="deleteUser.do";
		});
}
</script>
</html>