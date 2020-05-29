package oracle.java.s20200502.room.dao;

import java.util.Map;

import oracle.java.s20200502.room.model.Reservation;

public interface RoomReservationDao {

	public Reservation roomReserveCheck(Map<String, Object> map);
}
