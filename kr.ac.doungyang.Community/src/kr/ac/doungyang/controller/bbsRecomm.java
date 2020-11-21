package kr.ac.doungyang.controller;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.doungyang.Community.model.bbs.bbsDao;
import kr.ac.doungyang.controller.model.likey.likeyDao;
import kr.ac.doungyang.controller.model.likey.likeyDto;
public class bbsRecomm implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		InetAddress ip = InetAddress.getLocalHost();
		String realIp = ip.getHostAddress();
		
		bbsDao bDao = new bbsDao();
		likeyDao lDao = new likeyDao();
		
		String number = request.getParameter("number");
		String num = request.getParameter("recomm");
		
		likeyDto lDto = new likeyDto();
		lDto.setNum(Integer.parseInt(num));
		lDto.setId((String)session.getAttribute("userId"));
		lDto.setEvalid(number);
		lDto.setIp(realIp);
		
		int result = lDao.likey(lDto);
		
		if(num.equals("1") && result != 0) {	
			bDao.recommed(number);
			forward.setRedirect(true);
			forward.setNextPage("bbsRead.do?number="+number);
		}else if(num.equals("2") && result != 0) {
			bDao.disRecommed(number);
			forward.setRedirect(true);
			forward.setNextPage("bbsRead.do?number="+number);
		}else {
			request.setAttribute("likeyResult", 0);
			forward.setRedirect(false);
			forward.setNextPage("Result.do?number="+number);
		}

		return forward;
	}
}
