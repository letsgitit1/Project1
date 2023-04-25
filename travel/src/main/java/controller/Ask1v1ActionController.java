package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Ask1v1Dao;
import front.Handle;
import vo.Ask1v1Vo;
import vo.MemberVo;

public class Ask1v1ActionController implements Handle {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String icategory = request.getParameter("icategory");
		String iaskcategory = request.getParameter("iaskcategory");
		String iasktitle = request.getParameter("iasktitle");
		String icontent = request.getParameter("icontent");
		MemberVo mid = (MemberVo)request.getSession().getAttribute("user");
		String icheck = request.getParameter("icheck");
		Ask1v1Vo vo = Ask1v1Vo.builder()

				.icategory(icategory).iaskcategory(iaskcategory).iasktitle(iasktitle).icontent(icontent).icheck(icheck).mid(mid.getId())
				.build();

		Ask1v1Dao dao = Ask1v1Dao.getInstance();
		int result = dao.insert(vo);

		if (result != 0) {
			response.sendRedirect("ask1v1");

		}
	}
}
