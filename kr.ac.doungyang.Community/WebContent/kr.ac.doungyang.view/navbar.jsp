<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="nav-header">
            <div class="brand-logo">
                <a href="home.do" style="padding:0.8rem 2rem">
                    <span class="brand-title" style="color:white; font-weight:bold;">
                        DoungYang<br>Community
                    </span>
                </a>
            </div>
        </div>
        <div class="header">    
            <div class="header-content clearfix">
                <div class="nav-control">
                    <div class="hamburger">
                        <span class="toggle-icon"><i class="icon-menu"></i></span>
                    </div>
                </div>
                <div class="header-right">
                    <ul class="clearfix" style="padding-top:0.7rem;">
                    	 <li class="icons dropdown">
                            <a href="javascript:void(0)" data-toggle="dropdown">
                                <i class="mdi mdi-email-outline"></i>
                                 <c:if test="${emailEvent.size() > 0}">
                                	<span class="badge gradient-1 badge-pill badge-primary">${emailEvent.size()}</span>
                                </c:if>
                                <c:if test="${emailEvent.size() <= 0}">
                                	<span class="badge badge-pill" style="background-color:gainsboro">${emailEvent.size()}</span>
                                </c:if>
                            </a>
                            <div class="drop-down animated fadeIn dropdown-menu">
                                <div class="dropdown-content-heading d-flex justify-content-between">
                                    <span class="">${emailEvent.size()} 새로운 우편이 있어요</span>  
                                </div>
                                <div class="dropdown-content-body">
                                    <ul>
                                    	<c:forEach var="Eevent" items="${emailEvent}">
                                        <li class="notification-unread">
                                            <a href="postUser.do?user=${Eevent.fromid}">
                                                <img class="float-left mr-3 avatar-img" src="${pageContext.request.contextPath}/resources/images/postEvent2.png" width="20rem">
                                                <div class="notification-content mt-1">
                                                    <div class="notification-heading">${Eevent.fromid}님이</div>
                                                    <div class="notification-text">새로운 우편을 보내셨어요!</div>
                                                </div>
                                            </a>
                                        </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                <i class="mdi mdi-bell-outline"></i>
                                <c:if test="${event.size() > 0}">
                                	<span class="badge badge-pill gradient-2">${event.size()}</span>
                                </c:if>
                                <c:if test="${event.size() <= 0}">
                                	<span class="badge badge-pill" style="background-color:gainsboro">0</span>
                                </c:if>
                            </a>
                            <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                                <div class="dropdown-content-heading d-flex justify-content-between">
                                    <span class="">${event.size()}개의 알림이 있습니다.</span>  
                                    <a href="javascript:void()" class="d-inline-block">
                                        <span class="badge badge-pill gradient-2">${event.size()}</span>
                                    </a>
                                </div>
                                <div class="dropdown-content-body">
                                <c:forEach var="event" items="${event}">
                                    <ul>
                                        <li>
                                            <a href="bbsRead.do?number=${event.bbsid}">
                                                <span class="mr-3 avatar-icon bg-success-lighten-2"><img src="${pageContext.request.contextPath}/resources/images/event2.png" width="27rem"></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading" style="font-size:0.8rem">${event.fromid}님이 댓글을 남겼습니다.</h6>
                                                    <span class="notification-text">게시판으로 이동하기</span> 
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </c:forEach>
                                </div>
                            </div>
                        </li>
                        <li class="icons dropdown">
                            <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                <img src="${pageContext.request.contextPath}/profile/${userProfile}" height="40" width="40" alt="">
                            </div>
                            <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="unlock.do"><span>내 정보</span></a>
                                        </li>
                                        <li>
                                            <a href="profile.do"><span>프로필 변경</span></a>
                                        </li>
                                        <li>
                                            <a href="bbsAction.do?major=내가 쓴글">
                                                <span>내가 쓴글</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="myComment.do">
                                                <span>내가 쓴 댓글</span>
                                            </a>
                                        </li>
                                        <hr class="my-2">
                                        <li>
                                            <a href="#" onclick="request();" >
                                                <span>로그아웃</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="header-right pt-3 mr-3">
                <span>접속자 ${userId}</span>
                </div>
            </div>
        </div>
<script>
function request(){
	swal({
		  title: "로그아웃 하실건가요?",
		  text: "Are you going to logout?",
		  imageUrl:"${pageContext.request.contextPath}/resources/images/logout2.png",
		  showCancelButton: true,
		  confirmButtonClass: "btn-danger",
		  confirmButtonText: "지금 갈래요",
		  cancelButtonText: "더 있다 갈게요",
		  closeOnConfirm: false,
		},
		function() {
			  location.href="logoutAction.do";
		});
}
</script>