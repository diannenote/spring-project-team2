package oracle.java.s20200502.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20200502.board.model.Board;
import oracle.java.s20200502.main.dao.RoomListDao;
import oracle.java.s20200502.main.model.RoomList;
import oracle.java.s20200502.main.model.SearchRoomList;
import oracle.java.s20200502.room.model.Room;

@Service
public class RoomListServiceImpl implements RoomListService {

	@Autowired
	private RoomListDao dao;

	@Override
	public int total() {
		return dao.total();
	}
	@Override
	public List<RoomList> list(RoomList roomlist) {
		return dao.list(roomlist);
	}
	@Override
	public List<RoomList> listSearch(SearchRoomList srl) {
		return dao.Searchlist(srl);
	}
	@Override
	public int getST(SearchRoomList srl) {
		return dao.getST(srl);
	}
	@Override
	public List<Board> boardSearchList(SearchRoomList srl) {
		return dao.boardSearchList(srl);
	}
	@Override
	public int getBT(SearchRoomList srl) {
		return dao.getBT(srl);
	}
	@Override
	public List<Room> getBestList() {
		return dao.getBestList();
	}

}
