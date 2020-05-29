package oracle.java.s20200502.room.dao;

import java.util.List;


public interface RoomImgDao {

	int insert(List<String> pathList, int ro_num);

	List<String> getRoomImg(int ro_num);

	int delete(int ro_num);

}
