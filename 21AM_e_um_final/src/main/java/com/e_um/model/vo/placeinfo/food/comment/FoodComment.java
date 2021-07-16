package com.e_um.model.vo.placeinfo.food.comment;

import java.util.Date;

import org.springframework.stereotype.Component;

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
public class FoodComment {
	
/*
 * user에 대한 프로필 사진이 필요할 수도 있으니 join해서 가져올 듯
 */
	private String foodCommentSeq;
	private User user;
	private Date foodDate;
	private String foodCommentContents, foodPhoto;
	private int foodCommentStar;
	private String foodCommentFlag, foodCommentBlock, foodCommentCount;
}
