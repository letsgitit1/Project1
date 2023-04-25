package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import front.Handle;

public class ProductDeleteController implements Handle {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pno = Integer.parseInt(request.getParameter("pno"));
		int result = 0;
		ProductDao dao = ProductDao.getInstance();
		result = dao.delete(pno);
		System.out.println("result");
		request.setAttribute("result",result);
			RequestDispatcher dispatcher = request.getRequestDispatcher("deleteOk.jsp");
			dispatcher.forward(request, response);
			
			
	}

}
