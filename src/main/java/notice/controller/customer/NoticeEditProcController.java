package notice.controller.customer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import notice.controller.NController;
import notice.dao.NoticeDao;
import notice.vo.Notice;

public class NoticeEditProcController implements NController{ //상속받아서 type: NController
	public void excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeEditProcController mvc2 신호");
	
		request.setCharacterEncoding("utf-8");

		String num=request.getParameter("c");
		String title=request.getParameter("title");
		String content=request.getParameter("content");

		Notice n=new Notice(); //NEW 변수 n
		n.setTitle(title);
		n.setContent(content);
		n.setSeq(num);

		NoticeDao dao=new NoticeDao();
		int cnt=dao.update(n);//정상처리되었다면 update완료
		
		//Detail로 가는 처리
		n=dao.getNotice(num);
		//request에 Notice n을 담기
		request.setAttribute("n", n);
		//Detail.jsp 파일을 찾는것. 주소줄을 찾아서 보내는 것이 아님
		request.getRequestDispatcher("noticeDetail.jsp").forward(request, response);
		

	
	}
}
