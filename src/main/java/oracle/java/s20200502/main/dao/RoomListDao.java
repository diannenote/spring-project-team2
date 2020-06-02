package oracle.java.s20200502.main.dao;

import java.util.List;

import oracle.java.s20200502.main.model.RoomList;
import oracle.java.s20200502.main.model.SearchRoomList;


public interface RoomListDao {

	public int total();
	
	List<RoomList> list(RoomList roomlist);
	
	List<RoomList> Searchlist(SearchRoomList roomlist);
}
