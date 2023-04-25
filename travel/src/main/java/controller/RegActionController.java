package controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.common.hash.Hashing;

import dao.MemberDao;
import front.Handle;
import vo.MemberVo;

public class RegActionController implements Handle{
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVo  vo = new MemberVo();
		MemberDao dao = MemberDao.getInstance();
		char a = request.getParameter("gender").charAt(0);
		
		System.out.println(a);
		vo = MemberVo.builder().id(request.getParameter("id"))
				.name(request.getParameter("name"))
				.pw(Hashing.sha256().hashString(request.getParameter("pw"), StandardCharsets.UTF_8).toString())
				.phone(request.getParameter("phone"))
				.gender(request.getParameter("gender").charAt(0))
				.build();
		 dao.insert(vo);
		
		response.sendRedirect("/travel/");
	}
	
}
