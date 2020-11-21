<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="h-100">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>로그인</title>
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body class="h-100">
<c:if test="${loginFail eq 0}">
	<script>
		swal({
			title: "로그인 실패",
		  	text: "아이디와 비밀번호가 맞나요?",
			icon: "warning",
			button: "다시하기",
		});
	</script>
</c:if>
<c:if test="${!empty userId}">
	<script>
		location.href="home.do";
	</script>
</c:if>
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
                      	<h3><b>동양미래대<br>커뮤니티사이트입니다.</b></h3>
                      	<p>회원가입 후 커뮤니티를 통해 다른 사람과 소통하고 정보를 공유해 보세요 ~!</p>
                    </div>
                </div>
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <h4 class="text-center">로그인</h4>
                                <form class="mt-5 mb-5 login-input" action="loginAction.do" method="post">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="id" placeholder="아이디" required>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" name="pw" placeholder="비밀번호" required>
                                    </div>
                                    <button class="btn login-form__btn submit w-100">로그인 하기</button>
                                </form>
                                <p class="mt-5 login-form__footer">
                             		비밀번호가 기억안나세요? <a href="forget.do" class="text-primary">찾기</a><br><br>
                           		   	아이디가 없으시다구요? <a href="join.do" class="text-primary">회원가입</a>
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


