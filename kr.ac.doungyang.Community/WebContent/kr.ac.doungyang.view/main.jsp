<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String userId = (String)session.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>메인</title>
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
							<li class="breadcrumb-item">Home</li>
							<li class="breadcrumb-item active">메인화면</li>
						</ol>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="p-4">
								<div class="card-title">
                               		<h4 class="card-title">어서오세요 ${userId}님</h4>
                               	</div>
                                <ul class="nav nav-tabs mb-3 justify-content-start">
                                    <li class="nav-item"><a href="#navpills2-1" class="nav-link active" data-toggle="tab" aria-expanded="false">개요</a>
                                    </li>
                                    <li class="nav-item"><a href="#navpills2-2" class="nav-link" data-toggle="tab" aria-expanded="false">개발환경</a>
                                    </li>
                                    <li class="nav-item"><a href="#navpills2-3" class="nav-link" data-toggle="tab" aria-expanded="false">개발일정</a>
                                    </li>
                                    <li class="nav-item"><a href="#navpills2-4" class="nav-link" data-toggle="tab" aria-expanded="true">출처</a>
                                    </li>
                                </ul>
                                <div class="tab-content br-n pn">
                                    <div id="navpills2-1" class="tab-pane active">
                                        <div class="row align-items-center text-left">
                                            <div class="col-sm-6 col-md-4 col-xl-2">
                                                <img src="${pageContext.request.contextPath}/resources/images/profile.png"  alt="" class="img-fluid thumbnail m-r-15">
                                            </div>
                                            <div class="col-sm-6 col-md-8 col-xl-10">
                                                <p><b>안녕하세요 동양미래대 커뮤니티 사이트 개발자 Ysung입니다.</b></p>
                                                <p>
                                                	아직 학부생인 제가 만든 사이트 입니다. 그러므로 아직 홈페이지 곳곳에 버그가 존재할 수 있습니다.<br>
                                                	만약 버그를 발견하신다면 [<a href="report.do" style="color:royalblue"><b>제보하기</b></a>]를 통해 저에게 제보해주시면 신속하게 반영하도록 하겠습니다.<br>
                                                	저는 컴퓨터공학과지만 다른 학과에서도 사용할 수 있는 홈페이지를 만들면 어쩔까 하면서 만들게 된 사이트입니다.<br>
                                                	저의 취지에 맞게 너무 심한 장난글이나 비방글 조롱글등을 하지 않아주신다면 감사하겠습니다.<br>
                                                	모쪼록 즐겨주세요~! 감사합니다.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="navpills2-2" class="tab-pane">
                                        <div class="row align-items-center text-left">
                                            <div class="col-sm-6 col-md-4 col-xl-2">
                                                <img src="${pageContext.request.contextPath}/resources/images/date.png" alt="" class="img-fluid thumbnail m-r-15">
                                            </div>
                                            <div class="col-sm-6 col-md-8 col-xl-10">
                                                <p><b>홈페이지 제작 개발 툴에 대한 정보입니다.</b></p>
                                                <p>
                                                	홈페이지 기본적인 HTML CSS은 Visual Studio Code를 사용하였습니다.<br>
                                                	서버 페이지는 Eclipse JSP를 사용하였으며 JDK는 1.8버젼을 사용하였습니다.<br>
                                                	데이터베이스는 Mysql 8.0버젼을 이용하며 DB접근은 Connection Pool기법을 사용하였습니다.<br>
                                                	서버는 보편적인 Tomcat 8.5 버전을 사용하였습니다. <br>
                                                	인터넷 호스팅은 <span style="color:royalblue"><a href="http://cafe24.com">cafe24</a></span>의 JSP&Tomcat 저가형을 구매하여 호스팅하였습니다.
                                                
                                             	</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="navpills2-3" class="tab-pane">
                                        <div class="row align-items-center text-left">
                                            <div class="col-sm-6 col-md-4 col-xl-2">
                                               	<img src="${pageContext.request.contextPath}/resources/images/schedule.png" alt="" class="img-fluid thumbnail m-r-15">
                                            </div>
                                            <div class="col-sm-6 col-md-8 col-xl-10">
                                                <p><b>홈페이지 제작 개발 일정에 대한 정보입니다.</b></p>
                                                <p>
                                                	2020/08/02 ~ 2020/08/09 : HTML CSS 기본적인 틀 제작 <br>
                                                	2020/08/09 ~ 2020/08/12 : 유저 인터페이스 및 기능 구현 <br>
                                                	2020/08/12 ~ 2020/08/17 : 게시판 인터페이스 및 기능 구현 <br>
                                                	2020/08/17 ~ 2020/08/20 : 유저 추천 게시물 추천 기능 및 버그 수정 <br>
                                                	2020/08/20 ~ 현재 : 쪽지 기능 및 알림 기능 제작 중 <br>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="navpills2-4" class="tab-pane">
                                        <div class="row align-items-center text-left">
                                            <div class="col-sm-6 col-md-4 col-xl-2">
                                               	<img src="${pageContext.request.contextPath}/resources/images/sorce.png" alt="" class="img-fluid thumbnail m-r-15">
                                            </div>
                                            <div class="col-sm-6 col-md-8 col-xl-10">
                                                <p><b>홈페이지에 사용된 이미지 및 아이콘 출처 정보입니다.</b></p>
                                                <p>
                                                	아이콘 출처 : [<a href="https://www.flaticon.com/kr/authors/freepik" target="blank"><b><span style="color:royalblue">Freepik</span></b></a>]<br>
                                                	이미지 출처 : [<a href="https://www.flaticon.com/kr/authors/freepik" target="blank"><b><span style="color:royalblue">Freepik</span></b></a>]<br>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
							</div>
							<!-- /# card -->
						</div>
					</div>
					<%-- 
					<div class="col-12">
						<div class="card">
							<div class="p-4">
								<div class="card-title">
									<h4>공지사항</h4>
								</div>
								<div class="table-responsive">
									<table class="table table-hover text-center">
										<thead>
											<tr>
												<th>분류</th>
												<th>제목</th>
												<th>작성자</th>
												<th>날짜</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="notice" items="${notice}">
											<tr>
												<td>${notice.classType}</td>
												<td>${notice.title}</td>
												<td>
												<span class="badge badge-primary px-2">${notice.id}</span>
												</td>
												<td><fmt:formatDate value="${notice.date}" pattern="yyyy/MM/dd HH:mm" /></td>
												<td class="color-primary">${notice.lookup}</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- /# card -->
						</div>
					</div>
					--%>
					<div class="col-12">
						<div class="card">
							<div class="p-4">
								<div class="card-title">
									<h4>${major}</h4>
								</div>
								
								<div class="table-responsive">
									<table class="table table-hover text-center">
										<thead>
											<tr>
												<th style="width:6%">분류</th>
												<th style="width:40%">제목</th>
												<th style="width:20%">작성자</th>
												<th style="width:18%">날짜</th>
												<th style="width:8%">추천</th>
												<th style="width:8%">조회수</th>
											</tr>
										</thead>
										<tbody>
										<c:if test="${!empty majorList}">
											<c:forEach var="list" items="${majorList}">
												<tr>
													<td style="padding:0.5rem;">${list.classType}</td>
													<td style="padding:0.5rem;"><a href="bbsRead.do?major=${list.major}&number=${list.num}">
													<c:if test="${list.recomm + list.dis >= 10}">
														<span class="badge badge-primary">BEST</span>
													</c:if>
													<c:if test="${list.lookup >= 100}">
														<span class="badge badge-danger">인증글</span>
													</c:if>
														${list.title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "")}[<span style="color:blue">${list.comments}</span>]</a>
													</td>
													<td style="padding:0.5rem;">
														<div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${list.id}</div>
														<div class="dropdown-menu">
															<c:if test="${list.id != userId}">
																<a class="dropdown-item" href="bbsAction.do?major=유저글&user=${list.id}">사용자 글보기</a>
																<a class="dropdown-item" href="myComment.do?user=${list.id}">사용자 댓글보기</a>
															</c:if>
															<c:if test="${list.id == userId}">
																<a class="dropdown-item" href="bbsAction.do?major=내가 쓴글">내글 보기</a>
																<a class="dropdown-item" href="myComment.do">내 댓글보기</a>
                                        					</c:if>
                                        				</div>
													</td>
													<td><fmt:formatDate value="${list.date}" pattern="yyyy/MM/dd HH:mm" /></td>
													<td style="padding:0.5rem;" class="color-primary">${list.recomm}</td>
													<td style="padding:0.5rem;" class="color-primary">${list.lookup}</td>
												</tr>
											</c:forEach>
										</c:if>
										</tbody>
									</table>
								</div>
								<c:if test="${empty majorList}">
									<h4 class="text-center mt-2">
										<img src="${pageContext.request.contextPath}/resources/images/noComment.png"style="width: 4rem" alt="">
									</h4>
									<div class="mt-2 text-center">
										<p class="mb-0 mt-2" style="font-size: 1.3rem; font-weight: bold;">
										아직 작성된 글이 없어요..
										</p>
										<p class="login-form__footer text-right mb-0">
        									<a href="write.do?major=${major}" class="btn mb-1 btn-success">글쓰기</a>
        								</p>
									</div>
								</c:if>
							</div>
							<!-- /# card -->
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
<%@ include file="js.jsp"%>
</html>