package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

import dao.ProductDao;
import front.Handle;
import vo.ProductVo;

public class CheckSearchController implements Handle {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		String key = request.getParameter("key");
		System.out.println(key);
		PrintWriter out = response.getWriter();
		List<ProductVo> list = null;
		ProductDao dao = ProductDao.getInstance();

		list = dao.search(key);
		JSONObject obj = new JSONObject();
		JSONArray jArray = new JSONArray();
		try {
			for (int i = 0; i < list.size(); i++) {
				JSONObject inObj = new JSONObject();
				inObj.put("pno", list.get(i).getPno());
				inObj.put("pname", list.get(i).getPname());
				inObj.put("price", list.get(i).getPrice());
				inObj.put("roomcnt", list.get(i).getRoomcnt());
				inObj.put("address", list.get(i).getAddress());
				inObj.put("subaddress", list.get(i).getSubaddress());
				inObj.put("detailadd", list.get(i).getDetailadd());
				inObj.put("rcount", list.get(i).getRcount());
				inObj.put("pcategory", list.get(i).getPcategory());
				jArray.put(inObj);
			}
			obj.put("item", jArray);
			out.print(obj);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}
}
