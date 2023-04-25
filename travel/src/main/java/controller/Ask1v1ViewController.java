package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Ask1v1Dao;
import dao.MemberDao;
import front.Handle;
import vo.MemberVo;
import vo.Paging;

public class Ask1v1ViewController implements Handle {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Ask1v1Dao dao = Ask1v1Dao.getInstance();
		
		HttpSession session = request.getSession();
		MemberVo id = (MemberVo) request.getSession().getAttribute("user");
		
		
		if(id!=null) {
			MemberDao dao2 = MemberDao.getInstance();
			MemberVo vo = new MemberVo();
		
			vo = dao2.selectId(id.getId());		
			request.setAttribute("vo", vo);
		}
		
		int currentPage = 1; // 페이지 초기 !

		String page = request.getParameter("page");

		if (page != null)
			currentPage = Integer.parseInt(page);
		int pageSize = 10;
		int totalCount = dao.count();

		Paging paging = new Paging(currentPage, totalCount, pageSize);

		Map<String, Integer> map = new HashMap<>();
		map.put("start", paging.getStartNo());
		map.put("end", paging.getEndNo());
		System.out.println("??????" + dao.paglist(map));
		request.setAttribute("list", dao.paglist(map));
		
		request.setAttribute("paging", paging);

		request.setAttribute("today", LocalDate.now());

		RequestDispatcher dispatcher = request.getRequestDispatcher("ask1v1.jsp");
		dispatcher.forward(request, response);
	}

}
