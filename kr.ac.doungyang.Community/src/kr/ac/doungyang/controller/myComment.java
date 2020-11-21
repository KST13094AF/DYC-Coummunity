package kr.ac.doungyang.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.doungyang.Community.model.bbs.bbsDao;
import kr.ac.doungyang.Community.model.bbs.bbsDto;
import kr.ac.doungyang.Community.model.coments.commentDao;
import kr.ac.doungyang.Community.model.coments.commentDto;
import kr.ac.doungyang.Community.model.user.userDao;

public class myComment implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		bbsDao bDao = new bbsDao();
		commentDao cDao = new commentDao();
		int page = 1;
		if(request.getParameter("page")!= null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String id = (String)request.getSession().getAttribute("userId");
		if(request.getParameter("user") != null) {
			id = request.getParameter("user");
			userDao uDao = new userDao();
			id = request.getParameter("user");
			request.setAttribute("userBbs", bDao.getRecode("id", id));
			request.setAttribute("userComments", cDao.getUserComment(id));
			request.setAttribute("userInfo", uDao.getMajor(id));
		}
		
		ArrayList<commentDto> commentList = cDao.getBbsId(id);
		Set<Integer> bbsid = new HashSet<>();
		
		for(int i=0; i<commentList.size(); i++) {
			bbsid.add(commentList.get(i).getBbsid());
		}
		
		ArrayList<bbsDto> list = new ArrayList<bbsDto>();
		Iterator<Integer> idList = bbsid.iterator();
		while(idList.hasNext()) {
			list.add(bDao.getMyCommentList(idList.next()));
		}
		int dataNum = 0;
		dataNum = list.size();
		
		int maxPage = (int)((double)dataNum / 10 + 0.95);
		int startPage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = maxPage;
		if(endPage > maxPage + 10 - 1) {
			endPage = startPage + 10 - 1;
		}
		if(dataNum > 0) {
			request.setAttribute("bbsList", list);
			request.setAttribute("commentList", commentList);
			request.setAttribute("page", page);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("dataNum", dataNum);
			forward.setRedirect(false);
			forward.setNextPage("meComment.do");
		}else if(dataNum <= 0) {
			request.setAttribute("notList", -1);
			forward.setRedirect(false);
			forward.setNextPage("meComment.do");
		}
		return forward;
	}
}
