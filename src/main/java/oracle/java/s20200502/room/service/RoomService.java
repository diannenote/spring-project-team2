package oracle.java.s20200502.room.service;

import java.util.List;

import oracle.java.s20200502.main.model.Member;
import oracle.java.s20200502.room.model.Payment;
import oracle.java.s20200502.room.model.Reservation;
import oracle.java.s20200502.room.model.Room;

public interface RoomService {
//  dubin
	int insert(Room room);
	int titleToNum(String ro_title);
	int total();
	List<Room> getList(Room room);
	Room getRoomContent(int ro_num);
	void upHit(int ro_num);
	int update(Room room);
	int delete(int ro_num);
	int contentUp(int ro_num);
	int contentDown(int ro_num);
//  hyerin
	Member getMemberContent(int m_num);
	int morningReserve(Reservation reservation);
	int afterReserve(Reservation reservation);
	int nightReserve(Reservation reservation);
	Reservation getReservationContent(int re_num);
	int payInsert(Payment pm);
	List<Room> getListLoc(Room room);
	int locTotal(String ro_loc);
	int levelTotal();
}
