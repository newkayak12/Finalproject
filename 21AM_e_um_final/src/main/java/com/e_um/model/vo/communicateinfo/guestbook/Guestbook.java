package com.e_um.model.vo.communicateinfo.guestbook;

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
public class Guestbook {
	
	private String guestbookSeq, userIdReceiver, userIdWriter, guestbookComment;
	private Date guestbookDate;
	private String guestbookFlag, guestbookBlock;

}
