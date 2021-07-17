package com.e_um.model.vo.placeinfo.food.booking;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.placeinfo.food.food.Food;
import com.e_um.model.vo.userInfo.user.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class FoodBooking {
	
	/*
	 * 
	 * 예약시 점포에 대한 정보와 user에 대한 정보가 필요할 것으로 보임
	 * 필요하면 바꿔주세요
	 */
	private String foodBookingSeq;
	private User user;
	private Food food;
	private Date bookingDateDay;
	private Date bookingDateTime;
	private int bookingHead;
	private String bookingContents, bookingCancelFlag;
	
	
}
