package bbs;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/BbsViewServlet")
public class BbsViewServlet  extends HttpServlet { //글 목록을 불러오는코드
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String characterID = request.getParameter("characterID"); //캐릭터 ID로 분류함
		response.getWriter().write(getJSON(Integer.parseInt(characterID)));
	}
	public String getJSON(int characterID) {
	    StringBuffer result= new StringBuffer("");
	    result.append("{\"result\":[");
	    BbsDAO bbsDAO =new BbsDAO();
	    ArrayList<Bbs> bbsList= bbsDAO.view(characterID);
	    for(int i =0;i<bbsList.size();i++) {
	        result.append("[{\"UserID\":\"" + bbsList.get(i).getUserID()+"\"},");
	        result.append("{\"BbsDate\":\"" + bbsList.get(i).getBbsDate()+"\"},");
	        result.append("{\"BbsContent\":\"" + bbsList.get(i).getBbsContent()+"\"}],");	
	    }
	    result.append("]}");
	    return result.toString();
	}

}
