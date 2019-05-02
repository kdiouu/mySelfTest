package ch01;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch01/number")
public class number extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {		//說明傳送到本程式之資料的內碼
			request.setCharacterEncoding("UTF-8");		//讀取瀏覽器送來的資料
			String name = request.getParameter("visitor");
			if (name == null || name.trim().length() == 0) {
				name = "訪客"; 		//如果讀不到使用者輸入的資料，將變數name設為訪客
			}
			request.setAttribute("visitname", name);
			for(int number1 = 1 ; number1 <10 ; number1++) {
				for(int number2 = 1 ; number2 < 10 ; number2++) {
					request.setAttribute("number1", number1);
					request.setAttribute("number2", number2);
				}
				
			}
			RequestDispatcher rd = request.getRequestDispatcher("/ch01/testnumber.jsp");
			rd.forward(request, response);
			return;		//forward()之後會有一個return敘述
		} catch (UnsupportedEncodingException e) {
			throw new ServletException(e);
		}

	}
		
}
