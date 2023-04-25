package controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import front.Handle;
import dao.ProductDao;
import vo.ProductVo;

public class ProductWriteOkController implements Handle {

   @Override
   public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      String path = "C:\\jengjiho\\project\\travel\\src\\main\\webapp\\product_img";
      int maxSize = 10 * 1024 * 1024;
      
      MultipartRequest multi = new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
      StringBuffer strbuffer = new StringBuffer();
      Enumeration<String> cover =  multi.getFileNames();
      if(cover != null) {
         while(cover.hasMoreElements()) {
            String file = cover.nextElement();
            System.out.println("file = " + file);
            String filename = multi.getFilesystemName(file);
            System.out.println("filename = " + filename);
            if(filename != null)
               strbuffer.append(filename).append(",");
         }
      }
      System.out.println("strbuffer = " + strbuffer.toString());
      
      String pname = multi.getParameter("pname");
      int price = Integer.parseInt(multi.getParameter("price"));
      int roomcnt = Integer.parseInt(multi.getParameter("roomcnt"));
      String[] address = multi.getParameter("address").split("\\s+");
      String pcategory = multi.getParameter("pcategory");
      System.out.println(address);
      for (int i = 0; i < address.length; i++) {
         System.out.println(address[i]);
      }
      System.out.println(pname);
      System.out.println(price);
      System.out.println(roomcnt);
      System.out.println(address);
      System.out.println(pcategory);
      
      ProductDao dao = ProductDao.getInstance();
      ProductVo vo = ProductVo.builder()
            .pname(pname)
            .price(price)
            .photofile(strbuffer.toString())
            .roomcnt(roomcnt)
            .address(address[0])
            .subaddress(address[1])
            .detailadd(address[2])
            .pcategory(pcategory).build();
      
      vo.setPhotofiles(vo.getPhotofile().split("\\s+"));
      
      int result = dao.insert(vo);
      System.out.println("등록Pno = " + vo.getPno());
      request.setAttribute("result", result);
      request.setAttribute("vo", vo);
      RequestDispatcher dispatcher = request.getRequestDispatcher("writeOk.jsp");
      dispatcher.forward(request, response);
      
   }
}