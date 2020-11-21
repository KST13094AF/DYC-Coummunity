<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page errorPage="404.jsp" %>
<% 
int  nowPage = 0, startPage = 0, endPage = 0, my = 0;

if(request.getAttribute("bbsList") != null){
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
<title><%=request.getParameter("major")%></title>
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
							<c:if test="${stat ne 1}">
								<li class="breadcrumb-item">게시판</li>
							</c:if>
							<c:if test="${!empty param.depart}">
								<li class="breadcrumb-item">${param.depart}</li>
							</c:if>
							<c:if test="${empty param.user}">
								<li class="breadcrumb-item active"><b>${param.major}</b></li>
							</c:if>
							<c:if test="${!empty param.user}"> 
								<li class="breadcrumb-item">유저 검색</li>
								<li class="breadcrumb-item active"><b>[${param.user}]글 검색</b></li>
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
						<div class="card mb-2">
							<div class="p-4">
								<div class="card-title">
									<h4>${param.major} 
									<c:if test="${stat eq 2}">검색: 
									<span style="color:cornflowerblue">[${param.user}]</span>
									</c:if>
									<c:if test="${stat eq 3}">
									<span style="color:cornflowerblue">[${param.type}]</span>
									</c:if>
									<c:if test="${stat eq 4}">검색: 
									<span style="color:cornflowerblue">[${param.query}]</span>
									</c:if>
									</h4>
								</div>
								<hr>
								<c:if test="${notList ne -1 and myNotList ne -1}">
								<c:if test="${stat ne 2 and stat ne 1}">
									<p class="login-form__footer text-left m-0">
                             			<a href="bbsAction.do?major=${param.major}&type=인증글" class="btn mb-1 btn-danger">인증글</a>
                             			<a href="bbsAction.do?major=${param.major}&type=베스트" class="btn mb-1 ml-2 btn-info">베스트</a>
										<c:if test="${param.type != null}">
											<a href="bbsAction.do?major=${param.major}" class="btn mb-1 ml-2 btn-primary">전체글</a>
										</c:if>
                              	  	</p>
                                </c:if>
								<div class="table-responsive">
									<table class="table table-striped text-center">
										<thead>
											<tr>
												<th style="width:6%">분류</th>
												<th style="width:40%">제목</th>
												<c:choose>
													<c:when test="${stat ne 1}">
														<th style="width:20%">작성자</th>
                                        			</c:when>
                                        			<c:otherwise>
                                        				<th style="width:20%">게시판</th>
                                        			</c:otherwise>
												</c:choose>
												<th style="width:18%">날짜</th>
												<th style="width:8%">추천</th>
												<th style="width:8%">조회수</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach var="i" items="${bbsList}">
											<tr>
												<td style="padding:0.5rem;">${i.classType}</td>
												<td style="padding:0.5rem;"><a href="bbsRead.do?major=${i.major}&number=${i.num}">
												<c:if test="${i.recomm + i.dis >= 10}">
													<span class="badge badge-primary">BEST</span>
												</c:if>
												<c:if test="${i.lookup >= 100}">
													<span class="badge badge-danger">인증글</span>
												</c:if>
												${i.title.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "")}[<span style="color:blue">${i.comments}</span>]</a>
												</td>
												<c:choose>
													<c:when test="${stat ne 1}">
														<td style="padding:0.5rem;">
														<div class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${i.id}</div>
															<div class="dropdown-menu">
																<c:choose>
																<c:when test="${i.id ne userId}">
																	<a class="dropdown-item" href="bbsAction.do?major=유저글&user=${i.id}">사용자 글보기</a>
																	<a class="dropdown-item" href="myComment.do?user=${i.id}">사용자 댓글보기</a>
																	<a class="dropdown-item" href="postUser.do?user=${i.id}">쪽지보내기</a>
																</c:when>
																<c:otherwise>
																	<a class="dropdown-item" href="bbsAction.do?major=내가 쓴글">내글 보기</a>
																	<a class="dropdown-item" href="myComment.do">내 댓글보기</a>
                                        						</c:otherwise>
                                        						</c:choose>
                                        					</div>
														</td>
                                        			</c:when>
                                        			<c:otherwise>
                                        				<td style="padding:0.5rem;">${i.major}</td>
                                        			</c:otherwise>
												</c:choose>
												<td><fmt:formatDate value="${i.date}" pattern="yy/MM/dd HH:mm" /></td>
												<td style="padding:0.5rem;" class="color-primary">${i.recomm}</td>
												<td style="padding:0.5rem;" class="color-primary">${i.lookup}</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
									<c:if test="${stat eq 0}">
									<p class="login-form__footer text-right">
                             			<a href="write.do?depart=${param.depart}&major=${param.major}" class="btn mb-1 btn-success">글 쓰기</a>
                                	</p>
                                	</c:if>
									<div class="button-group text-center mt-4">
                                    <div class="btn-toobar" style="display:inline-flex">
                                    
                                    <c:choose>
                                    	<c:when test="${stat eq 0}">
                                    		<c:set var="uri" value="bbsAction.do?major=${param.major}&"/>
                                    	</c:when>
                                    	<c:when test="${stat eq 1}">
                                    		<c:set var="uri" value="bbsAction.do?major=${param.major}&"/>
                                    	</c:when>
                                    	<c:when test="${stat eq 2}">
                                    		<c:set var="uri" value="bbsAction.do?major=${param.major}&user=${param.user}&"/>
                                    	</c:when>
                                    	<c:when test="${stat eq 3}">
                                    		<c:set var="uri" value="bbsAction.do?major=${param.major}&type=${param.type}&"/>
                                    	</c:when>
                                    	<c:when test="${stat eq 4}">
                                    		<c:set var="uri" value="bbsAction.do?depart=${param.depart}&major=${param.major}&search=${param.search}&query=${param.query}&"/>
                                    	</c:when>
                                    </c:choose>
                                   		<c:choose>
                                    		<c:when test="${page le 1}"><span class="btn btn-primary">이전</span></c:when>
                                    		<c:otherwise><a href="${uri}page=<%=nowPage-1%>"><button type="button" class="btn btn-primary">이전</button></a></c:otherwise>
                                    	</c:choose>
                                    	<% for(int i=startPage; i<=endPage; i++) { %>
                                    	<c:choose>
                                    		<c:when test="<%=nowPage == i %>"><button type="button" class="btn btn-primary" style="background:royalblue"><%=i%></button></c:when>
                                    		<c:otherwise><a href="${uri}page=<%= i %>"><button type="button" class="btn btn-primary"><%=i%></button></a></c:otherwise>
                                    	</c:choose>
                                    	<% } %>
                                    	<c:choose>
                                    		<c:when test="${page ge maxPage}"><span class="btn btn-primary">다음</span></c:when>
                                    		<c:otherwise><a href="${uri}page=<%=nowPage+1%>"><button type="button" class="btn btn-primary">다음</button></a></c:otherwise>
                                    	</c:choose>
                                    </div>
                                </div>
								</div>
								</c:if>
								<c:if test="${notList eq -1}">
									<h4 class="text-center mt-5">
										<img src="${pageContext.request.contextPath}/resources/images/noData.png"style="width: 7rem" alt="">
									</h4>
									<div class="mt-5 mb-3 text-center">
										<c:choose>
											<c:when test="${stat ne 3}">
												<p style="font-size: 1.3rem; font-weight: bold;">
												앗!<br>아직 작성된 글이 없나봐요...
												</p>
												<p class="login-form__footer text-right m-0">
        											<a href="write.do?depart=${param.depart}&major=${param.major}" class="btn mb-1 btn-success">글 쓰기</a>
        										</p>
        									</c:when>
        									<c:otherwise>
        										<p style="font-size: 1.3rem; font-weight: bold;">
												앗!<br>아직 좋은글이 없나보네요..
												</p>
        										<p class="login-form__footer text-right m-0">
        											<a href="javascript:history.back(-1);" class="btn mb-1 btn-success">전체글</a>
        										</p>
        									</c:otherwise>
        								</c:choose>
									</div>
								</c:if>
								<c:if test="${myNotList eq -1}">
									<h4 class="text-center mt-5">
										<img src="${pageContext.request.contextPath}/resources/images/noComment.png"style="width: 7rem" alt="">
									</h4>
									<div class="mt-5 mb-3 text-center">
										<p style="font-size: 1.3rem; font-weight: bold;">
										앗!<br>아직 작성하신 글이 없어요.
										</p>
										<p class="login-form__footer text-right">
        									<a href="home.do" class="btn mb-1 btn-success">홈으로</a>
        								</p>
									</div>
								</c:if>
							</div>
							<!-- /# card -->
							</div>
						</div>
						<c:if test="${stat ne 1}">
						<div class="col-12">
							<div class="card p-2" style="float:right">
								<form method="post" action="bbsAction.do?depart=${param.depart}&major=${param.major}">
                                    <select class="custom-select mr-sm-2" name="search" style="width:auto;" required>
                                        <option value="" selected="selected">선택</option>
                                        <option value="1">제목+내용</option>
                                        <option value="2">작성자</option>
                                    </select>
									<input type="text" name="query" required class="form-control input-default mr-sm-2" style="display:inline; width:auto; height:auto" placeholder="검색">
									<input type="submit" class="btn btn-primary" value="검색">
                              	</form>
                            </div>
                       </div>
                       </c:if>
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