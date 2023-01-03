<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";

Class.forName(driver);
Connection conn=DriverManager.getConnection(url, user, pw);

String sql="select * from goodsinfo order by gnum desc";

Statement st=conn.createStatement();
ResultSet rs=st.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My JSP Files</title>
</head>
<body>
<h3>게시판</h3>
<table width="800px" border="1">
	<tr>
		<td>상품번호</td>
		<td>상품명</td>
		<td>상품간략소개</td>
		<td>상품가격</td>
		<td>등록일</td>
	</tr>
<%
	while(rs.next()){
%>
	<tr>
		<td><%=rs.getInt("gnum") %></td>	
		<td>
		<a href="goodsboardDetail.jsp??c=<%=rs.getString("gname") %>"><%=rs.getString("gname") %></a>
		</td>
		<td><%=rs.getString("gdescribe") %></td>
		<td><%=rs.getInt("gprice") %></td>
		<td><%=rs.getDate("gdate") %></td>
	</tr>
<%
	}
%>

</table>
<a href="goodsboardReg.jsp">상품 입력</a>
</body>
</html>
<%
rs.close();	
st.close();	
conn.close();	
%>