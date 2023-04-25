package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ServiceDao;
import front.Handle;
import vo.Paging;
import vo.ServiceVo;

public class ServiceViewController implements Handle {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");

		int currentPage = 1; // 페이지 초기 !
		ServiceDao dao = ServiceDao.getInstance();
			
		String page = request.getParameter("page");

		if (page != null)
			currentPage = Integer.parseInt(page);
		int pageSize = 10;
		int totalCount = dao.count();

		Paging paging = new Paging(currentPage, totalCount, pageSize);

		Map<String, Integer> map = new HashMap<>();
		map.put("start", paging.getStartNo());
		map.put("end", paging.getEndNo());

		request.setAttribute("list", dao.paglist(map));

		request.setAttribute("paging", paging);

		
		//카테고리 정렬 메서드
		//dao.selectBycategory();
		request.setAttribute("categories", dao.selectBycategory());
		
		
		Map<String, String> map2 = null;
		String category = request.getParameter("category");
			if(category != null) { 
				map2 = new HashMap<>();
				map2.put("scategory", category);
			}
		List<ServiceVo> service = dao.list(map2);
		
		request.setAttribute("listlist", service);
		request.setAttribute("scategory",category );
		
		
	
		RequestDispatcher dispatcher = request.getRequestDispatcher("service.jsp");
		dispatcher.forward(request, response);
	}

}
