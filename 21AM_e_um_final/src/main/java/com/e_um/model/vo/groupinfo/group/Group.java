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

	private String group_seq, group_master, group_theme;
	private String group_limit;
	private String group_gender;
	private String group_comment;
	private int group_count_today, group_count_total;
	private Date group_date;
	private String group_file_upload, group_title, group_age, group_destroy_flag;
	
	private List<Member> members = new ArrayList<>();
	
}
