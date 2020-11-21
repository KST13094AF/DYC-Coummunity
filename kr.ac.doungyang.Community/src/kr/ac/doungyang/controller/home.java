package kr.ac.doungyang.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.doungyang.Community.model.bbs.bbsDao;
import kr.ac.doungyang.Community.model.bbs.bbsDto;
import kr.ac.doungyang.Community.model.notice.noticeDao;
import kr.ac.doungyang.Community.model.notice.noticeDto;
import kr.ac.doungyang.Community.model.user.userDao;

public class home implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		String userId = (String)request.getSession().getAttribute("userId");
		bbsDao bDao = new bbsDao();
		userDao uDao = new userDao();
		noticeDao nDao = new noticeDao();
		
		String major = uDao.getUserMajor(userId);
		ArrayList<bbsDto> list = bDao.getMain(major);
		ArrayList<noticeDto> notice = nDao.getMain();
		
		
		request.setAttribute("major", major);
		request.setAttribute("majorList", list);
		request.setAttribute("notice", notice);
		forward.setNextPage("homeDo.do");
		forward.setRedirect(false);
		
		return forward;
	}
}
