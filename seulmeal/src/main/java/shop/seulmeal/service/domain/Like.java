package shop.seulmeal.service.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Like {
	 
	private int likeNo;
	private String userId; 
	private int postNo;
	private int commentNo;
	private int productNo;
	
}
