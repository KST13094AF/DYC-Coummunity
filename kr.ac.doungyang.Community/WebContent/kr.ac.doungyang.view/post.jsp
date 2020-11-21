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
<title>메일함</title>
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
							<li class="breadcrumb-item active">쪽지함</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						 <div class="card mb-4">
                            <div class="p-4">
                                <div>
                                    <h4 class="card-title m-b-40"><b>우편 함</b></h4>
                                    <ul class="list-icons" style="margin:0">
                                        <li><i class="fa fa-check text-warning"></i> 다른 유저가 보낸 우편를 확인 할 수 있습니다.</li>
                                        <li><i class="fa fa-check text-warning"></i> 다른 사람과 우편를 주고 받아 보세요~!</li>
                                        <li><i class="fa fa-check text-warning"></i> 다른 사람을 향해 지나친 욕설 및 비방을 삼가해주세요.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                        	<div class="card-header mt-1">
						 		<h5><span style="color:cornflowerblue">[${param.user}]</span>님과의 우편목록입니다.</h5>
						 		<hr>
						 	</div>
                            <div class="p-3">
                            <c:forEach var="post" items="${send}">
                            <c:if test="${post.fromid eq param.user}">
                            <div class="media media-reply">
                                <img class="mr-3 circle-rounded" src="${pageContext.request.contextPath}/profile/${Profile}" width="50" height="50" alt="Generic placeholder image">
                                <div class="media-body p-3">
                                    <div class="d-sm-flex justify-content-between mb-2">
                                        <h5 class="mb-sm-0">${post.fromid} 
                                        <small class="text-muted ml-3">[<fmt:formatDate value="${post.date}" pattern="yyyy-MM-dd HH:mm" />]
                                        <c:if test="${post.look eq 0}">
                                       	  읽음
                                        </c:if>
                                        <c:if test="${post.look eq 1}">
                                       	  안읽음
                                        </c:if>
                                        </small>
                                        </h5>
                                    </div>
                                    <p>${post.content.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "")}</p>
                                </div>
                            </div>
							</c:if>
							<c:if test="${post.fromid eq userId}">
                            <div class="media media-reply">
                                <div class="media-body p-3">
                                    <div class="d-sm-flex justify-content-between mb-2">
                                        <h5 class="mb-sm-0">${post.fromid} 
                                        <small class="text-muted ml-3">[<fmt:formatDate value="${post.date}" pattern="yyyy-MM-dd HH:mm" />]
                                        <c:if test="${post.look eq 0}">
                                       	  읽음
                                        </c:if>
                                        <c:if test="${post.look eq 1}">
                                       	  안읽음
                                        </c:if>
                                        </small>
                                        </h5>
                                    </div>
                                    <p class="m-0">${post.content.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "")}</p>
                                    <div class="text-right">
                                    <a href="javascript:void(-1)" onclick="del(${post.num},'${param.user}');" class="btn btn-outline-secondary btn-xs">삭제</a>
                                    </div>
                                </div>
                                <img class="mr-3 circle-rounded" src="${pageContext.request.contextPath}/profile/${userProfile}" width="50" height="50" alt="Generic placeholder image">
                            </div>
                            </c:if>
                            </c:forEach>
                            <c:if test="${send.size() <= 0}">
                            	<div class="bootstrap-media text-center">
                                    <div class="media mb-4 justify-content-center">
                                        <img src="${pageContext.request.contextPath}/resources/images/postUser.png" class="mr-3" style="width:5rem; border:1px" alt="">
                                    </div>
                                  	<h5><b>메일을 보내보세요~</b></h5>
                                </div>
                            </c:if>
                        </div>        
                        </div>
                        <div class="card">
                            <div class="p-3">
                                <form action="postWrite.do" class="form-profile" method="post">
                                    <div class="form-group">
                                    	<input type="hidden" name="toid" value="${param.user}">
                                        <textarea class="form-control" name="content" cols="30" rows="2" placeholder="보낼 메세지를 작성해주세요." required></textarea>
                                    </div>
                                    <div class="text-right">
                                        <input type="submit" class="btn btn-primary px-3 ml-4" value="보내기">
                                    </div>
                                </form>
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
<script>
function del(number, user){
	swal({
		  title: "삭제하실건가요?",
		  text: "삭제하시면 받은 사람도 볼 수 없습니다.",
		  imageUrl:"${pageContext.request.contextPath}/resources/images/postdel2.png",
		  showCancelButton: true,
		  confirmButtonClass: "btn-danger",
		  confirmButtonText: "삭제할게요",
		  cancelButtonText: "고민해볼게요",
		  closeOnConfirm: false,
		},
		function() {
			  location.href="postDelete.do?number="+number+"&user="+user;
		});
}
</script>
</body>
<%@ include file="js.jsp"%>
</html>