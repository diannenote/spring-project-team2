package oracle.java.s20200502.main.service;

import java.util.List;

import oracle.java.s20200502.main.model.RoomList;
import oracle.java.s20200502.main.model.SearchRoomList;

public interface RoomListService {
	
	int total();
	
	//	model.RoomList(= dto)
	List<RoomList> list(RoomList roomlist);

	List<RoomList> listSearch(SearchRoomList srl);

}
