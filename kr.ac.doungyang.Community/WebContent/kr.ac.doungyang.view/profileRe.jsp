<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="h-100">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>프로필 사진 변경</title>
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body class="h-100">
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                               	<h4 class="text-center mb-4"><b>프로필 사진 변경 완료</b></h4>
                                <div class="media mb-4 justify-content-center">
                                     <img src="${pageContext.request.contextPath}/profile/${userProfile}" style="width:8rem; border:1px" alt="">
                               	</div>
                               	<div class="media-body text-center">
                               	<h5 class="mb-1">현재 프로필 사진</h5>
                                  	 <c:if test="${userProfile == 'noname.png'}">
                                   		<p class="text-muted mb-0">기본 프로필 사진</p>
                                  	 </c:if>
                                  	 <c:if test="${userProfile != 'noname.png'}">
                                  	 	<p class="text-muted mb-0">${userProfile}</p>
                                  	 </c:if>
                                </div>
                                <p class="mt-4 login-form__footer text-center">
                             		<a href="home.do" type="submit" class="btn mb-1 btn-rounded btn-success" >홈으로</a>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/resources/plugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/styleSwitcher.js"></script>
</body>
</html>


