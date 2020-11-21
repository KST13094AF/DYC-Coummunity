package kr.ac.doungyang.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.doungyang.Community.model.bbs.bbsDao;
import kr.ac.doungyang.Community.model.bbs.bbsDto;
import kr.ac.doungyang.Community.model.coments.commentDao;
import kr.ac.doungyang.Community.model.coments.commentDto;
import kr.ac.doungyang.Community.model.event.eventDao;
import kr.ac.doungyang.Community.model.user.userDao;
import kr.ac.doungyang.Community.model.user.userDto;

public class bbsRead implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		ArrayList<commentDto> comment = new ArrayList<commentDto>();
		bbsDao bDao = new bbsDao();
		userDao uDao = new userDao();
		commentDao cDao = new commentDao();
		commentDto cDto = new commentDto();
		eventDao eDao = new eventDao();
		
		String major;
		int number = Integer.parseInt(request.getParameter("number"));
		int result = bDao.exist(number);
		int next, pre;
		
		if(result != 0) {
			bDao.lookup(number);
			eDao.eventRead(number, (String)request.getSession().getAttribute("userId"));
			bbsDto bDto = bDao.read(number);
			if(bDto == null) {
				forward.setRedirect(true);
				forward.setNextPage("404.do");
			}
			userDto uDto = uDao.getMajor(bDto.getId());
			comment = cDao.getComments(number);
			cDto = cDao.getBestComment(number);
			major = bDao.getMajor(number);
			next = bDao.getNext(number, major);
			pre = bDao.getPre(number, major);
			request.setAttribute("bbsRead", bDto);
			request.setAttribute("bestComment", cDto);
			request.setAttribute("user", uDto);
			request.setAttribute("comment", comment);
			request.setAttribute("next", next);
			request.setAttribute("pre", pre);
			forward.setRedirect(false);
			forward.setNextPage("read.do");
		}else {
			forward.setRedirect(true);
			forward.setNextPage("404.do");
		}
		return forward;
	}
}
