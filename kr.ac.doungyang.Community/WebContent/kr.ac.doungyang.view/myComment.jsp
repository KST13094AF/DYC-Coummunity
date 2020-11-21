<%@page import="kr.ac.doungyang.Community.model.bbs.bbsDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% 
@SuppressWarnings("unchecked")
ArrayList<bbsDto> list = (ArrayList<bbsDto>)request.getAttribute("bbsList");

int dataNum = 0, nowPage = 0, startPage = 0, endPage = 0;
if(request.getAttribute("bbsList") != null){
	dataNum = (Integer) request.getAttribute("dataNum");
	nowPage = (Integer) request.getAttribute("page");
	startPage = (Integer) request.getAttribute("startPage");
	endPage = (Integer) request.getAttribute("endPage");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>내 댓글</title>
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
							<c:if test="${empty param.user}">
								<li class="breadcrumb-item">내 정보</li>
								<li class="breadcrumb-item active"><b>내가 쓴 댓글</b></li>
							</c:if>
							<c:if test="${!empty param.user}"> 
								<li class="breadcrumb-item">유저 검색</li>
								<li class="breadcrumb-item active"><b>[${param.user}]댓글</b></li>
							</c:if>
						</ol>
					</div>
				</div>
				<div class="row">
					<c:if test="${!empty param.user}">
					<div class="col-lg-12">
						<div class="card">
                            <div class="p-4">
                                    <div class="media align-items-center">
                                    	<img class="mr-4" src="${pageContext.request.contextPath}/profile/${userInfo.profile}" width="80" height="80" alt="">
                                    <div class="media-body">
                                        <span class="mb-0 h4">${param.user }</span>
                                        <c:choose>
                                        	<c:when test="${userInfo.maner < 10}">
                                       	 		<span style="color:gray" class="ml-2">(일반유저)</span>
                                        	</c:when>
                                        	<c:when test="${userInfo.maner >= 10 and userInfo.maner < 20}">
                                       	 		<span style="color:blue" class="ml-2">(매너유저)</span>
                                        	</c:when>
                                        	<c:when test="${userInfo.maner >= 30}">
                                       	 		<span style="color:tomato" class="ml-2">(인증유저)</span>
                                        	</c:when>
                                        </c:choose>
                                        <p class="text-muted mb-3">${userInfo.major}</p>
                                        <p style="margin:0rem">
                                        	<span class="mr-3">게시물: ${userBbs}</span>
                                       		<span class="mr-3">댓글: ${userComments}</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:if>
					<div class="col-12">
						<div class="card">
							<div class="p-4">
								<div class="card-title">
									<c:if test="${empty param.user}">
										<h4>내가 쓴 댓글</h4>
									</c:if>
									<c:if test="${!empty param.user}"> 
									<h4>댓글검색: <span style="color:cornflowerblue">[${param.user}]</span></h4>
									</c:if>
								</div>
								<hr>
								<c:if test="${notList != -1}">
								<div class="table-responsive">
									<table class="table text-center">
										<thead>
											<tr>
												<th style="width:18%">게시판</th>
												<th style="width:42%">제목</th>
												<th style="width:15%">작성자</th>
												<th style="width:18%">날짜</th>
												<th style="width:7%">추천</th>
											</tr>
										</thead>
										<tbody>
										<% 
										int maxPage = nowPage * 10;
										int size = list.size();
										int start = (nowPage-1)*10;
										if(size < maxPage){
											maxPage = size;
										}
										%>
										<c:forEach var="list" items="${bbsList}" begin="<%=start%>" end="<%=maxPage-1%>">
										<c:if test="${bbsList != null}">
											<tr style="background-color:antiquewhite">
												<td style="padding:0.5rem;">${list.major}</td>
												<td style="padding:0.5rem;"><a href="bbsRead.do?major=${list.major}&number=${list.num}">
												<c:if test="${list.recomm + list.dis >= 10 }">
													<span class="badge badge-primary">BEST</span>
												</c:if>
												<c:if test="${list.lookup >= 100}>">
													<span class="badge badge-danger">인증글</span>
												</c:if>
												${list.title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "")}[<span style="color:blue">${list.comments}</span>]</a>
												</td>
												<td style="padding:0.5rem;">
													<div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${list.id}</div>
													<div class="dropdown-menu">
													<c:choose>
														<c:when test="${list.id != userId}">
															<a class="dropdown-item" href="bbsAction.do?major=유저글&user=${list.id}">사용자 글보기</a>
															<a class="dropdown-item" href="myComment.do?user=${list.id}">사용자 댓글보기</a>
															<a class="dropdown-item" href="post.do?user=${list.id}">쪽지보내기</a>
														</c:when>
														<c:otherwise>
															<a class="dropdown-item" href="bbsAction.do?major=내가 쓴글">내글 보기</a>
															<a class="dropdown-item" href="myComment.do">내 댓글보기</a>
														</c:otherwise>
													</c:choose>
                                        			</div>
												</td>
												<td><fmt:formatDate value="${list.date}" pattern="MM/dd HH:mm" /></td>
												<td>${list.recomm}</td>
											</tr>
											<c:forEach var="comment" items="${commentList}">
												<c:if test="${comment.bbsid == list.num}">
													<tr>
													<td colspan="4" class="text-left ml-3">└> <span>${comment.id}</span>  :
													<span class="ml-2">${comment.contents.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "")}</span>
													<span class="ml-3">[<fmt:formatDate value="${comment.date}" pattern="yyyy-MM-dd HH:mm" />]</span>
													</td>
													<td class="text-center">
													<span class="badge badge-primary">추천 ${comment.recomm}</span>
													</td>
													</tr>
												</c:if>
											</c:forEach>
											</c:if>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="button-group text-center mt-4">
                                    <div class="btn-toobar" style="display:inline-flex">
                                    <c:choose>
                                    <c:when test="${empty param.user}">
                                    	<c:choose>
                                    		<c:when test="${page-1 le 0}"><span class="btn btn-primary">이전</span></c:when>
                                    		<c:otherwise><a href="myComment.do?page=<%=nowPage-1%>"><button type="button" class="btn btn-primary">이전</button></a></c:otherwise>
                                    	</c:choose>
                                    	<% for(int i=startPage; i<=endPage; i++) { %>
                                    	<c:choose>
                                    		<c:when test="<%=nowPage == i %>"><button type="button" class="btn btn-primary" style="background:royalblue"><%=i%></button></c:when>
                                    		<c:otherwise><a href="myComment.do?page=<%= i %>"><button type="button" class="btn btn-primary"><%=i%></button></a></c:otherwise>
                                    	</c:choose>
                                    	<% } %>
                                    	<c:choose>
                                    		<c:when test="${page ge maxPage}"><span class="btn btn-primary">다음</span></c:when>
                                    		<c:otherwise><a href="myComment.do?page=<%=nowPage+1%>"><button type="button" class="btn btn-primary">다음</button></a></c:otherwise>
                                    	</c:choose>
                                    </c:when>
                                    <c:otherwise>
                                    	<c:choose>
                                    		<c:when test="${page-1 le 0}"><span class="btn btn-primary">이전</span></c:when>
                                    		<c:otherwise><a href="myComment.do?user=<%=request.getParameter("user")%>&page=<%=nowPage-1%>"><button type="button" class="btn btn-primary">이전</button></a></c:otherwise>
                                    	</c:choose>
                                    	<% for(int i=startPage; i<=endPage; i++) { %>
                                    	<c:choose>
                                    		<c:when test="<%=nowPage == i %>"><button type="button" class="btn btn-primary" style="background:royalblue"><%=i%></button></c:when>
                                    		<c:otherwise><a href="myComment.do?user=<%=request.getParameter("user")%>&page=<%= i %>"><button type="button" class="btn btn-primary"><%=i%></button></a></c:otherwise>
                                    	</c:choose>
                                    	<% } %>
                                    	<c:choose>
                                    		<c:when test="${page ge maxPage}"><span class="btn btn-primary">다음</span></c:when>
                                    		<c:otherwise><a href="myComment.do?user=<%=request.getParameter("user")%>&page=<%=nowPage+1%>"><button type="button" class="btn btn-primary">다음</button></a></c:otherwise>
                                    	</c:choose>
                                    </c:otherwise>
                                    </c:choose>
                                    </div>
                                </div>
								</c:if>
								<c:if test="${notList eq -1}">
									<h4 class="text-center mt-5">
										<img src="${pageContext.request.contextPath}/resources/images/noComment.png"style="width: 7rem" alt="">
									</h4>
										<div class="mt-5 mb-5 text-center">
											<p style="font-size: 1.3rem; font-weight: bold;">
											앗!<br>아직 작성하신 댓글이 없어요.
											</p>
										<p class="login-form__footer text-right">
        									<a href="home.do" class="btn mb-1 btn-success">홈으로</a>
        								</p>
									</div>
								</c:if>
								</div>
							</div>
							<!-- /# card -->
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