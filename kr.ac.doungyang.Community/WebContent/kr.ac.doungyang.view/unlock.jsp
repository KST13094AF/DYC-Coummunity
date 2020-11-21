<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<title>정보 확인</title>
<%@ include file="css.jsp"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body class="h-100">
<c:if test="${unlockFail eq 0}">
	<script>
		swal({
			 title: "당신 누구야?!",
		  	 text: "입력하신 비밀번호가 달라요",
			 icon: "error",
			 button: "다시하기",
		});
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
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <h4 class="text-center">비밀번호 확인</h4>
                                <form class="mt-5 mb-3 login-input" action="unlockAction.do" method="post">
                                    <div class="form-group">
                                        <input type="password" name="pw" class="form-control" placeholder="Password" required>
                                    </div>
                                    <button class="btn login-form__btn submit w-100">내 정보 수정</button>
                                </form>
                                <p class="mt-5 login-form__footer">
                             		돌아 가시겠어요?<a href="home.do" class="text-primary"> 이전</a>
                                </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="js.jsp"%>
</body>
</html>