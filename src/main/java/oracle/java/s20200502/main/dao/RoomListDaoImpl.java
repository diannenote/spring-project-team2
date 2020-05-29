package oracle.java.s20200502.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20200502.main.model.RoomList;

@Repository
public class RoomListDaoImpl implements RoomListDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public List<RoomList> listRoom(RoomList roomList) {
		System.out.println("RoomListDaoImpl Start...");
		return session.selectList("roomList", roomList);
	}
	//게시물 총 갯수
	@Override
	public int total() {		
		return session.selectOne("total");
	}

}
