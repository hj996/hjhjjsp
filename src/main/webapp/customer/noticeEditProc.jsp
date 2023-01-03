
<%@page import="notice.dao.NoticeDao"%>
<%@page import="notice.vo.Notice"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 전달된 form을 받아서 DB의 해당 글을 수정 후 페이지를 noticeDetail로 이동-->
<%
/* request.setCharacterEncoding("utf-8");

String num=request.getParameter("c");
String title=request.getParameter("title");
String content=request.getParameter("content");

Notice n=new Notice(); //NEW 변수 n
n.setTitle(title);
n.setContent(content);
n.setSeq(num);

NoticeDao dao=new NoticeDao();
int cnt=dao.update(n); */

/* //전달된 form을 받아서 DB의 해당 글을 수정하기
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";

	Class.forName(driver);
	Connection conn=DriverManager.getConnection(url, user, pw);
	//연결성공
	//String sql="select * from notices where seq='"+seq+"'";
	String sql="update notices set title=?, content=? where seq=?";
	
	//실행
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, content);
	pstmt.setString(3, num); */
	
	//int cnt=pstmt.executeUpdate();
/* 	if(cnt>=0){
		//response.sendRedirect("noticeDetail.jsp?c="+num);
	} */



%>



