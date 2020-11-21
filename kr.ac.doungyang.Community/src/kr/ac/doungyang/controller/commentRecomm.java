package kr.ac.doungyang.controller;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.doungyang.Community.model.coments.commentDao;
import kr.ac.doungyang.controller.model.likey.likeyDao;
import kr.ac.doungyang.controller.model.likey.likeyDto;
public class commentRecomm implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		InetAddress ip = InetAddress.getLocalHost();
		String realIp = ip.getHostAddress();
		
		commentDao cDao = new commentDao();
		likeyDao lDao = new likeyDao();
		
		int number = Integer.parseInt(request.getParameter("number"));
		String num = request.getParameter("recomm");
		String commentId = request.getParameter("commentId");
		
		likeyDto lDto = new likeyDto();
		lDto.setNum(Integer.parseInt(num));
		lDto.setId((String)session.getAttribute("userId"));
		lDto.setEvalid(commentId);
		lDto.setIp(realIp);
		
		int result = lDao.likey(lDto);
		
		if(num.equals("5") && result != 0) {	
			cDao.recommed(commentId);
			forward.setRedirect(false);
			forward.setNextPage("bbsRead.do?number="+number);
		}else {
			request.setAttribute("likeyResult", 0);
			forward.setRedirect(false);
			forward.setNextPage("Result.do?number="+number);
		}

		return forward;
	}
}
