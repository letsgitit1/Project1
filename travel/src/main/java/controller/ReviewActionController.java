package controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ReviewDao;
import front.Handle;
import vo.ReviewVo;

public class ReviewActionController implements Handle {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("들어옴");
		String save = "C:\\jengjiho\\project\\travel\\src\\main\\webapp\\review_img";
		int maxSize = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, save, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		StringBuffer strbuffer = new StringBuffer();
		Enumeration<String> enu =  multi.getFileNames();
		 System.out.println(strbuffer.toString());
	      String title = multi.getParameter("text");
	      System.out.println(title);
	      String content = multi.getParameter("boardContents");
	      System.out.println(content);
	      String id = multi.getParameter("id");
	      System.out.println(id);
	      int pno = Integer.parseInt(multi.getParameter("pno"));
	      System.out.println(pno);
	      String sstar = multi.getParameter("rating");
	      double star = 0.0;
	      star = sstar == null ? 0 : Double.parseDouble(sstar);
	      System.out.println(star);
		
	      if(enu != null) {
	         while(enu.hasMoreElements()) {
	            String name = enu.nextElement();
	            String fileName = multi.getFilesystemName(name);
	            if(fileName != null)
	               strbuffer.append(fileName).append(",");
	         }
	      }
	     
	      
	      ReviewVo vo = ReviewVo.builder()
	            .mid(id)
	            .pno(pno)
	            .rphoto(strbuffer.toString())
	            .rtitle(title)
	            .star(star)
	            .rcontent(content)
	            .build();
	      ReviewDao dao = ReviewDao.getInstence();
	      dao.insert(vo);
	      dao.updateRcount(pno);
	      String conpath = request.getContextPath();
	      response.sendRedirect(conpath + "/product/detail?pno="+pno);
	      
	}

}
