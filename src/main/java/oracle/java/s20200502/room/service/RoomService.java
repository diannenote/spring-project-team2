package oracle.java.s20200502.room.service;

import java.util.List;

import oracle.java.s20200502.room.model.Room;

public interface RoomService {

	int insert(Room room);

	int titleToNum(String ro_title);

	int total();

	List<Room> getList(Room room);

	Room getRoomContent(int ro_num);

	void upHit(int ro_num);

	int update(Room room);

	int delete(int ro_num);
	
}
