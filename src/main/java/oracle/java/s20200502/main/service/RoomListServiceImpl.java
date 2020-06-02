package oracle.java.s20200502.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oracle.java.s20200502.main.dao.RoomListDao;
import oracle.java.s20200502.main.model.RoomList;
import oracle.java.s20200502.main.model.SearchRoomList;

@Service
public class RoomListServiceImpl implements RoomListService {

	@Autowired
	private RoomListDao dao;

	@Override
	public int total() {
		return dao.total();
	}

	@Override
	public List<RoomList> list(RoomList roomlist) {
		// TODO Auto-generated method stub
		return dao.list(roomlist);
	}

	@Override
	public List<RoomList> listSearch(SearchRoomList srl) {
		// TODO Auto-generated method stub
		return dao.Searchlist(srl);
	}

}
