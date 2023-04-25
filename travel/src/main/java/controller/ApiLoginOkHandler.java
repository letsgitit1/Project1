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

public class ApiLoginOkHandler implements Handle	 {

   @Override
   public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//      request.setCharacterEncoding("UTF-8");
//      response.setCharacterEncoding("UTF-8");
      String id = request.getParameter("apiId");
      String email = request.getParameter("apiEmail");
      String name = request.getParameter("apiName");
      String password = request.getParameter("apiPassword");
      
      System.out.println("id = " + id);
      System.out.println("email = " + email);
      System.out.println("name = " + name);
      System.out.println("password = " + password);
      
      MemberVo vo = MemberVo.builder().id(id).name(name).pw(password).build();
      MemberDao dao = MemberDao.getInstance();
      Map<String, String> map = new HashMap<>();
      map.put("id", id);
      map.put("pw", password);
      MemberVo vo2 = dao.login2(map);
      if(vo2 != null) {
         vo2 = dao.login2(map);
         HttpSession session = request.getSession();
         session.setAttribute("user1", vo2);
      }else {
         dao.join(vo);
         vo2 = dao.login2(map);
         HttpSession session = request.getSession();
         session.setAttribute("user1", vo2);
         
      }
      System.out.println(vo2);
      RequestDispatcher dispatcher = request.getRequestDispatcher("/");
      dispatcher.forward(request, response);
      
   }
}