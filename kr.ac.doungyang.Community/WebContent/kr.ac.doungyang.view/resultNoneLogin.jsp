<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<title>Result Page</title>
<%@ include file="css.jsp"%>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<html>
<body>
<c:if test="${forgetResult eq 0}">
	<script>	
		swal({
    	title: "찾기 실패",
    	closeOnClickOutside: false,
    	text: "저희가 가진 정보와 다른걸요?",
    	icon: "warning",
    	buttons: "다시해볼게요",
			}).then((확인)=>{
    			if (확인) {
    				history.back(-1);
    		}
		});
	</script>
</c:if>
<c:if test="${forgetUpdateResult eq 1}">
	<script>	
		swal({
    	title: "수정 완료",
    	closeOnClickOutside: false,
    	text: "정상적으로 반영하였어요!",
    	icon: "success",
    	buttons: "고마워요",
			}).then((확인)=>{
    			if (확인) {
    				location.href="login.do";
    		}
		});
	</script>
</c:if>
<c:if test="${forgetUpdateResult eq 0}">
	<script>	
		swal({
    	title: "수정 실패",
    	closeOnClickOutside: false,
    	text: "제가 원인을 찾아볼게요..",
    	icon: "error",
    	buttons: "잘좀하세요",
			}).then((확인)=>{
    			if (확인) {
    				history.back(-1);
    		}
		});
	</script>
</c:if>
<c:if test="${joinFail eq 0}">
	<script>	
		swal({
    	title: "회원가입 실패",
    	closeOnClickOutside: false,
    	text: "다른 아이디를 선택해주세요~",
    	icon: "error",
    	buttons: "잘좀하세요",
			}).then((확인)=>{
    			if (확인) {
    				history.back(-1);
    		}
		});
	</script>
</c:if>
<script src="${pageContext.request.contextPath}/resources/plugins/sweetalert/js/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/sweetalert/js/sweetalert.init.js"></script>
</body>
</html>