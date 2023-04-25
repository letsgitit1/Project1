package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SqlSessionBean;
import vo.ReviewVo;

public class ReviewDao {
	private static ReviewDao dao = new ReviewDao();

	private ReviewDao() {
	};

	public static ReviewDao getInstence() {
		return dao;
	}

	public int insert(ReviewVo vo) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.insert("review.insert", vo);
		session.commit();
		session.close();
		return result;
	}

	public List<ReviewVo> showReview(int pno) {
		SqlSession session = SqlSessionBean.getSession();
		List<ReviewVo> list = session.selectList("review.showreview", pno);
		session.close();
		return list;
	}

	public int showStar(int pno) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.selectOne("review.showstar", pno);
		session.close();
		return result;
	}

	public int reviewCount(int pno) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.selectOne("review.reviewcnt", pno);
		session.close();
		return result;
	}

	public int updateRcount(int pno) {
		SqlSession session = SqlSessionBean.getSession();
		int result = session.update("review.rcountupdate", pno);
		session.commit();
		session.close();
		return result;
	}
}