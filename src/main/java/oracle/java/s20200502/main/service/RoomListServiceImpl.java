package oracle.java.s20200502.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20200502.main.dao.RoomListDao;
import oracle.java.s20200502.main.model.RoomList;

@Service
public class RoomListServiceImpl implements RoomListService {
	
	@Autowired
	private RoomListDao rld;


	@Override
	public List<RoomList> listRoom(RoomList roomList) {
		System.out.println("RoomListServiceImpl lsitRoom start...");
		return rld.listRoom(roomList);
	}

	//게시물 총 갯수
	@Override
	public int total() {
		return rld.total();
	}

}
