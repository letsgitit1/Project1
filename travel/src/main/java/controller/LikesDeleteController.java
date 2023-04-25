package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.likesDao;
import front.Handle;

public class LikesDeleteController implements Handle {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		likesDao dao = likesDao.getInstance();
		int pno = Integer.parseInt(request.getParameter("pno"));
		String mid = request.getParameter("mid");
		int cnt = dao.heart(mid, pno);
		if(cnt == 1) {
			dao.delete(mid, pno);
		}
	}

}
