package controller;

import java.io.IOException;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import dao.MemberDao;
import dao.PaymentDao;
import dao.ProductDao;
import front.Handle;
import vo.MemberVo;
import vo.PaymentVo;
import vo.ProductVo;

public class SuccessController implements Handle {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String paymentKey = request.getParameter("paymentKey");
		 int amount = Integer.parseInt(request.getParameter("amount"));
		 String orderId = request.getParameter("orderId");
		 String mid=request.getParameter("mid");
		 int pno=Integer.parseInt(request.getParameter("pno"));
		 String startDate=request.getParameter("startDate");
		 String endDate=request.getParameter("endDate");
		 
		 String nightCount=request.getParameter("nighCount");
		 
		 ProductDao dao1=ProductDao.getInstance();
			MemberDao dao2=MemberDao.getInstance();
		 ProductVo vo2=dao1.selectProduct(pno);
			MemberVo vo3=dao2.selectId(mid);
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
			LocalDateTime localDateTime = LocalDateTime.parse(startDate, formatter);
			Date date = java.sql.Timestamp.valueOf(localDateTime);
			
			DateTimeFormatter formatter2 = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
			LocalDateTime localDateTime2 = LocalDateTime.parse(endDate, formatter2);
			Date date2 = java.sql.Timestamp.valueOf(localDateTime2);
	
			
			
			request.setAttribute("mvo", vo3);
			request.setAttribute("vo", vo2);
			request.setAttribute("nights", nightCount);
			request.setAttribute("KstartDate", date);
			request.setAttribute("KendDate", date2);
			request.setAttribute("orderId", orderId);
			request.setAttribute("amount", amount);
			
		
		 System.out.println(startDate);
		 //********************************************************************///////////////////////////////////
		 String secretKey = "test_sk_ODnyRpQWGrNdJ2vGWe23Kwv1M9EN" + ":";
		   
		   Encoder encoder = Base64.getEncoder(); 
		   byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
		   String authorizations = "Basic "+ new String(encodedBytes, 0, encodedBytes.length);
		   
		   URL url = new URL("https://api.tosspayments.com/v1/payments/" + paymentKey);
		   
		   HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		   connection.setRequestProperty("Authorization", authorizations);
		   connection.setRequestProperty("Content-Type", "application/json");
		   connection.setRequestMethod("POST");
		   connection.setDoOutput(true);

		   JSONObject obj = new JSONObject();
		   //데이터 가져와서 값 넣어주기
		   obj.put("orderId", orderId);
		   obj.put("amount", amount);
		   
		   OutputStream outputStream = connection.getOutputStream();
		   outputStream.write(obj.toString().getBytes("UTF-8"));
		   
		   int code = connection.getResponseCode();
		   boolean isSuccess = code >= 200 && code < 300 ? true : false;
		   
		   InputStream responseStream = isSuccess? connection.getInputStream(): connection.getErrorStream();
		   
		   Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);

		   try {
			    JSONParser parser = new JSONParser();
			    JSONObject jsonObject = (JSONObject) parser.parse(reader);
			    String approvedAt = (String) jsonObject.get("approvedAt");
			    OffsetDateTime odt = OffsetDateTime.parse(approvedAt);
			    OffsetDateTime odt2 = OffsetDateTime.parse(startDate);
			    OffsetDateTime odt3 = OffsetDateTime.parse(endDate);
			    Timestamp ts = Timestamp.from(odt.toInstant());
			    Timestamp ts2 = Timestamp.from(odt2.toInstant());
			    Timestamp ts3 = Timestamp.from(odt3.toInstant());
			    
			    
			    String method=(String)jsonObject.get("method");
			    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				
//					PaymentVo vo=new PaymentVo(orderId,mid,pno,method,amount,ts,ts2,ts3);
					PaymentVo vo=PaymentVo .builder() .orderid(orderId) .mid(mid) .pno(pno) .paymethod(method) .amount(amount) .approvedAt(ts) .checkin(ts2) .checkout(ts3).build();
					PaymentDao dao=PaymentDao.getInstance();
					dao.insert(vo);
					
					request.setAttribute("ts", ts);
				
			    // Similarly, parse the checkin and checkout strings into Date objects
			    // and set the checkin and checkout fields of the PaymentVo object
			} catch (IOException e) {
			    e.printStackTrace();
			} catch (ParseException e) {
			    e.printStackTrace();
			} 
		   
		   //////////////////////////////////////////////////////////////////////////////////////////////////////
			responseStream.close();
			RequestDispatcher dispatcher=request.getRequestDispatcher("/toss/success.jsp");
			dispatcher.forward(request, response);
	}
}
