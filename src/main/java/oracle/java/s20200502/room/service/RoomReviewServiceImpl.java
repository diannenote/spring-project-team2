package oracle.java.s20200502.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20200502.room.dao.RoomDao;
import oracle.java.s20200502.room.dao.RoomReviewDao;
import oracle.java.s20200502.room.model.Review;
import oracle.java.s20200502.room.model.Room;

@Service
public class RoomReviewServiceImpl implements RoomReviewService {
	
	@Autowired
	private RoomReviewDao rrd;

	@Override
	public int reviewInsert(Review rv) {
		System.out.println("RoomReviewServiceImpl reviewInsert Start...");
		return rrd.reviewInsert(rv);
	}

	@Override
	public List<String> getRoomReview(int ro_num) {
		System.out.println("RoomReviewServiceImpl getRoomReview");
		return rrd.getRoomReview(ro_num);
	}

	@Override
	public List<String> getRoomBizReview(int ro_num) {
		System.out.println("RoomRevieServiceImpl getRoomBizReview Statrt...");
		return rrd.getRoomBizReview(ro_num);
	}

	@Override
	public double getScoreAvg(int ro_num) {
		System.out.println("RoomRevieServiceImpl getScoreAvg Statrt...");
		return rrd.getScoreAvg(ro_num);
	}

	@Override
	public int getReviewTotal(int ro_num) {
		return rrd.getReviewTotal(ro_num);
	}
}
