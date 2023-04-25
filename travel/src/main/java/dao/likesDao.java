package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.catalina.mapper.Mapper;
import org.apache.ibatis.session.SqlSession;
import mybatis.SqlSessionBean;
import vo.likesVo;

public class likesDao {
	private static likesDao dao = new likesDao();
	private likesDao() {}
	public static likesDao getInstance() {
		return dao;
	}
	
	// 찜 추가
	public int insert (String mid, int pno){
		SqlSession mapperSession = SqlSessionBean.getSession();
		Map<String, Object> map = new HashMap<>();
		map.put("mno", mid);
		map.put("pno", pno);
		int idx = mapperSession.insert("likesVo.insert", map);
		mapperSession.commit();
		mapperSession.close();
		return idx;
	}
	
	
	// 찜 리스트 조회
	public List<likesVo> wishlist(String mno) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		List<likesVo> result = mapperSession.selectList("likesVo.wishlist",mno);
		mapperSession.close();
		return result;
	}
	
	
	// 하트 확인
	public int heart(String mid, int pno) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		Map<String, Object> map = new HashMap<>();
		map.put("mno", mid);
		map.put("pno", pno);
		int result = mapperSession.selectOne("likesVo.heart", map);
		mapperSession.close();
		return result;
	}
	
	
	// 찜 삭제
	public int delete (String mid, int pno) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		Map<String, Object> map = new HashMap();
		map.put("mno", mid);
		map.put("pno", pno);
		int result = mapperSession.delete("likesVo.delete",map);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
	// 유저가 찜한 숙소개수(paging)
	   public int getCount(String id) {
	      SqlSession mapperSession = SqlSessionBean.getSession();
	      int result = mapperSession.selectOne("likesVo.getCount", id);
	      mapperSession.close();
	      return result;
	   }
	   
	   public List<likesVo> showHeart(Map<String, Object> map) {
	      SqlSession mapperSession = SqlSessionBean.getSession();
	      List<likesVo> list = mapperSession.selectList("likesVo.showHeart", map);
	      mapperSession.close();
	      return list;
	   }
}
