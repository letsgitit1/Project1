package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import front.Handle;
import vo.MemberVo;

public class MyChangeMemberController implements Handle {

   @Override
   public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      MemberVo membervo = (MemberVo)request.getSession().getAttribute("user");
      HttpSession session = request.getSession();
      MemberDao dao = MemberDao.getInstance();
      String pw = request.getParameter("pw");
      String repw = request.getParameter("repw");
      String repwcheck = request.getParameter("repwcheck");
      
      int result = 0;
      if(pw.equals(membervo.getPw())) {
         if(repw.equals(repwcheck)) {
            Map<String, Object> map = new HashMap<>();
            map.put("pw", repw);
            map.put("id", membervo.getId());
            
            result = dao.updateMember(map);
         }
      }
      membervo = dao.selectId(membervo.getId());
      request.setAttribute("result", result);
      session.setAttribute("user", membervo);
      RequestDispatcher dispatcher = request.getRequestDispatcher("./ok.jsp");
      dispatcher.forward(request, response);
      
   }

}