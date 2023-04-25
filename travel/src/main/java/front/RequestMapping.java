package front;

import java.util.HashMap;
import java.util.Map;

import controller.ApiLogOutOkHandler;
import controller.ApiLoginOkHandler;
import controller.Ask1v1ActionController;
import controller.Ask1v1ReplyController;
import controller.Ask1v1ViewController;
import controller.CheckIdController;
import controller.CheckSearchController;
import controller.LikesController;
import controller.LikesDeleteController;
import controller.LikesInsertController;
import controller.LoginActionController;
import controller.LogoutActionController;
import controller.MemberDeleteController;
import controller.MyChangeMemberController;
import controller.MyInqurityController;
import controller.MyPageController;
import controller.MyPayListController;
import controller.PayMentViewController;
import controller.ProductDataController;
import controller.ProductDeleteController;
import controller.ProductWriteController;
import controller.ProductWriteOkController;
import controller.RegActionController;
import controller.ReviewController;
import controller.ServiceActionController;
import controller.ServiceViewController;
import controller.SuccessController;
import controller.productViewController;

public class RequestMapping {
	public static Map<RequestKeyValue, Handle> mapping = new HashMap<>();
	
	public static void init() {
		
		mapping.put(new RequestKeyValue("/login", "POST"), new LoginActionController());
		mapping.put(new RequestKeyValue("/logout", "GET"), new LogoutActionController());
		mapping.put(new RequestKeyValue("/product/list2", "GET"), new productViewController());
		mapping.put(new RequestKeyValue("/product/detail", "GET"), new ProductDataController());
		mapping.put(new RequestKeyValue("/product/write", "GET"), new ProductWriteController());
	      mapping.put(new RequestKeyValue("/product/write", "POST"), new ProductWriteOkController());
	      mapping.put(new RequestKeyValue("/product/delete", "POST"), new ProductDeleteController());
		mapping.put(new RequestKeyValue("/toss/payment", "GET"), new PayMentViewController());
		mapping.put(new RequestKeyValue("/toss/success", "GET"), new SuccessController());
		
		mapping.put(new RequestKeyValue("/review", "POST"), new ReviewController());
		mapping.put(new RequestKeyValue("/checksearch", "GET"), new CheckSearchController());
		
		mapping.put(new RequestKeyValue("/checksearch", "GET"), new CheckSearchController());
		mapping.put(new RequestKeyValue("/reg","POST"), new RegActionController());
		mapping.put(new RequestKeyValue("/checkId", "POST"), new CheckIdController());
		//고객센터
		mapping.put(new RequestKeyValue("/ask1v1", "GET"), new Ask1v1ViewController());
		mapping.put(new RequestKeyValue("/write", "POST"), new Ask1v1ActionController());
		mapping.put(new RequestKeyValue("/write", "GET"), new Ask1v1ViewController());
		mapping.put(new RequestKeyValue("/ask1v1", "POST"), new Ask1v1ReplyController());
		
		
		mapping.put(new RequestKeyValue("/Service", "GET"), new ServiceViewController());
		mapping.put(new RequestKeyValue("/Service", "POST"), new ServiceActionController());
		
		
		//like
		mapping.put(new RequestKeyValue("/likes", "GET"), new LikesController());
		mapping.put(new RequestKeyValue("/likes/insert", "GET"), new LikesInsertController());
		mapping.put(new RequestKeyValue("/likes/delete", "GET"), new LikesDeleteController());
		
		mapping.put(new RequestKeyValue("/apiLogin", "POST"), new ApiLoginOkHandler());
		mapping.put(new RequestKeyValue("/apiLogout", "GET"), new ApiLogOutOkHandler());
		
		mapping.put(new RequestKeyValue("/my/mypage", "GET"), new MyPageController());
	      mapping.put(new RequestKeyValue("/my/inqurity", "GET"), new MyInqurityController());
	      mapping.put(new RequestKeyValue("/my/changemember", "POST"), new MyChangeMemberController());
	      mapping.put(new RequestKeyValue("/my/paylist", "GET"), new MyPayListController());
	      mapping.put(new RequestKeyValue("/my/delete", "POST"), new MemberDeleteController());
	}
	
	public static Handle getHandler(RequestKeyValue key) {
		return mapping.get(key);
	}
	
}
