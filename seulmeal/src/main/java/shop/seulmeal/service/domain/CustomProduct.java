package shop.seulmeal.service.domain;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class CustomProduct {
	private int customProductNo;
	private User user;
	private Product product;
	private Purchase purchase;
	private int count;
	private String cartStatus;
	private Date regDate;
	
	// customParts를 가지고 있다
	private List<CustomParts> customParts;
}
