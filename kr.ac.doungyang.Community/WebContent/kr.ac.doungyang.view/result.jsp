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

<c:if test="${sendEmailResult eq 1}">
	<script>	
		swal({
    	title: "발송 완료",
    	closeOnClickOutside: false,
    	text: "제보에 감사드립니다!",
    	icon: "success",
    	buttons: "당연한거죠",
		}).then((확인)=>{
    			if (확인) {
   	 			location.href="home.do";
    		}
		});
	</script>
</c:if>

<c:if test="${sendEmailResult eq 0}">
	<script>	
		swal({
    	title: "발송 실패",
    	closeOnClickOutside: false,
    	text: "무언가 문제가 생겼나봐요..",
    	icon: "error",
    	buttons: "고쳐주세요",
			}).then((확인)=>{
    			if (확인) {
   	 			location.href="home.do";
    		}
		});
	</script>
</c:if>

<c:if test="${updateResult eq 1}">
<script>	
	swal({
		title: "수정 성공!",
		closeOnClickOutside: false,
		text: "정상적으로 반영하였어요!",
		icon: "success",
		buttons: "고마워요",
			}).then((확인)=>{
			if (확인) {
	 			location.href="infoAction.do";
			}
		});
	</script>
</c:if>

<c:if test="${updateResult eq 0}">
	<script>	
		swal({
    	title: "수정 실패",
    	closeOnClickOutside: false,
    	text: "문제가 발생했어요..",
    	icon: "error",
    	buttons: "확인",
			}).then((확인)=>{
    			if (확인) {
   	 			location.href="infoAction.do";
    		}
		});
	</script>
</c:if>

<c:if test="${userInfoFail eq 0}">
	<script>	
		swal({
    	title: "헉!오류 발생",
    	closeOnClickOutside: false,
    	text: "누군가 방해하나봐요",
    	icon: "error",
    	buttons: "제대로하세요",
			}).then((확인)=>{
    			if (확인) {
   	 			location.href="unlock.do";
    		}
		});
	</script>
</c:if>

<c:if test="${writeResult eq 1}">
	<script>	
		swal({
    	title: "글쓰기 성공",
    	closeOnClickOutside: false,
    	text: "정상적으로 등록됬어요!",
    	icon: "success",
    	buttons: "고마워요",
			}).then((확인)=>{
    			if (확인) {
   	 			location.href="bbsAction.do?major=<%=request.getParameter("major")%>";
    		}
		});
	</script>
</c:if>

<c:if test="${writeResult eq 0}">
	<script>	
		swal({
    	title: "앗!",
    	closeOnClickOutside: false,
    	text: "글쓰기가 안됬어요..",
    	icon: "error",
    	buttons: "한번만 이해하죠",
			}).then((확인)=>{
    			if (확인) {
    			location.href="bbsAction.do?major=<%=request.getParameter("major")%>";
    		}
		});
	</script>
</c:if>

<c:if test="${deleteFail eq 1}">
	<script>	
		swal({
    	title: "으으음",
    	closeOnClickOutside: false,
    	text: "문제가 생겼나봐요",
    	icon: "error",
    	buttons: "고쳐주세요",
			}).then((확인)=>{
    			if (확인) {
    			location.href="home.do";
    		}
		});
	</script>
</c:if>

<c:if test="${updateResult2 eq 1}">
	<script>	
		swal({
    	title: "으으음",
    	closeOnClickOutside: false,
    	text: "문제가 생겼나봐요",
    	icon: "error",
    	buttons: "짜증나",
			}).then((확인)=>{
    			if (확인) {
    			location.href="home.do";
    		}
		});
	</script>
</c:if>

<c:if test="${updateDoReuslt eq 1}">
	<script>	
		swal({
    	title: "수정 완료",
    	closeOnClickOutside: false,
    	text: "정상적으로 수정되었어요!",
    	icon: "success",
    	buttons: "확인",
			}).then((확인)=>{
    			if (확인) {
    			location.href="bbsRead.do?number=<%=request.getParameter("number")%>";
    		}
		});
	</script>
</c:if>

