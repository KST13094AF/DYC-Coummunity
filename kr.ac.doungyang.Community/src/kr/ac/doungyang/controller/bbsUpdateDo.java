package kr.ac.doungyang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.doungyang.Community.model.bbs.bbsDao;
import kr.ac.doungyang.Community.model.bbs.bbsDto;

public class bbsUpdateDo implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		
		bbsDao bDao = new bbsDao();
		bbsDto bDto = new bbsDto();
		
		int number = Integer.parseInt(request.getParameter("number"));
		String id = (String)session.getAttribute("userId");
		String classType = request.getParameter("class");
		String major = request.getParameter("major");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		bDto.setNum(number);
		bDto.setId(id);
		bDto.setClassType(classType);
		bDto.setMajor(major);
		bDto.setTitle(title);
		bDto.setContent(content);
		
		int result = bDao.update(bDto);
		
		if(result == 1) {
			request.setAttribute("updateDoReuslt", 1);
			forward.setRedirect(false);
			forward.setNextPage("Result.do?number="+number);
		}else{
			request.setAttribute("updateDoReuslt", 0);
			forward.setRedirect(false);
			forward.setNextPage("Result.do?number="+number);
		}
		return forward;
	}
}
