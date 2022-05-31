package shop.seulmeal.service.domain;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Post {
	private int postNo;
	private User user;
	private String title;
	private String content;
	private String shortContent;
	private int views;
	private int commentCount;
	private int likeCount;
	private String thumnail;
	private Date regDate;
	private Date updateDate;
	private Date endDate;
	private String postStatus;
	private String publicStatus;
	private int password;
	private String answerStatus;
	private String status;
	
	// post媛� comment瑜� 媛�吏�怨� �엳�떎.
	private List<Comment> comments;
	private List<Attachments> attachments;
}
