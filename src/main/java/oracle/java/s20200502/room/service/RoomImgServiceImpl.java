package oracle.java.s20200502.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20200502.room.dao.RoomImgDao;
import oracle.java.s20200502.room.model.Room;

@Service
public class RoomImgServiceImpl implements RoomImgService {
	
	@Autowired
	private RoomImgDao rid;

	@Override
	public int insert(List<String> pathList, int ro_num) {
		System.out.println("RoomImgDaoImpl insert Start...");
		return rid.insert(pathList, ro_num);
	}

	@Override
	public List<String> getRoomImg(int ro_num) {
		System.out.println("RoomImgDaoImpl getRoomImg Start...");
		return rid.getRoomImg(ro_num);
	}

	@Override
	public int delete(int ro_num) {
		System.out.println("RoomImgDaoImpl delete Start...");
		return rid.delete(ro_num);
	}
}
