package oracle.java.s20200502.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20200502.room.dao.RoomDao;
import oracle.java.s20200502.room.model.Room;

@Service
public class RoomServiceImpl implements RoomService {
	
	@Autowired
	private RoomDao rd;

	@Override
	public int insert(Room room) {
		System.out.println("RoomServiceImpl insert Start...");
		return rd.insert(room);
	}

	@Override
	public int titleToNum(String ro_title) {
		System.out.println("RoomServiceImpl titleToNum Start...");
		return rd.titleToNum(ro_title);
	}

	@Override
	public int total() {
		return rd.total();
	}

	@Override
	public List<Room> getList(Room room) {
		System.out.println("RoomServiceImpl getList Start...");
		return rd.getList(room);
	}

	@Override
	public Room getRoomContent(int ro_num) {
		System.out.println("RoomServiceImpl getRommContent Start...");
		return rd.getRoomContent(ro_num);
	}

	@Override
	public void upHit(int ro_num) {
		rd.upHit(ro_num);
	}

	@Override
	public int update(Room room) {
		System.out.println("RoomServiceImpl update Start...");
		return rd.update(room);
	}

	@Override
	public int delete(int ro_num) {
		System.out.println("RoomServiceImpl delete Start...");
		return rd.delete(ro_num);
	}

	@Override
	public int contentUp(int ro_num) {
		System.out.println("RoomServiceImpl contentUp Start...");
		return rd.contentUp(ro_num);
	}

	@Override
	public int contentDown(int ro_num) {
		System.out.println("RoomServiceImpl contentDown Start...");
		return rd.contentDown(ro_num);
	}
}
