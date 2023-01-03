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
	<h3>DB insert</h3>
<%
String gname=request.getParameter("gname");
String gdescribe=request.getParameter("gdescribe");

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
	String sql="insert into goodsinfo(gnum,gname,gdescribe,gprice,gdate)";
		   sql +=" values(4,?,?,10000,systimestamp)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, gname);
	pstmt.setString(2, gdescribe);
	
	int resultNum=pstmt.executeUpdate();
	System.out.println("resultNum"+resultNum);
	
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(pstmt!=null)try{pstmt.close();}catch(Exception e){}
	if(conn!=null)try{pstmt.close();}catch(Exception e){}
}
response.sendRedirect("goodsboard.jsp");
%>
</body>
</html>