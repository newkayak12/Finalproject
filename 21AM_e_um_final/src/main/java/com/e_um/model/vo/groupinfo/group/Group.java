package com.e_um.model.vo.groupinfo.group;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import com.e_um.model.vo.groupinfo.member.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Component
public class Group {
	/*
	 * group에를 부를 때, member를 join 해서 가져오면 좋겠네
	 * collection을 사용하면 좋을 듯
	 */

	private String groupSeq, groupMaster, groupTheme;
	private String groupLimit;
	private String groupGender;
	private String groupComment;
	private int groupCountToday, groupCountTotal;
	private Date groupDate;
	private String groupFileUpload, groupTitle, groupAge, groupDestroyFlag;
	private int groupBoardLevel;
	
	private List<Member> members = new ArrayList<>();
	
	
}