<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>비밀번호 수정</title>
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
                                <h4 class="text-center">비밀번호 수정</h4>
                                <form id="forgetForm" class="mt-5 mb-5 login-input" action="forgetUpdatAction.do" method="post">
                                    <div class="form-group">
                                        <input name="pw" id="pw" onchange="pwC()" type="password" class="form-control" placeholder="비밀번호" required>
                                    </div>
                                    <div class="mb-2">
										<span id="check" style="font-size: 0.8rem;"></span>
                                    </div>
                                    <div class="form-group">
                                        <input name="pwR" id="pw_re" onchange="pwCheck()" type="password" class="form-control" placeholder="비밀번호 확인" required>
                                    </div> 
                                    <div class="form-group">
										<span id="same" style="font-size: 0.8rem;"></span>
									</div>
                                    <a href="#" onclick="inputC();" class="btn login-form__btn submit w-100">수정하기</a>
                                </form>
                                <p class="mt-5 login-form__footer">
                             		비밀번호가 기억나셨어요? <a href="login.jsp" class="text-primary">로그인</a>
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
<script>
function pwC(){
	if (document.getElementById('pw').value != '') {
		var passRule = /^[A-Za-z0-9]{6,12}$/;//숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식
		if(!passRule.test($("input[id='pw']").val())) {
			document.getElementById('check').innerHTML = '비밀번호는 영문 숫자 조합 6~12자 이내로 해주세요.';
			document.getElementById('check').style.color = "tomato";
		}else{
			document.getElementById('check').innerHTML = '';
		}
	}
}
function pwCheck() {
	if (document.getElementById('pw').value != ''
			&& document.getElementById('pw_re').value != '') {
		if (document.getElementById('pw').value == document.getElementById('pw_re').value) {
			document.getElementById('same').innerHTML = '비밀번호가 일치합니다.';
			document.getElementById('same').style.color = "blue";
		} else {
			document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다.';
			document.getElementById('same').style.color = "tomato";
		}
	}
}
function inputC(){
	var passRule = /^[A-Za-z0-9]{6,12}$/;
	if(document.getElementById('pw').value==""){
		swal({
			title: "비밀번호 오류",
		  	text: "비밀번호 입력해주세요!",
			icon: "warning",
			button: "확인"
		});
		document.getElementById('pw').focus(); 
		return; 
	}else if(!passRule.test($("input[id='pw']").val())){
		swal({
			title: "비밀번호 오류",
		  	text: "비밀번호는 영문 숫자 조합 6~12자로 해주세요!",
			icon: "warning",
			button: "네"
		});
		document.getElementById('pw').focus(); 
		return; 
	}else if(document.getElementById('pw').value != document.getElementById('pw_re').value){
		swal({
			title: "비밀번호 오류",
		  	text: "비밀번호 확인이 다른걸요?",
			icon: "warning",
			button: "확인"
		});
		document.getElementById('pw_re').focus(); 
		return; 
	}else{
		document.getElementById('forgetForm').submit(); 
	}
}
</script>
</body>
</html>


