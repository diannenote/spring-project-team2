package oracle.java.s20200502.main.service;

import java.util.List;

import oracle.java.s20200502.main.model.RoomList;

public interface RoomListService {
	//리스트 출력
	List<RoomList> listRoom(RoomList roomList);
	//게시물 총 갯수
	int total();
	

}
