package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlSessionBean;
import vo.Ask1v1Vo;

public class Ask1v1Dao {

    private static Ask1v1Dao dao = new Ask1v1Dao();

    private Ask1v1Dao() {}

    public static Ask1v1Dao getInstance() {
        return dao;
    }
    //리스트 전체 보기(관리자 ) 
    public List<Ask1v1Vo> selectAll() {
        SqlSession sqlSession = SqlSessionBean.getSession();
        List<Ask1v1Vo> list = sqlSession.selectList("Ask1v1.listAll");
    //    sqlSession.commit();
        sqlSession.close();
        return list;
    }
//글쓰기(1:1문의 할거임)
    public int insert(Ask1v1Vo vo) {
        SqlSession sqlSession = SqlSessionBean.getSession();
        int result = sqlSession.insert("Ask1v1.insert", vo);
        sqlSession.commit();
        sqlSession.close();
        return result;
    }
//글수정 (본인)
    public int update(Ask1v1Vo vo) {
        SqlSession sqlSession = SqlSessionBean.getSession();
        int result = sqlSession.update("Ask1v1.update", vo);
        sqlSession.commit();
        sqlSession.close();
        return result;
    }
//글삭제 (본인)
    public int delete(int mid) {
        SqlSession sqlSession = SqlSessionBean.getSession();
        int result = sqlSession.delete("Ask1v1.delete", mid);
        sqlSession.commit();
        sqlSession.close();
        return result;
    }
//mid 값으로 내가 쓴 글 조회
    public Ask1v1Vo selectByMid(int mid) {
        SqlSession sqlSession = SqlSessionBean.getSession();
        Ask1v1Vo vo = sqlSession.selectOne("Ask1v1.selectByMid", mid);
        sqlSession.commit();
        sqlSession.close();
        return vo;
    }
//관리자가 답장해주는 기능 (관리자가 답장 업데이트 형식이 아니기 때문에 인설트 해줄거임)
    public int reply(Ask1v1Vo vo) {
        SqlSession sqlSession = SqlSessionBean.getSession();
        int result = sqlSession.update("Ask1v1.reply", vo);
        sqlSession.commit();
        sqlSession.close();
        return result;
    }
    //페이지 구현 !
   public List<Ask1v1Vo> paglist(Map<String,Integer>map){
	   SqlSession sqlSession = SqlSessionBean.getSession();
	   List<Ask1v1Vo> list = sqlSession.selectList("Ask1v1.pagelist",map);
	   sqlSession.close();
	   		return list;
   }
     
   //전체 글 개수 조회 !
    public int count() {
    	SqlSession sqlSession = SqlSessionBean.getSession();
    	int result = sqlSession.selectOne("Ask1v1.count");
    	sqlSession.close();
    	return result;
    	
    }
    public List<Ask1v1Vo> showMyAnswer(String mid){
        SqlSession sqlSession = SqlSessionBean.getSession();
        List<Ask1v1Vo> list = sqlSession.selectList("Ask1v1.selectById", mid);
        sqlSession.close();
        return list;
     }
    
    
    
    
    
    
}
