package dao;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.google.common.hash.Hashing;

import mybatis.SqlSessionBean;
import vo.MemberVo;

public class MemberDao {
	private static MemberDao dao=new MemberDao();
	private MemberDao() {}
	public static MemberDao getInstance() {
		return dao;
	}
	
	public MemberVo selectMember(int mno) {
		SqlSession mapperSession= SqlSessionBean.getSession();
		MemberVo vo=mapperSession.selectOne("member.selectmember",mno);
		mapperSession.close();
		return vo;
	}
	
	public int login(Map<String,String> map) {
		SqlSession mapperSession= SqlSessionBean.getSession();
		int result=mapperSession.selectOne("member.login", map);
		mapperSession.close();
		return result;
	}
	public MemberVo login2(Map<String,String> map) {
		SqlSession mapperSession= SqlSessionBean.getSession();
		MemberVo vo=mapperSession.selectOne("member.login2", map);
		mapperSession.close();
		return vo;
	}
	public MemberVo selectId(String id) {
		SqlSession mapperSession= SqlSessionBean.getSession();
		MemberVo vo=mapperSession.selectOne("member.seletmemberByid",id);
		mapperSession.close();
		return vo;
	}
	
	   
	   public int insert(MemberVo vo) {
	      SqlSession mapper = SqlSessionBean.getSession();
	      int result = mapper.insert("member.insert",vo);
	      mapper.commit();
	      mapper.close();
	      return result;
	   }
	   public int checkId(String val) {
		      SqlSession mapper = SqlSessionBean.getSession();
		      int result = mapper.selectOne("member.checkId", val);
		      mapper.close();
		      return result;
		   }
	   public int join(MemberVo vo) {
		      SqlSession session = SqlSessionBean.getSession();
		      int result = session.insert("member.join", vo);
		      session.commit();
		      session.close();
		      return result;
		   }
	   public int updateMember(Map<String, Object> map) {
		      SqlSession mapper = SqlSessionBean.getSession();
		      int result = mapper.update("member.updateMember", map);
		      mapper.commit();
		      mapper.close();
		      return result;
		   }
		   
		   public int updateMemberReview(String afterId, String beforeId) {
		      SqlSession mapper = SqlSessionBean.getSession();
		      Map<String, String> map = new HashMap<String, String>();
		      map.put("afterId", afterId);
		      map.put("beforeId", beforeId);
		      int result = mapper.update("member.updateMemberReview", map);
		      mapper.commit();
		      mapper.close();
		      return result;
		   }
		   
		   public int updateMemberLikes(String afterId, String beforeId) {
		      SqlSession mapper = SqlSessionBean.getSession();
		      Map<String, String> map = new HashMap<String, String>();
		      map.put("afterId", afterId);
		      map.put("beforeId", beforeId);
		      int result = mapper.update("member.updateMemberLikes", map);
		      mapper.commit();
		      mapper.close();
		      return result;
		   }
		   
		   public int updateMemberCheck(String afterId, String beforeId) {
		      SqlSession mapper = SqlSessionBean.getSession();
		      Map<String, String> map = new HashMap<String, String>();
		      map.put("afterId", afterId);
		      map.put("beforeId", beforeId);
		      int result = mapper.update("member.updateMemberCheck", map);
		      mapper.commit();
		      mapper.close();
		      return result;
		   }
		   
		   public int updateMemberAsk1v1(String afterId, String beforeId) {
		      SqlSession mapper = SqlSessionBean.getSession();
		      Map<String, String> map = new HashMap<String, String>();
		      map.put("afterId", afterId);
		      map.put("beforeId", beforeId);
		      int result = mapper.update("member.updateMemberAsk1v1", map);
		      mapper.commit();
		      mapper.close();
		      return result;
		   }

		   public String changeId(String id, int cnt) {
		         String changeId = null;
		         int ids = id.length();
		         String star = "*";
		         StringBuilder stars = new StringBuilder();
		         int end = ids-cnt;
		         int change = end-cnt;
		         for(int i=0; i<change; i++)
		            stars.append(star);
		         changeId = id.substring(0,cnt)+stars+id.substring(end, ids);
		         
		         return changeId;
		      }
		   public int delete(String id) {
		         SqlSession mapper = SqlSessionBean.getSession();
		         int result = mapper.delete("member.delete", id);
		         mapper.commit();
		         mapper.close();
		         return result;
		      }
		   public int update2(String pw) {
			   SqlSession mapper = SqlSessionBean.getSession();
			   int result=mapper.update("member.updateMember2",pw);
			   mapper.commit();
			   mapper.close();
			   return result;
		   }
		   public static void main(String[] args) {
			MemberDao dao=MemberDao.getInstance();
			String test=Hashing.sha256().hashString("12345", StandardCharsets.UTF_8).toString();
			System.out.println(test);
			dao.update2(Hashing.sha256().hashString("12345", StandardCharsets.UTF_8).toString());
		}
}

