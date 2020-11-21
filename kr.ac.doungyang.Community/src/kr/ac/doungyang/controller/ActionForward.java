package kr.ac.doungyang.controller;

// ������ �̵� ó�� Ŭ����

public class ActionForward {
	private boolean isRedirect = false;
	private String nextPage = null;
	
	public boolean isRedirect() {
		return isRedirect;
	}
	
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	
	public String getNextPage() {
		return nextPage;
	}
	
	public void setNextPage(String nextPage) {
		this.nextPage = nextPage;
	}
	
}
