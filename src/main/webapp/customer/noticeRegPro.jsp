
<%@page import="notice.dao.NoticeDao"%>
<%@page import="notice.vo.Notice"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My JSP Files</title>
</head>
<body>
<h3>noticeRegPro.jsp</h3>
<% //DB에 insert할 목적
/* String title=request.getParameter("title");
String content=request.getParameter("content");

Notice n=new Notice();
n.setTitle(title);
n.setContent(content);

NoticeDao dao=new NoticeDao();
int cnt=dao.insert(n); */

/* //if(cnt>0)
	//response.sendRedirect("notice.jsp"); */

/* //db
Connection conn=null;
PreparedStatement pstmt=null;
String str="";

String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";

try{
	Class.forName(driver);
	conn=DriverManager.getConnection(url, user, pw);
	   String sql="insert into notices(seq,title,writer,content,regdate,hit)";
       sql +=" values((select max(to_number(seq))+1 from notices)";
       sql +=",?,'cj',?,systimestamp,0)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, content);

	//실행
	int resultNum=pstmt.executeUpdate();
	System.out.println("resultNum:"+resultNum);
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(pstmt!=null)try{pstmt.close();}catch(Exception e){}
	if(conn!=null)try{pstmt.close();}catch(Exception e){}
} */

/* response.sendRedirect("notice.jsp"); */
%>
</body>
</html>