package oracle.java.s20200502.board.dao;

public interface LikeDao {

	int likeCount(int b_num, int m_num);
	int insertLike(int b_num, int m_num);
	int deleteLike(int b_num, int m_num);

}
