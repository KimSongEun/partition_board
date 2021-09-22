package kh.my.jo.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.my.jo.common.Command;

/**
 * Servlet implementation class BoardCtrl
 */
@WebServlet("/board/*")
public class BoardCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String viewPage = null;
		Command cmd = null;
		
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String com = uri.substring(contextPath.length());
		System.out.println(uri);
		System.out.println(contextPath);
		System.out.println(com);
		
		if(com.equals("/board/list")) {
			cmd = new BoardWriteCommand();
			cmd.execute(request, response);
			BoardWriteCommand myCmd = (BoardWriteCommand) cmd;
			if(myCmd.check_Id && myCmd.check_EndPage) {
				viewPage = "/WEB-INF/board/boardlist.jsp";
			}
			viewPage  = "/WEB-INF/board/boardlist.jsp";
		}else if (com.equals("/board/write")) {
			viewPage  = "/WEB-INF/board/boardwrite.jsp";
			
		}else if (com.equals("/board/writedo")) {
			cmd = new BoardWriteCommand();
			cmd.execute(request, response);
			
			viewPage  = "/WEB-INF/board/boardwrite.jsp";
		}else if (com.equals("/board/update")) {
			
		}else if (com.equals("/board/read")) {
			
		}else if (com.equals("/board/boardcontent")) {
			new BoardContentCommand().execute(request, response);
			viewPage = "/WEB-INF/board/boardcontent.jsp";
		}
		
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
