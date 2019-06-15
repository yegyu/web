package handler.board;
import handler.CommandHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import java.io.File;
//import java.util.ArrayList;
//import java.util.Enumeration;
//
//import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UploadViewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
//		String testNum = request.getParameter("testNum");
//		String question = request.getParameter("question");
		String testNum = request.getParameter("testNum");
		String question = request.getParameter("question");
//		int imgNumArr = (Integer) request.getAttribute("imgNumArr");
//		
		System.out.println("testNum : " + testNum);
		System.out.println("Question : " + question);
		
		request.setAttribute("question", question);
		request.setAttribute("testNum", testNum);
		
		return "/board/uploadView.jsp";
	}

}