<c:if test="${updateDoReuslt eq 0}">
	<script>	
		swal({
    	title: "아앗!",
    	closeOnClickOutside: false,
    	text: "수정이 안됬어요..",
    	icon: "error",
    	buttons: "확인",
			}).then((확인)=>{
    			if (확인) {
    			location.href="bbsRead.do?number=<%=request.getParameter("number")%>";
    		}
		});
	</script>
</c:if>

<c:if test="${recommRe eq 1}">
	<script>	
		swal({
    	title: "으으음!",
    	closeOnClickOutside: false,
    	text: "자신의 게시물은 추천할수없어요!",
    	icon: "warning",
    	buttons: "들켰다..",
			}).then((확인)=>{
    			if (확인) {
    				history.back(-1);
    		}
		});
	</script>
</c:if>

<c:if test="${likeyResult eq 0}">
	<script>	
		swal({
    	title: "한번만!",
    	closeOnClickOutside: false,
    	text: "이미 누르셨잖아요!!",
    	icon: "warning",
    	buttons: "들켰다..",
			}).then((확인)=>{
    			if (확인) {
    				history.back(-1);
    		}
		});
	</script>
</c:if>

<c:if test="${likeyResult eq 1}">
	<script>	
		swal({
    	title: "한번만!",
    	closeOnClickOutside: false,
    	text: "너무 좋아하시는거 아니에요?",
    	icon: "warning",
    	buttons: "부끄럽네요.",
			}).then((확인)=>{
    			if (확인) {
    				history.back(-1);
    		}
		});
	</script>
</c:if>

<c:if test="${likeyResult eq 2}">
	<script>	
		swal({
    	title: "한번만!",
    	closeOnClickOutside: false,
    	text: "너무 싫어하지마세요..",
    	icon: "warning",
    	buttons: "부끄럽네요.",
			}).then((확인)=>{
    			if (확인) {
    				history.back(-1);
    		}
		});
	</script>
</c:if>

<c:if test="${recommUpdateResult eq 0}">
	<script>	
		swal({
    	title: "아앗!",
    	closeOnClickOutside: false,
    	text: "수정에 실패했어요..",
    	icon: "error",
    	buttons: "그럴수있죠",
			}).then((확인)=>{
    			if (확인) {
    				history.back(-1);
    		}
		});
	</script>
</c:if>

<c:if test="${recommDeleteResult eq 0}">
	<script>	
		swal({
    	title: "...",
    	closeOnClickOutside: false,
    	text: "삭제에 실패했어요..",
    	icon: "error",
    	buttons: "괜찮아요",
			}).then((확인)=>{
    			if (확인) {
    				history.back(-1);
    		}
		});
	</script>
</c:if>

<c:if test="${fileUpload eq 0}">
	<script>	
		swal({
    	title: "실패..",
    	closeOnClickOutside: false,
    	text: "뭔가 문제가 생겼나보네요..",
    	icon: "error",
    	buttons: "괜찮아요",
			}).then((확인)=>{
    			if (확인) {
    				history.back(-1);
    		}
		});
	</script>
</c:if>

<c:if test="${postWriteRe eq -1}">
	<script>	
		swal({
    	title: "실패..",
    	closeOnClickOutside: false,
    	text: "뭔가 문제가 생겼나보네요..",
    	icon: "error",
    	buttons: "괜찮아요",
			}).then((확인)=>{
    			if (확인) {
    				history.back(-1);
    		}
		});
	</script>
</c:if>

<c:if test="${postDelRe eq -1}">
	<script>	
		swal({
    	title: "실패..",
    	closeOnClickOutside: false,
    	text: "뭔가 문제가 생겼나보네요..",
    	icon: "error",
    	buttons: "괜찮아요",
			}).then((확인)=>{
    			if (확인) {
    				history.back(-1);
    		}
		});
	</script>
</c:if>

<c:if test="${empty userId}">
	<script>	
		swal({
    	title: "세션 만료",
    	closeOnClickOutside: false,
    	text: "재접속 부탁드려요!",
    	icon: "info",
    	buttons: "다시올게요",
			}).then((확인)=>{
    			if (확인) {
   	 			location.href="login.do";
    		}
		});
</script>
</c:if>
<script src="${pageContext.request.contextPath}/resources/plugins/sweetalert/js/sweetalert.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/plugins/sweetalert/js/sweetalert.init.js"></script>
</body>
</html>