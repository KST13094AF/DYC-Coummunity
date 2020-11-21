package kr.ac.doungyang.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.doungyang.Community.model.bbs.bbsDao;
import kr.ac.doungyang.Community.model.bbs.bbsDto;
import kr.ac.doungyang.Community.model.coments.commentDao;
import kr.ac.doungyang.Community.model.user.userDao;

public class bbs implements Action{
	String majors[] = {"자유게시판", "컴퓨터공학과","컴퓨터소프트웨어공학과","전기공학과","정보전자공학과","반도체전자공학과","정보통신공학과","자동화공학과",
			"로봇공학과","기계공학과","기계설계공학과","생명화학공학과","식품공학과","건축과","실내환경디자인과","시각정보디자인과","경영학과","세무회계학과",
			"유통마케팅학과","관광컨벤션학과","경영정보학과","공학부","경영학부","교양과","수업교환", "취미공유","내가 쓴글","유저글"};
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		bbsDao bDao = new bbsDao();	
		
		int page = 1;
		String type = null, search = null, query = null;
		if(request.getParameter("page")!= null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		if(request.getParameter("type")!= null) {
			type = request.getParameter("type");
		}
		if(request.getParameter("search")!= null) {
			search = request.getParameter("search");
			query = request.getParameter("query");
		}
		
		String major = request.getParameter("major");
		
		String id = (String)request.getSession().getAttribute("userId");
		if(request.getParameter("user") != null) {
			commentDao cDao = new commentDao();
			userDao uDao = new userDao();
			id = request.getParameter("user");
			request.setAttribute("userBbs", bDao.getRecode("id", id));
			request.setAttribute("userComments", cDao.getUserComment(id));
			request.setAttribute("userInfo", uDao.getMajor(id));
		}
		int i = 0;
		for(String m : majors) {
			if(major.equals(m))
				i = 1;
		}
		if(i != 1) {
			forward.setRedirect(true);
			forward.setNextPage("404.do");
			return forward;
		}
		ArrayList<bbsDto> list = new ArrayList<bbsDto>();
		int dataNum = 0;
		
		if(type == null && search == null) {
			if(major.equals("내가 쓴글")) {
				list = bDao.getMyBbsList(page, id);
				dataNum = bDao.getRecode("id", id);
				request.setAttribute("stat", 1);
			}else if(major.equals("유저글")) {
				list = bDao.getMyBbsList(page, id);
				dataNum = bDao.getRecode("id", id);
				request.setAttribute("stat", 2);
			}else{
				list = bDao.getBbsList(page, major);
				dataNum = bDao.getRecode("major", major);
				request.setAttribute("stat", 0);
			}
		}
		if(type != null && search == null) {
			if(type.equals("인증글")) {
				request.setAttribute("stat", 3);
				list = bDao.getCertifiedList(page, major);
				dataNum = bDao.getCertifiedRecode(major);
			}else {
				request.setAttribute("stat", 3);
				list = bDao.getBestList(page, major);
				dataNum = bDao.getRecode("id", id);
			}
		}
		if(search != null) {
			if(search.equals("1")) {
				request.setAttribute("stat", 4);
				list = bDao.getSearchBbs(page ,query, major);	
				dataNum = bDao.getSearchRecode(query, major);
				System.out.println("1:"+dataNum);
			}else if(search.equals("2")) {
				request.setAttribute("stat", 4);
				list = bDao.getMyBbsList(page ,query, major);	
				dataNum = bDao.getSearchRecodeNum(major, query);
				System.out.println("2:"+dataNum);
			}
		}
		
		int maxPage = (int)((double)dataNum / 20 + 0.95);
		int startPage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = maxPage;
		if(endPage > maxPage + 10 - 1) {
			endPage = startPage + 10 - 1;
		}
		System.out.println("3:"+dataNum);
		if(list.size() > 0) {
			request.setAttribute("bbsList", list);
			request.setAttribute("page", page);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("dataNum", dataNum);
			forward.setRedirect(false);
			forward.setNextPage("bbs.do");
		}else if(list.size() <= 0 && major.equals("내가 쓴글")) {
			request.setAttribute("myNotList", -1);
			forward.setRedirect(false);
			forward.setNextPage("bbs.do");
		}else if(list.size() <= 0) {
			request.setAttribute("notList", -1);
			forward.setRedirect(false);
			forward.setNextPage("bbs.do");
		}
		return forward;
	}
}
