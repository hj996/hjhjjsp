package notice.controller.customer;

import java.sql.*;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import notice.controller.NController;
import notice.dao.NoticeDao;
import notice.db.DBCon;
import notice.vo.Notice;

public class NoticeDetailController implements NController{ //상속받아서 type: NController
	public void excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeController mvc2 신호");
		
		NoticeDao dao=new NoticeDao();
		List<Notice> list=dao.getList();  //type : List<Notice>
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("notice.jsp").forward(request, response);
		
		
		
		
	}
}
