package oracle.java.s20200502.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20200502.board.dao.LikeDao;

@Service
public class LikeServiceImpl implements LikeService {
	
	@Autowired
	private LikeDao likeDao;

	@Override
	public int likeCount(int b_num, int m_num) {
		System.out.println("likeCount Service start..");
		return likeDao.likeCount(b_num, m_num);
	}

	@Override
	public int insertLike(int b_num, int m_num) {
		System.out.println("insertLike Service start..");
		return likeDao.insertLike(b_num, m_num);
	}

	@Override
	public int deleteLike(int b_num, int m_num) {
		
		System.out.println("deleteLike Service start..");
		return likeDao.deleteLike(b_num, m_num);
	}

}
