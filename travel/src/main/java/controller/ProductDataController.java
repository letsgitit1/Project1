package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.ProductDao;
import dao.ReviewDao;
import dao.likesDao;
import front.Handle;
import vo.ProductVo;
import vo.ReviewVo;

public class ProductDataController implements Handle {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pno = Integer.parseInt(request.getParameter("pno"));
	      ProductDao dao = ProductDao.getInstance();
	      likesDao ldao = likesDao.getInstance();
	      int result=0;
	      ProductVo vo = new ProductVo();
	      vo = dao.selectProduct(pno);
	      vo.setPhotofiles(vo.getPhotofile().split(","));
	      
	      String id = (String) request.getSession().getAttribute("id");
	      ReviewDao rdao = ReviewDao.getInstence();
	      System.out.println("****************8"+id+"////////"+pno);
	      List<ReviewVo> list = rdao.showReview(pno);
	      System.out.println(list);
	      MemberDao mdao = MemberDao.getInstance();
	      for (int i = 0; i < list.size(); i++) {
	         if(list.get(i).getRphoto() != null) 
	           vo.setPhotofiles(vo.getPhotofile().split(","));
	      		if(list.get(i).getMid().length()<5) {
	      		 	list.get(i).setMid(mdao.changeId(list.get(i).getMid(), 1));
	      		}else {
	      			list.get(i).setMid(mdao.changeId(list.get(i).getMid(), 2));
	      		}
	      } if(id!=null) {
			 result = ldao.heart(id, pno);
	      }
			System.out.println("**************************"+result);
		request.setAttribute("hcount", result);
	      request.setAttribute("vo", vo);
	      request.setAttribute("review", list);
	      RequestDispatcher dispatcher = request.getRequestDispatcher("detail.jsp");
	      dispatcher.forward(request, response);
	}

}
