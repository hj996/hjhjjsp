<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<%
String id=request.getParameter("id");
String password=request.getParameter("password");

//db접속
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="hr";
	String pw="123456";

	Class.forName(driver);
	Connection conn=DriverManager.getConnection(url,user,pw);
	//접속성공상태

	String sql="select id,pwd from nmember where id=?";
		
	PreparedStatement pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	
	ResultSet rs=pstmt.executeQuery();
	//rs.next();
	//확인
	//System.out.println("id :"+rs.getString("id")+":: pwd:"+rs.getString(2));
	
	//아이디 비번 일치판정
	String ypass="";
	int x=-1;
	String msg="";
	
	if(rs.next()){//1.id는 존재한다.
		ypass=rs.getString("pwd");
		if(ypass.equals(password))//1-1.password일치--login 성공
			x=1;                  
		else                      //1-2.password불일치(id 존재하지만)
			x=0;
	}else{//2.id가 존재하지 않는다.
		x=-1;	
	}
	System.out.println("x value:"+x);
	//x값으로 전송위치를 결정
	if(x==1){
		//login성공시 session에 저장 MainForm.jsp로
		session.setAttribute("sessionID", id);
		msg="../index.jsp";
	}else if(x==0){
		msg="loginForm.jsp?msg=0"; //성공하지 않은 상태에서 로그인폼
	}else{
		msg="loginForm.jsp?msg=-1";//성공한 상태에서 메인폼
	}
	response.sendRedirect(msg);
	
%>

