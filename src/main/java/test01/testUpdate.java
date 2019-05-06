package test01;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch01.LotteryBean;

/**
 * Servlet implementation class testUpdate
 */
@WebServlet("/test01/testUpdate.do")
public class testUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			processRequest(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		try {		//說明傳送到本程式之資料的內碼
			request.setCharacterEncoding("UTF-8");		//讀取瀏覽器送來的資料
			
			String name1 = request.getParameter("name");
			String password1 = request.getParameter("password");
			String date1 = request.getParameter("date");
			IEmpDAO dao = new EmpDAO();
		
			dao.getConnection();
			
			EmpBean emp2 = new EmpBean();
			emp2.setEname(name1);
			emp2.setEpassword(password1);
			emp2.setEdate(date1);
			
			int count2 = dao.update(emp2);
			RequestDispatcher rd = request.getRequestDispatcher("/test01/testSuccess.jsp");
			rd.forward(request, response);		//移轉程式的執行順序
			
			dao.closeConn();
			return;		//forward()之後會有一個return敘述
		} catch (UnsupportedEncodingException e) {
			throw new ServletException(e);
		}

	}
}