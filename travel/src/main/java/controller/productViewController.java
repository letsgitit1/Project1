
package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import front.AddressMapper;
import front.Handle;
import vo.Paging;
import vo.ProductVo;

public class productViewController implements Handle {

   @Override
   public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   String pcategory=request.getParameter("pcategory");
	      String address=request.getParameter("address");
	      String subaddress=request.getParameter("subaddress");
	      ProductDao dao = ProductDao.getInstance();
	      
	      int currentPage = 1;
	      List<ProductVo> list = null;
	      
	      if(address==null) {
	       list = dao.selectPcategory(pcategory);
	      }else {
	       list = dao.searchPcategory(pcategory, address, subaddress);
	      }
	      String page = request.getParameter("page");
	      if (page != null)
	         currentPage = Integer.parseInt(page);
	      
	      int pageSize = 6; 
	      
	      int totalCount;
	      
	      if(address==null) {
	       totalCount = dao.count(pcategory);
	      }else {
	       totalCount = dao.searchCount(pcategory, address, subaddress);
	      }
	      Paging paging = new Paging(currentPage, totalCount, pageSize);
	      
	      list=dao.pagelist(pcategory,paging.getStartNo(),paging.getEndNo());
	      
	      if(address!=null) {
	         list=dao.navlist(pcategory, address, subaddress, paging.getStartNo(), paging.getEndNo());
	      }
	      
	      for(ProductVo vo : list) {
	         vo.setPhotofiles(vo.getPhotofile().split(","));
	      }
	      Map<String, List<String>> addressAll = new LinkedHashMap<>();
	      List<String> addrlist = dao.addrlist(pcategory);         //서울,경기,전라,충남 
	      Map<String,String> map = new HashMap<>();
	      map.put("pcategory", pcategory);
	        for(String t : addrlist) {         // address에 큰지역 담기
	           map.put("address", t);         // 
	           List<String> sublist = dao.subaddrlist(map);
	           addressAll.put(t, sublist)   ;
	        }
	      if(list.size()!=0) {
	    	  request.setAttribute("type1", list.get(0).getPcategory());
		      request.setAttribute("type2", address);
		      request.setAttribute("type3", subaddress);
		      request.setAttribute("addressAll", addressAll);
		      request.setAttribute("paging", paging);
	      
	      request.setAttribute("list", list);
	      RequestDispatcher dispatcher = request.getRequestDispatcher("list2.jsp");
	      dispatcher.forward(request, response);
	      }else {
	    	  RequestDispatcher dispatcher = request.getRequestDispatcher("../fail3.jsp");
		      dispatcher.forward(request, response);
	      }
   }

}