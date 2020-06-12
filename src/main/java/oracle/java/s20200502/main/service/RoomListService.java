package oracle.java.s20200502.main.service;

import java.util.List;

import oracle.java.s20200502.board.model.Board;
import oracle.java.s20200502.main.model.RoomList;
import oracle.java.s20200502.main.model.SearchRoomList;
import oracle.java.s20200502.room.model.Room;

public interface RoomListService {
	
	int total();
	//	model.RoomList(= dto)
	List<RoomList> list(RoomList roomlist);

	List<RoomList> listSearch(SearchRoomList srl);
	
	int getST(SearchRoomList srl);
	int getBT(SearchRoomList srl);
	List<Board> boardSearchList(SearchRoomList srl);
	List<Room> getBestList();


}
