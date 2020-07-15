package oracle.java.s20200502.room.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20200502.main.model.Member;
import oracle.java.s20200502.room.model.Payment;
import oracle.java.s20200502.room.model.Reservation;
import oracle.java.s20200502.room.model.Room;

@Repository
public class RoomDaoImpl implements RoomDao {

	@Autowired
	private SqlSession session;

//	dubin@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@Override
	public int insert(Room room) {
		System.out.println("RoomDaoImpl insert Start...");
		return session.insert("roomInsert", room);
	}
	@Override
	public int titleToNum(String ro_title) {
		System.out.println("RoomDaoImpl titleToNum Start...");
		return session.selectOne("titleToNum", ro_title);
	}
	@Override
	public int total() {
		return session.selectOne("roomTotal");
	}
	@Override
	public List<Room> getList(Room room) {
		System.out.println("RoomDaoImpl getList Start...");
		return session.selectList("getRoomList", room);
	}
	@Override
	public Room getRoomContent(int ro_num) {
		System.out.println("RoomDaoImpl getRoomContent Start...");
		return session.selectOne("getRoomContent", ro_num);
	}
	@Override
	public void upHit(int ro_num) {
		session.update("upHit", ro_num);
	}
	@Override
	public int update(Room room) {
		System.out.println("RoomDaoImpl update Start...");
		return session.update("roomUpdate", room);
	}
	@Override
	public int delete(int ro_num) {
		System.out.println("RoomDaoImpl delete Start...");
		return session.delete("deleteRoom", ro_num);
	}
	@Override
	public int contentUp(int ro_num) {
		System.out.println("RoomDaoImpl contentUp Start...");
		return session.update("contentUp", ro_num);
	}
	@Override
	public int contentDown(int ro_num) {
		System.out.println("RoomDaoImpl contentDown Start...");
		return session.update("contentDown", ro_num);
	}
//  hyerin@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@Override
	public Member getMemberContent(int m_num) {
		// TODO Auto-generated method stub
		return session.selectOne("getMemberContent", m_num);
	}
	@Override
	public int morningReserve(Reservation reservation) {
		System.out.println("RoomDaoImpl morningReserve");
		return session.insert("morningReserve", reservation);
	}
	@Override
	public int afterReserve(Reservation reservation) {
		System.out.println("RoomDaoImpl afterReserve");
		return session.insert("afterReserve", reservation);
	}
	@Override
	public int nightReserve(Reservation reservation) {
		System.out.println("RoomDaoImpl nightReserve");
		return session.insert("nightReserve", reservation);
	}
	@Override
	public Reservation getRervationContent(int re_num) {
		return session.selectOne("getMemberContent",re_num);
	}
	@Override
	public int payInsert(Payment pm) {
		return session.insert("payInsert", pm);
	}
	@Override
	public List<Room> getListLoc(Room room) {
		return session.selectList("getListLoc", room);
	}
	@Override
	public int locTotal(String ro_loc) {
		return session.selectOne("locTotal", ro_loc);
	}
	@Override
	public int levelTotal() {
		return session.selectOne("levelTotal");
	}
	@Override
	public List<Room> getList0(Room room) {
		return session.selectList("getRoomList0", room);
	}
	@Override
	public Reservation getReservation(Member member) {
		return session.selectOne("getReservation", member);
	}
	@Override
	public List<Reservation> getReservationList(Member member) {
		return session.selectList("getReservationList", member);
	}
}
