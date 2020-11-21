package kr.ac.doungyang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.doungyang.Community.model.event.eventDao;
import kr.ac.doungyang.Community.model.post.postDao;
import kr.ac.doungyang.Community.model.post.postDto;
public class postWrite implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();

		String fromid = (String)session.getAttribute("userId");
		String toid = request.getParameter("toid");
		String content = request.getParameter("content");
		
		eventDao eDao = new eventDao();
		postDao pDao = new postDao();
		postDto pDto = new postDto();
		pDto.setToid(toid);
		pDto.setFromid(fromid);
		pDto.setContent(content);
		
		int result = pDao.writePost(pDto);
		
		if(result != 0) {
			eDao.insertEvent(toid, fromid);
			forward.setRedirect(true);
			forward.setNextPage("postUser.do?user="+toid);
		}else {
			request.setAttribute("postWriteRe", -1);
			forward.setRedirect(false);
			forward.setNextPage("Result.do");
		}
		
		return forward;
	}
}
