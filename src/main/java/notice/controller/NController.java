package notice.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface NController {
//interface : 추상 메소드의 모임
	public void excute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception;
	
	
	
}
