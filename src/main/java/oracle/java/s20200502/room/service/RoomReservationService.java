package oracle.java.s20200502.room.service;

import java.util.Map;

import oracle.java.s20200502.room.model.Reservation;

public interface RoomReservationService {

	Map<String, Object> getOneDayList(int roomNo, int ddayYear, int ddayMonth, String ddayOption);
}
