>
<%@page import="notice.dao.NoticeDao"%>
<%@page import="notice.vo.Notice"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 삭제후 notice.jsp(처음목록페이지)로 이동 -->
<%
request.setCharacterEncoding("utf-8");
String num=request.getParameter("c");//글번호

Notice n=new Notice();
n.setSeq(num);

NoticeDao dao=new NoticeDao();
//int cnt=dao.delete(n);
int cnt=dao.delete(num);


/* String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";

	Class.forName(driver);
	Connection conn=DriverManager.getConnection(url, user, pw);
	//연결성공
	//String sql="select * from notices where seq='"+seq+"'";
	String sql="delete from notices where seq=?";
	
	//실행
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, num);
	
	int cnt=pstmt.executeUpdate(); */
	if(cnt>=0){
		System.out.print("삭제성공");
		response.sendRedirect("notice.jsp");
	}
%>




