package oracle.java.s20200502.room.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20200502.room.model.Review;
import oracle.java.s20200502.room.model.Room;

@Repository
public class RoomReviewDaoImpl implements RoomReviewDao {

	@Autowired
	private SqlSession session;

	@Override
	public int reviewInsert(Review rv) {
		System.out.println("RoomReviewDaoImpl reviewInsert Start...");
		return session.insert("reviewInsert", rv);
	}

	@Override
	public List<String> getRoomReview(int ro_num) {
		System.out.println("RoomReviewDaoImpl getRoomReview Start...");
		return session.selectList("getRoomReview", ro_num);
	}

	@Override
	public List<String> getRoomBizReview(int ro_num) {
		System.out.println("RoomReviewDaoImpl getRoomBizReview Start...");
		return session.selectList("getRoomBizReview", ro_num);
	}

	@Override
	public double getScoreAvg(int ro_num) {
		System.out.println("RoomReviewDaoImpl getScoreAvg Start...");
		return session.selectOne("getScoreAvg", ro_num);
	}

	@Override
	public int getReviewTotal(int ro_num) {
		return session.selectOne("getReviewTotal", ro_num);
	}

	
}
