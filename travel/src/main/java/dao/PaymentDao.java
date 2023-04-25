package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlSessionBean;
import vo.PaymentVo;

public class PaymentDao {
	 
	   private static PaymentDao dao = new PaymentDao();
	   private PaymentDao() {}
	   public static PaymentDao getInstance() {
	      return dao;
	   }
	   public int insert(PaymentVo vo) {
		   SqlSession mapper=SqlSessionBean.getSession();
		   int result=mapper.insert("payment.paymentinfo",vo);
		   mapper.commit();
		   mapper.close();
		   
		   return result;
	   }
	   
	   public List<PaymentVo> select(String mid) {
		   SqlSession mapper=SqlSessionBean.getSession();
		   List<PaymentVo> list=mapper.selectList("payment.selectmid",mid);
		   mapper.close();
		   return list;
		   
	   }
}
