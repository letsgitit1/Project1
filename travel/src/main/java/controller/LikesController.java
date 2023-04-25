package controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.likesDao;
import front.Handle;
import vo.MemberVo;
import vo.Paging;
import vo.likesVo;

public class LikesController implements Handle {

   @Override
   public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      likesDao instance = likesDao.getInstance();
      MemberVo user=(MemberVo)request.getSession().getAttribute("user");
      HttpSession session = request.getSession();

//      List<likesVo> test = instance.wishlist(id);
//      for(int i=0; i<test.size(); i++) {
//         test.get(i).setPhotofile(test.get(i).getPhotofiles().split(","));
//      }
      
      int currentPage = 1;   //현제 페이지 초기값
      String page = request.getParameter("page");
      if(page != null) currentPage = Integer.parseInt(page);
      
      int pageSize = 6;   //보여주는 화면에 리스트 행수
      String reSize = request.getParameter("pageRows");
      if(reSize != null) pageSize = Integer.parseInt(reSize);
         
      int totalCount = instance.getCount(user.getId());   //전체 글 갯수
      
      Paging paging = new Paging(currentPage, totalCount, pageSize);
      Map<String, Object> map = new HashMap<>();
      map.put("id", user.getId());
      map.put("start", paging.getStartNo());
      map.put("end", paging.getEndNo());
      
      System.out.println("start = " + paging.getStartNo());
      System.out.println("startPage = " + paging.getStartPage());
      System.out.println("end = " + paging.getEndNo());
      System.out.println("endPage = " + paging.getEndPage());
      List<likesVo> test = instance.showHeart(map);
      System.out.println(test.size());
      
      for (int i = 0; i < test.size(); i++) {
         test.get(i).setPhotofile(test.get(i).getPhotofiles().split(","));
      }
      session.setAttribute("heartPage", paging);
      request.setAttribute("wishList", test);
      RequestDispatcher rd = request.getRequestDispatcher("/my/heart.jsp");
      rd.forward(request, response);
   }
   
   
}