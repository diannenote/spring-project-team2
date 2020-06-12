package oracle.java.s20200502.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20200502.board.model.Board;
import oracle.java.s20200502.main.model.RoomList;
import oracle.java.s20200502.main.model.SearchRoomList;
import oracle.java.s20200502.room.model.Room;

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
	@Override
	public int getST(SearchRoomList srl) {
		srl.setSearchType("SearchRoomList");
		return session.selectOne("getST", srl);
	}
	@Override
	public List<Board> boardSearchList(SearchRoomList srl) {
		srl.setSearchType("SearchRoomList");
		return session.selectList("boardSearchList", srl);	
	/*	List<Board> rtnReply = null;
	      try {
	    	  System.out.println("rldi try");
	         rtnReply = session.selectList("boardSearchList", srl);
	         System.out.println("rtnReply.get(0).getB_title()-->"+ rtnReply.get(0).getB_title());
	      } catch (Exception e) {
	         System.out.println("RDaoImpl rContent rContent e.getMessage()->"+e.getMessage());
	      }
	      return rtnReply;*/
	}
	@Override
	public int getBT(SearchRoomList srl) {
		srl.setSearchType("SearchRoomList");
		return session.selectOne("getBT", srl);
	}
	@Override
	public List<Room> getBestList() {
		return session.selectList("getBestList");
	}

}
