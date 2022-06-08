package shop.seulmeal.service.domain;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;




@Getter
@Setter
@ToString
@JsonInclude(Include.NON_DEFAULT)
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
	private String confirmStatus;
	private int blackLsitCount;
	private int purchaseCount;
	private String blackListStatus;
	private String foodCategoryName1;
	private String foodCategoryName2;
	private String foodCategoryName3;
	private List<Parts> parts;
	//private List<> follow;
	private List<Relation> relation;
	private List<Like> wish;
	
	
}
