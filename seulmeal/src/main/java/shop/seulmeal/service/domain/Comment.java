package shop.seulmeal.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Comment {
	private int commentNo;
	private User user;
	private String content;
	private String layer;
	private int likeCount;
	private String status;
	private Date regDate;
	private Date updateDate;
	private int parentCommentNo;
}
