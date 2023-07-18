package bbs;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/UserRegisterServlet")
public class BbsWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String bbscharacterID = request.getParameter("characterID");	
		String userID = request.getParameter("userID");	
		String bbsContent = request.getParameter("bbsContent");	
		response.getWriter().write(register(bbscharacterID,userID,bbsContent)+"");
	}
	public int register(String bbscharacterID,String userID, String bbsContent) {
		int result = 0;
		
		try {
				result = new BbsDAO().write(Integer.parseInt(bbscharacterID), userID, bbsContent);
		}
		catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
}
