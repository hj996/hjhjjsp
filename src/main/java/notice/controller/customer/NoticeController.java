package notice.controller.customer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import notice.controller.NController;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeController implements NController{ //상속받아서 type: NController
	public void excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeDetailController mvc2 신호");
		
		//noticeDetail DB connect 
		String num=request.getParameter("c");
		System.out.println("num : "+num);
		if(num==null)
			num="1"; 
		NoticeDao dao=new NoticeDao();
		Notice n=dao.getNotice(num);
		
		//
		request.setAttribute("n", n);
		request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
	}
}
