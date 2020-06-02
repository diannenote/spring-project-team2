package oracle.java.s20200502.room.service;

import java.util.List;

import oracle.java.s20200502.room.model.Review;

public interface RoomReviewService {

	int reviewInsert(Review rv);

	List<String> getRoomReview(int ro_num);

	List<String> getRoomBizReview(int ro_num);

	double getScoreAvg(int ro_num);

	int getReviewTotal(int ro_num);

}
