package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.ProductDao;
import front.Handle;
import vo.MemberVo;
import vo.ProductVo;

public class PayMentViewController implements Handle {

	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
			String temp=request.getParameter("pno");
			MemberVo user=(MemberVo) session.getAttribute("user");
			String type=request.getParameter("type");
			int pno=Integer.parseInt(temp);
			String url;
			ProductDao dao=ProductDao.getInstance();
			
			MemberDao dao2=MemberDao.getInstance();
			if(user!=null) {
			ProductVo vo=dao.selectProduct(pno);
			MemberVo vo2=dao2.selectId(user.getId());
			request.setAttribute("mvo", vo2);
			request.setAttribute("type", type);
			request.setAttribute("vo", vo);
			vo.setPhotofiles(vo.getPhotofile().split(","));
			url="/toss/payment.jsp";
			}else {
				url="/fail2.jsp";
			}
			RequestDispatcher dispatcher=request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
			
	}

}
