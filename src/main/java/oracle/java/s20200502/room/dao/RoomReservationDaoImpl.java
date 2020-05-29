package oracle.java.s20200502.room.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20200502.room.model.Reservation;

@Repository
public class RoomReservationDaoImpl implements RoomReservationDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public Reservation roomReserveCheck(Map<String, Object> map) {
		System.out.println("RoomReservationDaoImpl roomReserveCheck Start...");
		return session.selectOne("roomReserveCheck", map);
	}
	

	
}
