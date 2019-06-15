package handler.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import handler.CommandHandler;

public class UploadHandler implements CommandHandler {

//	ServletContext application ;
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String testNum = "1";
		int imgNumArr[]= {1,2,3,4};
		
		request.setAttribute("testNum"	, testNum);
		request.setAttribute("imgNumArr", imgNumArr);
		
		return "/board/upload.jsp";
	}

}
