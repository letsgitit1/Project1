package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlSessionBean;
import vo.ProductVo;

public class ProductDao {
   private static final ProductDao dao = new ProductDao();

   private ProductDao() {
   }

   public static ProductDao getInstance() {
      return dao;
   }
   
   public ProductVo selectProduct(int pno) {
	   SqlSession mapper = SqlSessionBean.getSession();
	   ProductVo vo=mapper.selectOne("product.selectPno",pno);
	   mapper.close();
	   return vo;
   }

   public List<ProductVo> selectPcategory(String pcategory) {
      SqlSession mapper = SqlSessionBean.getSession();
      List<ProductVo> list = mapper.selectList("product.selectPcategory", pcategory);
      mapper.close();
      return list;
   }

   public List<ProductVo> searchPcategory(String pcategory, String address, String subaddress) {
      SqlSession mapper = SqlSessionBean.getSession();
      Map<String, String> map = new HashMap<String, String>();
      map.put("pcategory", pcategory);
      map.put("address", address);
      map.put("subaddress", subaddress);
      List<ProductVo> list = mapper.selectList("product.selectPcategory", map);
      mapper.close();
      return list;
   }

   public int count(String pcategory) {
      SqlSession mapper = SqlSessionBean.getSession();
      int result = mapper.selectOne("product.count", pcategory);
      mapper.close();
      return result;
   }

   public int searchCount(String pcategory, String address, String subaddress) {
      SqlSession mapper = SqlSessionBean.getSession();
      Map<String, String> map = new HashMap<String, String>();
      map.put("pcategory", pcategory);
      map.put("address", address);
      map.put("subaddress", subaddress);
      int result = mapper.selectOne("product.searchCount", map);
      mapper.close();
      return result;
   }

   public List<ProductVo> pagelist(String pcategory, int start, int end) {
      SqlSession mapper = SqlSessionBean.getSession();
      Map<String, Object> map = new HashMap<>();
      map.put("pcategory", pcategory);
      map.put("start", start);
      map.put("end", end);
      List<ProductVo> list = mapper.selectList("product.pagelist", map);
      mapper.close();
      return list;
   }

   public List<ProductVo> navlist(String pcategory, String address, String subaddress, int start, int end) {
      SqlSession mapper = SqlSessionBean.getSession();
      Map<String, Object> map = new HashMap<>();
      map.put("pcategory", pcategory);
      map.put("address", address);
      map.put("subaddress", subaddress);
      map.put("start", start);
      map.put("end", end);
      List<ProductVo> list = mapper.selectList("product.navlist", map);

      return list;
   }
   public List<ProductVo> search(String key) {
	      SqlSession session = SqlSessionBean.getSession();
	      List<ProductVo> list = session.selectList("product.search", key);
	      session.close();
	      return list;
	   }
   
   // 네비카테고리 반복문을 위한 메소드
   // subaddress 를 찾기 위한 쿼리문사용
   public List<ProductVo> navadd(String pcategory, String address){
	   SqlSession mapper = SqlSessionBean.getSession();
	   Map<String, String> map = new HashMap<>();
	   map.put("pcategory", pcategory);
	   map.put("address", address);
	   List<ProductVo> list = mapper.selectList("product.navadd",map);
	   mapper.close();
	   return list;
   }
   
   // addrlist
   public List<String> addrlist(String pcategory){
	   SqlSession mapper = SqlSessionBean.getSession();
	   List<String> list = mapper.selectList("product.addrlist",pcategory);
	   mapper.close();
	   return list;
   }
   
   // subaddrlist
   public List<String> subaddrlist(Map<String, String> map){
	   SqlSession mapper = SqlSessionBean.getSession();
	   List<String> list = mapper.selectList("product.subaddrlist", map);
	   mapper.close();
	   return list;
   }
 //숙소등록(insert)
   public int insert(ProductVo vo) {
      SqlSession mapper = SqlSessionBean.getSession();
      int result = mapper.insert("product.productInsert", vo);
      mapper.commit();
      mapper.close();
      return result;
   }
   public int delete(int pno) {
	      SqlSession mapper = SqlSessionBean.getSession();
	      int result = mapper.delete("product.delete", pno);
	      mapper.commit();
	      mapper.close();
	      return result;
	   }
   
   
   
}