package com.e_um.model.vo.placeinfo.food;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class LikeFood {
	
	private String foodSeq;
	private String userId;
	private Date likeFoodDate;

}
