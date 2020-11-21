package kr.ac.doungyang.Community.model.notice;

import java.sql.Timestamp;

public class noticeDto {
	private int num;
	private String id;
	private String classType;
	private String title;
	private String content;
	private Timestamp date;
	private int lookup;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getClassType() {
		return classType;
	}
	public void setClassType(String classType) {
		this.classType = classType;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public int getLookup() {
		return lookup;
	}
	public void setLookup(int lookup) {
		this.lookup = lookup;
	}
	
}
