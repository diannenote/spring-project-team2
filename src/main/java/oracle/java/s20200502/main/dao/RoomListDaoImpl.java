package oracle.java.s20200502.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20200502.main.model.RoomList;
import oracle.java.s20200502.main.model.SearchRoomList;

@Repository
public class RoomListDaoImpl implements RoomListDao {

	@Autowired
	private SqlSession session;

	@Override
	public int total() {
		return session.selectOne("total");
	}

	@Override
	public List<RoomList> list(RoomList roomlist) {
		// roomlist.xml -> id(listAll), parameterType(roomlist), return List
		return session.selectList("listAll", roomlist);
	}
	@Override
	public List<RoomList> Searchlist(SearchRoomList roomlist) {
		// roomlist.xml -> id(listSearch), parameterType(SearchRoomList), return List
		roomlist.setSearchType("SearchRoomList");
		return session.selectList("listSearch", roomlist);
	}

}
