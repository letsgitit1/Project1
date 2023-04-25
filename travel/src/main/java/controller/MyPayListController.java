package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PaymentDao;
import front.Handle;
import vo.MemberVo;
import vo.PaymentVo;

public class MyPayListController implements Handle {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			MemberVo user=(MemberVo)request.getSession().getAttribute("user");
			
			PaymentDao dao=PaymentDao.getInstance();
			
			List<PaymentVo> list= dao.select(user.getId());
			
			request.setAttribute("list", list);
			
			System.out.println(list.get(0));
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("paylist.jsp");
			dispatcher.forward(request, response);
			
	}

}
