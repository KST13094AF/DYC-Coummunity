<%@page import="kr.ac.doungyang.Community.model.bbs.bbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
bbsDto bDto = (bbsDto)request.getAttribute("bbsUpdate");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>메인</title>
<link href="${pageContext.request.contextPath}/resources/plugins/summernote/dist/summernote.css" rel="stylesheet">
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
							<li class="breadcrumb-item">게시판</li>
							<li class="breadcrumb-item active">${bbsUpdate.major}</li>
							<li class="breadcrumb-item active">글수정</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
                            <div class="card-body">
                                <div class="inline-editor">
                                    <h4 class="card-title m-b-40"><b>수정 주의 사항</b></h4>
                                    <ul class="list-icons" style="margin:0">
                                        <li><i class="fa fa-check text-warning"></i> 다른사람을 까내리는 듯한 게시물을 작성하지 말아주세요.</li>
                                        <li><i class="fa fa-check text-warning"></i> 심한 비방 및 욕설 등을 자제해 주세요.</li>
                                        <li><i class="fa fa-check text-warning"></i> 인물을 특정하거나 조롱하는 것은 삼가해주세요.</li>
                                        <li><i class="fa fa-check text-warning"></i> 다른 사용자와 지나친 친목을 삼가해주세요.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
					<div class="col-lg-12">
					<div class="form-input-content">
						<div class="card">
							<div class="card-body pt-5">
								<h3 class="text-center" style="margin-bottom:2.5rem"><b>글수정</b></h3>
								<div class="basic-form">
									<form action="bbsUpdateDo.do?number=${bbsUpdate.num}" method="post">
										<div class="form-group">
											<select name="class" class="form-control" required>
												<option>분류</option>
												<option>정보</option>
												<option>공유</option>
												<option>기타</option>
											</select>
										</div>
										<div class="form-group">
											<label>제목:</label> <input name="title" value="${bbsUpdate.title}" type="text" class="form-control" required>
										</div>
										<div class="form-group">
											<label>내용:</label>
											<textarea name="content" class="summernote" rows="15" id="comment" required>${bbsUpdate.content}</textarea>
										</div>
										<br>
										<div class="form-group text-right">
											<input type="reset" class="btn mb-1 btn-outline-secondary" value="초기화 하기" style="width:8rem">
											<input type="submit" class="btn mb-1 btn-outline-success" value="글수정" style="width:8rem">
										</div>
									</form>
								</div>
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
    <script src="${pageContext.request.contextPath}/resources/plugins/summernote/dist/summernote.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/plugins/summernote/dist/summernote-init.js"></script>
<%@ include file="js.jsp"%>
</html>