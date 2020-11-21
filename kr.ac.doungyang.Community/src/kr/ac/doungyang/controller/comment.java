package kr.ac.doungyang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.doungyang.Community.model.bbs.bbsDao;
import kr.ac.doungyang.Community.model.coments.commentDao;
import kr.ac.doungyang.Community.model.coments.commentDto;
import kr.ac.doungyang.Community.model.event.eventDao;
import kr.ac.doungyang.Community.model.event.eventDto;

public class comment implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		
		bbsDao bDao = new bbsDao();
		commentDto cDto = new commentDto();
		commentDao cDao = new commentDao();
		eventDao eDao = new eventDao();
		eventDto eDto = new eventDto();
		
		int parent = -1;
		
		int number = Integer.parseInt(request.getParameter("number"));
		if(request.getParameter("parent") != null)
			parent = Integer.parseInt(request.getParameter("parent"));
		String id = (String)session.getAttribute("userId");
		String content = request.getParameter("content");
		String toid = request.getParameter("bbsid");
		
		cDto.setBbsid(number);
		cDto.setId(id);
		cDto.setContents(content);
		cDto.setParent(parent);
		
		
		int result = cDao.write(cDto);
		
		if(result == 1) {
			bDao.comment(number);
			eDto.setBbsid(number);
			eDto.setToid(toid);
			eDto.setFromid(id);
			eDao.insertEvent(eDto);
			forward.setRedirect(true);
			forward.setNextPage("bbsRead.do?number="+number);
		}else {
			forward.setRedirect(true);
			forward.setNextPage("bbsRead.do?number="+number);
		}
		return forward;
	}
}
