package kr.ac.doungyang.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.doungyang.Community.model.event.eventDao;
import kr.ac.doungyang.Community.model.event.eventDto;

public class Front extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public Front() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPocess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPocess(request, response);
	}
	
	public void doPocess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String requestUri = request.getRequestURI();
		int cmdLast = requestUri.lastIndexOf("/");
		String uri = requestUri.substring(cmdLast);
		String fristUri = "/kr.ac.doungyang.view/";
		ActionForward forward = null;
		Action action = null;
		
		try {
			/* .do 확장자 이동 처리  */
			/* 첫 화면 이동 처리  */
			if(uri.equals("/homeDo.do")) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"index.jsp");
			}
			/* 로그인 이동 처리  */
			if(uri.equals("/login.do")) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"login.jsp");
			}
			/* 회원가입 이동 처리  */
			else if(uri.equals("/join.do")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"join.jsp");
			}
			/* 비밀번호 찾기 이동 처리  */
			else if(uri.equals("/forget.do")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"forget_pw.jsp");
			}
			/* 비밀번호 수정 이동 처리  */
			else if(uri.equals("/forgetForm.do")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"forget_pw_update.jsp");
			}
			/* 내 정보 수정 이동 처리  */
			else if(uri.equals("/unlock.do")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"unlock.jsp");
			}
			/* 내 정보 수정 이동 처리  */
			else if(uri.equals("/info.do")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"info.jsp");
			}
			/* 내 정보 수정 이동 처리  */
			else if(uri.equals("/pwUpdate.do")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"pwUpdate.jsp");
			}
			/* 리포트 이메일 이동 처리  */
			else if(uri.equals("/report.do")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"report.jsp");
			}
			/* DB값 변경시 결과 화면 이동 처리  */
			if(uri.equals("/Result.do")) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"result.jsp");
			}
			/* DB값 변경시 결과 화면 이동 처리 비로그인상태  */
			if(uri.equals("/ResultNoneLogin.do")) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"resultNoneLogin.jsp");
			}	
			/* 회원삭제 -> 결과창 이동 처리  */
			else if(uri.equals("/deleteResult.do")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"deleteResult.jsp");
			}
			/* 자유게시판 이동 처리  */
			else if(uri.equals("/bbs.do")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"bbs.jsp");
			}
			/* 게시판 작성 이동 처리  */
			else if(uri.equals("/write.do")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"bbsWrite.jsp");
			}
			/* 게시판 읽기 이동 처리  */
			else if(uri.equals("/read.do")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"bbsRead.jsp");
			}
			/* 게시판 에러 이동 처리  */
			else if(uri.equals("/404.do")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"404.jsp");
			}
			/* 게시판 읽기 이동 처리  */
			else if(uri.equals("/update.do")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"bbsUpdate.jsp");
			}
			/* 내가 쓴 댓글 이동 처리  */
			else if(uri.equals("/meComment.do")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"myComment.jsp");
			}
			/* 프로필 사진 변경 폼 이동 처리  */
			else if(uri.equals("/profile.do")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"profile.jsp");
			}
			/* 프로필 사진 변경 결과 이동 처리  */
			else if(uri.equals("/profileAction.do")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"upload.jsp");
			}
			/* 프로필 사진 결과창 이동 처리 */
			else if(uri.equals("/profileRe.do")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"profileRe.jsp");
			}
			/* 우편 홈 화면 이동 처리 */
			else if(uri.equals("/postAction.do")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"posthome.jsp");
			}
			/* 우편 유저 이동 처리 */
			else if(uri.equals("/post.do")){
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setNextPage(fristUri+"post.jsp");
			}
			
			/*------ request 요청 처리 ---------*/
			
			/* 홈화면 처리  */
			else if(uri.equals("/home.do")) {	
				action = new home();
				forward = action.execute(request, response);
			}
			/* 회원가입 처리  */
			else if(uri.equals("/joinAction.do")) {	
				action = new userJoin();
				forward = action.execute(request, response);
			}
			/* 로그인 처리  */
			else if(uri.equals("/loginAction.do")) {	
				action = new login();
				forward = action.execute(request, response);
			}
			/* 로그아웃 처리  */
			else if(uri.equals("/logoutAction.do")) {	
				action = new logout();
				forward = action.execute(request, response);
			}
			/* 비밀번호 찾기 처리  */
			else if(uri.equals("/forgetAction.do")) {	
				action = new forget();
				forward = action.execute(request, response);
			}
			/* 비밀번호 찾기 -> 비밀번호 업데이트 처리  */
			else if(uri.equals("/forgetUpdatAction.do")) {	
				action = new forgetUpdate();
				forward = action.execute(request, response);
			}
			/* 내 정보 수정 -> 비밀번호 확인 처리  */
			else if(uri.equals("/unlockAction.do")) {	
				action = new unlock();
				forward = action.execute(request, response);
			}
			/* 내 정보 비밀번호 처리 -> 내 정보 가져옴  */
			else if(uri.equals("/infoAction.do")) {	
				action = new userInfo();
				forward = action.execute(request, response);
			}
			/* 이메일 보내기 처리  */
			else if(uri.equals("/sendReport.do")) {	
				action = new sendMailAction();
				forward = action.execute(request, response);
			}
			/* 회원 삭제 처리  */
			else if(uri.equals("/deleteUser.do")) {	
				action = new userDelete();
				forward = action.execute(request, response);
			}
			/* 비밀번호 수정 처리  */
			else if(uri.equals("/pwUpdateAction.do")) {	
				action = new userPwUpdate();
				forward = action.execute(request, response);
			}
			/* 자유 게시판, 학과 게시판 정보  */
			else if(uri.equals("/bbsAction.do")) {	
				action = new bbs();
				forward = action.execute(request, response);
			}
			/* 게시판 글 쓰기  */
			else if(uri.equals("/writeAction.do")) {	
				action = new write();
				forward = action.execute(request, response);
			}
			/* 게시판 글 보기  */
			else if(uri.equals("/bbsRead.do")) {	
				action = new bbsRead();
				forward = action.execute(request, response);
			}
			/* 게시판 글 삭제  */
			else if(uri.equals("/bbsDel.do")) {	
				action = new bbsDelete();
				forward = action.execute(request, response);
			}
			/* 게시판 글 수정  */
			else if(uri.equals("/bbsUpdate.do")) {	
				action = new bbsUpdateGetData();
				forward = action.execute(request, response);
			}
			/* 게시판 글 수정 처리  */
			else if(uri.equals("/bbsUpdateDo.do")) {	
				action = new bbsUpdateDo();
				forward = action.execute(request, response);
			}
			/* 게시판 글 추천 처리  */
			else if(uri.equals("/recomm.do")) {	
				action = new bbsRecomm();
				forward = action.execute(request, response);
			}
			/* 유저 추천 처리  */
			else if(uri.equals("/userRecomm.do")) {	
				action = new userRecomm();
				forward = action.execute(request, response);
			}
			/* 게시판 댓글 작성 처리  */
			else if(uri.equals("/comment.do")) {	
				action = new comment();
				forward = action.execute(request, response);
			}
			/* 게시판 댓글 추천 처리  */
			else if(uri.equals("/commentRecomm.do")) {	
				action = new commentRecomm();
				forward = action.execute(request, response);
			}
			/* 게시판 댓글 업데이트 처리  */
			else if(uri.equals("/commentUpdate.do")) {	
				action = new commentUpdate();
				forward = action.execute(request, response);
			}
			/* 게시판 댓글 삭제 처리  */
			else if(uri.equals("/commentDelete.do")) {	
				action = new commentDelete();
				forward = action.execute(request, response);
			}
			/* 내 정보 내가 쓴 댓글 처리  */
			else if(uri.equals("/myComment.do")) {	
				action = new myComment();
				forward = action.execute(request, response);
			}
			/* 프로필 설정  */
			else if(uri.equals("/profileDo.do")) {	
				action = new profile();
				forward = action.execute(request, response);
			}
			/* 우편 홈 이동 */
			else if(uri.equals("/postHome.do")) {	
				action = new postHome();
				forward = action.execute(request, response);
			}
			/* 우편 유저 이동 */
			else if(uri.equals("/postUser.do")) {	
				action = new postUser();
				forward = action.execute(request, response);
			}
			/* 우편 쓰기 이동 */
			else if(uri.equals("/postWrite.do")) {	
				action = new postWrite();
				forward = action.execute(request, response);
			}
			/* 우편 삭제 이동 */
			else if(uri.equals("/postDelete.do")) {	
				action = new postDelete();
				forward = action.execute(request, response);
			}
			/* 우편홈 전체 삭제 이동 */
			else if(uri.equals("/postDeleteAll.do")) {	
				action = new postDeleteAll();
				forward = action.execute(request, response);
			}
			/* Redirect & forward 처리  */
			// 네이게이션 알람 
			eventDao eDao = new eventDao();
			ArrayList<eventDto> event = eDao.getEevent((String)request.getSession().getAttribute("userId"));
			request.setAttribute("event", event);
			ArrayList<eventDto> emailEvent = eDao.getEmailEevent((String)request.getSession().getAttribute("userId"));
			request.setAttribute("emailEvent", emailEvent);
			// 네비 알
			if(forward != null) {
				if(forward.isRedirect()) {
					response.sendRedirect(forward.getNextPage());
				} else {
					RequestDispatcher rqdp = request.getRequestDispatcher(forward.getNextPage());
					rqdp.forward(request, response);
				}
			}
		}catch(Exception e) {
			
		}
	}

}
