<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String gnum=request.getParameter("c");
if(gnum==null)
	gnum="1";
String driver="oracle.jdbc.driver.OracleDriver";
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";

Class.forName(driver);
Connection conn=DriverManager.getConnection(url, user, pw);

String sql="select * from goodsinfo where gnum=?";

PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setString(1, gnum);

ResultSet rs=pstmt.executeQuery();
rs.next();
System.out.println("value : "+rs.getString("gname")); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My JSP Files</title>
<link rel="stylesheet" href="../css/gstyle.css" />
</head>
<body>
<h3>상품게시판 조회</h3>
<table class="gwidth">
	<colgroup>
		<col width="10%"/>
		<col width="20%"/>
		<col width="20%"/>
		<col width="20%"/>
	</colgroup>
	<caption>Detail</caption>
	<tbody>
		<tr>
			<th class="left">상품번호</th>
			<td><%=rs.getInt("gnum") %></td>
			<th class="left">상품가격</th>
			<td><%=rs.getInt("gprice") %></td>
		</tr>
		<tr>
			<th class="left">상품명</th>
			<td><%=rs.getString("gname") %></td>
			<th class="left">상품등록일</th>
			<td><%=rs.getDate("gdate") %></td>
		</tr>
		<tr>
			<th class="left">상품상세설명</th>
			<td colspan="3" id="describe"><%=rs.getString("gdescribe") %></td>
			
			
		</tr>
		<tr>
			<th class="left">첨부</th>
			<td colspan="3" id="addfile">첨부</td>
			
			
		</tr>
	</tbody>
</table>
<a href="goodsboard.jsp"></a>	
</body>
</html>
<%
 rs.close();
pstmt.close();
conn.close(); 
%>