package bbs;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserSearchServlet")
public class BbsViewServlet  extends HttpServlet { //글 목록을 불러오는코드
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String characterID = request.getParameter("characterID"); //캐릭터 ID로 분류함
		response.getWriter().write(getJSON(Integer.parseInt(characterID)));
	}
	public String getJSON(int characterID) {//캐릭터 게시판에 맞는 글을 받아온다
		StringBuffer result= new StringBuffer("");
		result.append("{\"result\":[");
		BbsDAO bbsDAO =new BbsDAO();
		ArrayList<Bbs> bbsList= bbsDAO.view(characterID);
		for(int i =0;i<bbsList.size();i++) {
			result.append("[{\"value\":\"" + userList.get(i).getUserName()+"\"},");
			result.append("{\"value\":\"" + userList.get(i).getUserAge()+"\"},");
			result.append("{\"value\":\"" + userList.get(i).getUserGender()+"\"},");
			result.append("{\"value\":\"" + userList.get(i).getUserEmail()+"\"}],");
		}
		result.append("]}");
		return result.toString();
	}
}
