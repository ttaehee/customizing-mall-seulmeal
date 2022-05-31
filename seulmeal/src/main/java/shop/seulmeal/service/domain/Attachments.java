package shop.seulmeal.service.domain;

import java.sql.Date;

import lombok.Setter;
import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Attachments {
	private int attachmentNo;
	private String attachmentName;
	private Date regDate;
	private String status;
}
