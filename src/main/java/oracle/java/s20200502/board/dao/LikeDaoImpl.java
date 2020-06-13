package oracle.java.s20200502.board.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDaoImpl implements LikeDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public int likeCount(int b_num, int m_num) {
		
		System.out.println("likeCount DaoImpl start..");
		Map<String, Object> likeCount = new HashMap<String, Object>();
		likeCount.put("b_num", b_num);
		likeCount.put("m_num", m_num);
		
		return session.selectOne("likeCount", likeCount);
	}

	@Override
	public int insertLike(int b_num, int m_num) {
		
		System.out.println("likeCount DaoImpl start..");
		Map<String, Object> insertLike = new HashMap<String, Object>();
		insertLike.put("b_num", b_num);
		insertLike.put("m_num", m_num);
		
		return session.insert("insertLike", insertLike);
	}

	@Override
	public int deleteLike(int b_num, int m_num) {
		
		System.out.println("deleteLike DaoImpl start..");
		Map<String, Object> deleteLike = new HashMap<String, Object>();
		deleteLike.put("b_num", b_num);
		deleteLike.put("m_num", m_num);
		
		return session.delete("deleteLike", deleteLike);
	}

}
