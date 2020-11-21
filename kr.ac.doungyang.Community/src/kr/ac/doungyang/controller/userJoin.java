package kr.ac.doungyang.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.doungyang.Community.model.user.userDao;
import kr.ac.doungyang.Community.model.user.userDto;

public class userJoin implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		userDao uDao = new userDao();
		userDto uDto = new userDto();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String number = request.getParameter("number");
		String major = request.getParameter("major");
		String email = request.getParameter("email");
		
		uDto.setId(id);
		uDto.setPw(pw);
		uDto.setNumber(number);
		uDto.setMajor(major);
		uDto.setEmail(email);
		
		int result = uDao.join(uDto);
		
		if(result == 1) {
			forward.setRedirect(true);
			forward.setNextPage("login.do");
		}else {
			request.setAttribute("joinFail", 0);
			forward.setRedirect(false);
			forward.setNextPage("ResultNoneLogin.do");
		}
		return forward;
	}
}
