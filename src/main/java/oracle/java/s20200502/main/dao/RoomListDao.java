package oracle.java.s20200502.main.dao;

import java.util.List;

import oracle.java.s20200502.main.model.RoomList;


public interface RoomListDao {

	public List<RoomList> listRoom(RoomList roomList);
	//게시물 총 갯수
	public int total();
}
