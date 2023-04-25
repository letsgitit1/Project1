package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ServiceDao;
import front.Handle;
import vo.ServiceVo;

public class ServiceActionController implements Handle {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.setCharacterEncoding("UTF-8");

		
		String scategory = request.getParameter("scategory");
		String stitle = request.getParameter("stitle");
		String scontent = request.getParameter("scontent");

		ServiceVo vo = ServiceVo.builder()

				.scategory(scategory)
				.stitle(stitle)
				.scontent(scontent)
				.build();

		ServiceDao dao = ServiceDao.getInstance();
		int result = dao.insert(vo);

		if (result != 0) {
			response.sendRedirect("service");

		}
	}
}
