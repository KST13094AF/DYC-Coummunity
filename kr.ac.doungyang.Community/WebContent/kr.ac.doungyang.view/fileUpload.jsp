<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String realFolder = request.getRealPath("/file");
String filename1 = "";
int maxSize = 1024*1024*5;
String encType = "utf-8";
String savefile = "img";
ServletContext scontext = getServletContext();
try{
 MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

 Enumeration<?> files = multi.getFileNames();
    String file1 = (String)files.nextElement();
    filename1 = multi.getFilesystemName(file1);
} catch(Exception e) {
 e.printStackTrace();
}

String fullpath = realFolder + "\\" + filename1;

RequestDispatcher rqdp = request.getRequestDispatcher("writeAction.do");
rqdp.forward(request, response);
%>