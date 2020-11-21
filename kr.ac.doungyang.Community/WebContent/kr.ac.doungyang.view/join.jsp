<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="h-100">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>회원가입</title>
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body class="h-100">
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
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <h4 class="text-center">회원가입</h4>
                                <form id="joinForm" class="mt-5 mb-5 login-input" action="joinAction.do" method="post">
                                    <div class="form-group">
                                        <input id="id" name="id" size="15" type="text" onchange="idC()" class="form-control" placeholder="아이디" >
                                    </div>
                                    <div class="mb-2">
										<span id="idC" style="font-size: 0.8rem;" ></span>
                                    </div>
                                    <div class="form-group">
                                        <input name="pw" type="password" size="30" class="form-control" id="pw" onchange="pwC()" placeholder="비밀번호" >
                                    </div>
                                    <div class="mb-2">
										<span id="check" style="font-size: 0.8rem;"></span>
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" size="30" id="pw_re" onchange="pwCheck()" placeholder="비밀번호 확인" >
                                    </div>
                                    <div class="mb-2">
										<span id="same" style="font-size: 0.8rem;"></span>
                                    </div>
                                    <div class="form-group">
                                        <input id="number" name="number" type="number" size="10" class="form-control" placeholder="학번" >
                                    </div>
                                    <div class="form-group">
                                        <input id="email" name="email" type="email" class="form-control" placeholder="이메일" >
                                    </div>
                                    	<div class="form-group">
                                      		 <select id="major" name="major" class="custom-select mr-sm-2" >
                                        		<option value='' selected>학과선택</option>
                                        		<option value="">-----경영학부-----</option>
                                        		<option value="경영학과">경영학과</option>
                                        		<option value="세무회계학과">세무회계학과</option>
                                      			<option value="유통마케팅학과">유통마케팅학과</option>
                                        		<option value="관광컨벤션학과">관광컨벤션학과</option>
                                      			<option value="경영정보학과">경영정보학과</option>
                                      			<option value="">-----공학부-----</option>
                                        		<option value="컴퓨터공학과">컴퓨터공학</option>
                                        		<option value="컴퓨터소프트웨어과">컴퓨터소프트웨어</option>
                                        		<option value="전기공학과">전기공학과</option>
                                        		<option value="정보전자공학과">정보전자공학과</option>
                                        		<option value="반도체전자공학과">반도체전자공학과</option>
                                        		<option value="정보통신공학과">정보통신공학과</option>
                                        		<option value="자동화공학과">자동화공학과</option>
                                        		<option value="로봇공학과">로봇공학과</option>
                                        		<option value="기계공학과">기계공학과</option>
                                        		<option value="기계설계공학과">기계설계공학과</option>
                                        		<option value="생명화학공학과">생명화학공학과</option>
                                        		<option value="식품공학과">식품공학과</option>
                                        		<option value="건축과">건축과</option>
                                        		<option value="실내환경디자인과">실내환경디자인과</option>
                                        		<option value="시각정보디자인과">시각정보디자인과</option>
                                        	</select>
                                        	<hr style="border-color:#f5f5f5;">
                                   		</div>
                                    <a href="#" onclick="inputC()" class="btn login-form__btn submit w-100">회원가입 하기</a>
                                </form>
                                <p class="mt-5 login-form__footer">아이디가 있으세요? <a href="login.do" class="text-primary">로그인</a></p>
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
function idC(){
	if (document.getElementById('id').value != '') {
		var passRule = /^[A-Za-z0-9]{6,12}$/;//숫자와 문자 포함 형태의 6~12자리 이내의 암호 정규식
		if(!passRule.test($("input[id='id']").val())) {
			document.getElementById('idC').innerHTML = '아이디는 영문 숫자 조합 6 ~ 12자리로 해주세요.';
			document.getElementById('idC').style.color = "tomato";
		}else{
			document.getElementById('idC').innerHTML = '';
		}
	}
}
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
		if(document.getElementById('id').value==""){
			swal({
				title: "아이디 오류",
			  	text: "아이디를 입력해주세요!",
				icon: "warning",
				button: "확인"
			});
			document.getElementById('id').focus(); 
			return; 
		}else if(!passRule.test($("input[id='id']").val())){
			swal({
				title: "아이디 오류",
			  	text: "아디이는 영문 숫자 조합 6~12자로 해주세요!",
				icon: "warning",
				button: "네"
			});
			document.getElementById('id').focus(); 
			return; 
		}else if(document.getElementById('pw').value==""){
			swal({
				title: "비밀번호 오류",
			  	text: "비밀번호를 입력해주세요!",
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
			  	text: "비밀번호 확인이 달라요!",
				icon: "warning",
				button: "네"
			});
			document.getElementById('pw_re').focus(); 
			return; 
		}else if(document.getElementById('number').value==""){
			swal({
				title: "학번 오류",
			  	text: "학번을 입력해주세요!",
				icon: "warning",
				button: "네"
			});
			document.getElementById('number').focus(); 
			return; 
		}else if(document.getElementById('email').value==""){
			swal({
				title: "이메일 오류",
			  	text: "이메일을 입력해주세요!",
				icon: "warning",
				button: "네"
			});
			document.getElementById('email').focus(); 
			return; 
		}else if(document.getElementById('major').value==""){
			swal({
				title: "학과 오류",
			  	text: "학과를 선택해주세요!",
				icon: "warning",
				button: "네"
			});
			document.getElementById('major').focus(); 
			return; 
		}else{
			document.getElementById('joinForm').submit();
		}
	}
</script>
</body>
</html>


