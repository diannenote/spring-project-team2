package oracle.java.s20200502.room.service;

import java.util.List;

public interface RoomImgService {

	int insert(List<String> pathList, int ro_num);

	List<String> getRoomImg(int ro_num);

	int delete(int ro_num);


}
