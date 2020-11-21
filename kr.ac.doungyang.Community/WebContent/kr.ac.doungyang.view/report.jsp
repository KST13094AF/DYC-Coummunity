<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<%@ include file="css.jsp"%>
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
				<div class="col-lg-12">
					<div class="form-input-content">
						<div class="card">
							<div class="card-body pt-5">
								<h3 class="text-center" style="margin-bottom:2.5rem">Report</h3>
								<div class="basic-form">
									<form action="sendReport.do" method="post">
										<div class="form-group">
											<select name="select" class="form-control" required>
												<option>분류</option>
												<option>에로사항</option>
												<option>버그</option>
												<option>유저신고</option>
												<option>기타</option>
											</select>
										</div>
										<div class="form-group">
											<label>제목:</label> <input name="title" type="text" class="form-control" required>
										</div>
										<div class="form-group">
											<label>내용:</label>
											<textarea name="message" class="form-control h-150px" rows="15" id="comment" required></textarea>
										</div>
										<br>
										<div class="form-group text-center">
											<input type="submit" class="btn mb-1 btn-outline-success" value="제보 하기" style="width:11rem;">
										</div>
										<p class="login-form__footer">
                             				돌아 가시겠어요?<a href="home.do" class="text-primary"> 이전</a>
                               			</p>
									</form>
								</div>
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