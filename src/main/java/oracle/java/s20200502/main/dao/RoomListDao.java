package oracle.java.s20200502.main.dao;

import java.util.List;

import oracle.java.s20200502.board.model.Board;
import oracle.java.s20200502.main.model.RoomList;
import oracle.java.s20200502.main.model.SearchRoomList;
import oracle.java.s20200502.room.model.Room;


public interface RoomListDao {

	public int total();
	
	List<RoomList> list(RoomList roomlist);
	
	List<RoomList> Searchlist(SearchRoomList roomlist);

	public int getST(SearchRoomList srl);

	public List<Board> boardSearchList(SearchRoomList srl);

	public int getBT(SearchRoomList srl);

	public List<Room> getBestList();
	
	
}
