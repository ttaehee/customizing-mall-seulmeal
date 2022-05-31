package shop.seulmeal.service.domain;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;




@Getter
@Setter
@ToString
public class User {
	
	private String userId;
	private String userName;
	private String password;
	private Date birth;
	private String address;
	private String phone;
	private String email;
	private String grade;
	private Date regDate;
	private Date loginDate;
	private int blockCount;
	private String nickName;
	private String profileImage;
	private String profileMessage;
	private String role;
	private String userStatus;
	private int totalCount;
	private String comfirmStatus;
	private int blackLsitCount;
	private int purchaseCount;
	private String blackListStatus;
	private String foodCategoryName1;
	private String foodCategoryName2;
	private String foodCategoryName3;
	private List<Parts> parts;
	//private List<Follow> follow;
	private List<Block> block;
	//private List<Wish> wish;
	
	
}
