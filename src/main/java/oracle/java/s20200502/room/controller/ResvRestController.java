package oracle.java.s20200502.room.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import oracle.java.s20200502.room.model.Reservation;
import oracle.java.s20200502.room.service.RoomService;


//@Controller+@ResponseBody
	@RestController
	@RequestMapping("/resv")
	public class ResvRestController {
		@Autowired
		private RoomService rs;

	@RequestMapping("/reservation")
	public Reservation reservation(int ro_num,String re_rvdate) {
		System.out.println("@RestController ro_num->"+ro_num);
		System.out.println("@RestController re_rvdate->"+re_rvdate);
		Reservation reservation = new Reservation();
		reservation.setRo_num(ro_num);
		reservation.setRe_rvDate(re_rvdate);
		//예약일자 변경
	//	rs.resvUpdate(reservation);
		return reservation;
		
	}
	
}
