package notice.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import notice.db.DBCon;
import notice.vo.Notice;

public class NoticeDao {	
	//List(표전체)
	public List<Notice> getList() throws Exception {
		Connection conn=DBCon.getConnection();
		//---> DB 접속성공
		String sql="select * from notices order by to_number(seq) desc";
		//실행
		Statement st=conn.createStatement();
		ResultSet rs=st.executeQuery(sql); //rs에는 notice표 전체가 담겨있음
		
		//List를 담을 그릇
		List<Notice> list=new ArrayList<Notice>();
		while (rs.next()) {
			Notice n=new Notice();
			n.setSeq(rs.getString("seq")); //db에서 가져온 내용을 notice에 담는다
			n.setTitle(rs.getString("title"));
			n.setWriter(rs.getString("writer"));
			n.setContent(rs.getString("content"));
			n.setRegdate(rs.getDate("regdate"));
			n.setHit(rs.getInt("hit"));
			
			list.add(n);
		}
		return list;
	}
	
	
	
	//noticeRegPro.jsp_insert
	public int insert(Notice notice) {
		
		PreparedStatement pstmt=null;
		int resultNum=0;
		Connection conn=null;
		try{
			   conn=DBCon.getConnection();
			   String sql="insert into notices(seq,title,writer,content,regdate,hit)";
		       sql +=" values((select max(to_number(seq))+1 from notices)";
		       sql +=",?,'cj',?,systimestamp,0)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			//실행
			resultNum=pstmt.executeUpdate();
			System.out.println("resultNum:"+resultNum);
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmt!=null)try{pstmt.close();}catch(Exception e){}
			if(conn!=null)try{pstmt.close();}catch(Exception e){}
		}
		return resultNum;
	}
	
	
	//방법1. noticeDelProc.jsp_delete
	public int delete(Notice notice) throws Exception {
		
			Connection conn=DBCon.getConnection();
			//연결성공
			
			String sql="delete from notices where seq=?";
			
			//실행
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, notice.getSeq());
			int cnt=pstmt.executeUpdate();
			return cnt;
	}
	//방법2. noticeDelProc.jsp_delete
	public int delete(String num) throws Exception {
			Connection conn=DBCon.getConnection();
			//연결성공
			
			String sql="delete from notices where seq=?";
			
			//실행
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			int cnt=pstmt.executeUpdate();
			return cnt;
	}
	
	
	//noticeEditProc.jsp_update
	public int update(Notice notice) throws Exception {
		
			Connection conn=DBCon.getConnection();
			//연결성공
			
			String sql="update notices set title=?, content=? where seq=?";
			
			//실행
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, notice.getTitle());
			pstmt.setString(2, notice.getContent());
			pstmt.setString(3, notice.getSeq());
			int cnt=pstmt.executeUpdate();
			return cnt;
	}
	
	
	
	
	//noticeDetail.jsp
	public Notice getNotice(String num) throws Exception {

			Connection conn=DBCon.getConnection();
			//연결성공
		
			String sql="select * from notices where seq=?";
			
			//실행
			PreparedStatement pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			ResultSet rs=pstmt.executeQuery();
			rs.next();
			//Notice.java 파일에 저장(setting)
			Notice n=new Notice();
			n.setSeq(rs.getString("seq"));
			n.setTitle(rs.getString("title"));
			n.setWriter(rs.getString("writer"));
			n.setContent(rs.getString("content"));
			n.setRegdate(rs.getDate("regdate"));
			n.setHit(rs.getInt("hit"));
			
			rs.close();
			pstmt.close();
			conn.close();
			return n;
	}
}
