package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlSessionBean;
import vo.Ask1v1Vo;
import vo.ServiceVo;

public class ServiceDao {

	private static ServiceDao dao = new ServiceDao();

	private ServiceDao() {
	}

	public static ServiceDao getInstance() {
		return dao;
	}

	public List<ServiceVo> selectAll() {
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<ServiceVo> list = sqlSession.selectList("Service.list");
		sqlSession.close();
		return list;
	}

	public int insert(ServiceVo vo) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result = sqlSession.insert("Service.insert", vo);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}

	public int update(ServiceVo vo) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result = sqlSession.update("ServiceVo.insert", vo);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}

	public int delete(int sno) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result = sqlSession.delete("ServiceVo.delete", sno);
		sqlSession.commit();
		sqlSession.close();
		return result;
	}

	public List<ServiceVo> paglist(Map<String, Integer> map) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<ServiceVo> list = sqlSession.selectList("Service.pagelist", map);
		sqlSession.close();
		return list;
	}

	public int count() {
		SqlSession sqlSession = SqlSessionBean.getSession();
		int result = sqlSession.selectOne("Service.count");
		sqlSession.close();
		return result;

	}
	public List<ServiceVo> selectBycategory() {
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<ServiceVo> list = sqlSession.selectList("Service.selectBycategory");
		sqlSession.close();
		return list;
	} 
	
	public List<ServiceVo> list(Map<String, String> map) {
		SqlSession sqlSession = SqlSessionBean.getSession();
		List<ServiceVo> list = sqlSession.selectList("Service.list",map);
		sqlSession.close();
		return list;
	}

}
