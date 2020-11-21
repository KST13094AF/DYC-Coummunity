package kr.ac.doungyang.controller;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.doungyang.Community.model.user.userDao;
import kr.ac.doungyang.controller.model.likey.likeyDao;
import kr.ac.doungyang.controller.model.likey.likeyDto;
public class userRecomm implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		InetAddress ip = InetAddress.getLocalHost();
		String realIp = ip.getHostAddress();
		
		userDao uDao = new userDao();
		likeyDao lDao = new likeyDao();
		
		int number = Integer.parseInt(request.getParameter("number"));
		String num = request.getParameter("recomm");
		String bbsId = request.getParameter("bbsId");
		
		likeyDto lDto = new likeyDto();
		lDto.setNum(Integer.parseInt(num));
		lDto.setId((String)session.getAttribute("userId"));
		lDto.setEvalid(bbsId);
		lDto.setIp(realIp);
		
		int result = lDao.likey(lDto);
		
		if(num.equals("3") && result != 0) {	
			uDao.recommed(bbsId);
			forward.setRedirect(false);
			forward.setNextPage("bbsRead.do?number="+number);
		}else if(num.equals("4") && result != 0) {
			uDao.disRecommed(bbsId);
			forward.setRedirect(false);
			forward.setNextPage("bbsRead.do?number="+number);
		}else if(num.equals("3")) {
			request.setAttribute("likeyResult", 1);
			forward.setRedirect(false);
			forward.setNextPage("Result.do?number="+number);
		}else if(num.equals("4")) {
			request.setAttribute("likeyResult", 2);
			forward.setRedirect(false);
			forward.setNextPage("Result.do?number="+number);
		}

		return forward;
	}
}
