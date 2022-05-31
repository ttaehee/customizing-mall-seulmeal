package shop.seulmeal.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Parts {
	private int partsNo;
	private String name;
	private int price;
	private int calorie;
	private Date regDate;
	private String status;
	
	// productNo
	private int productNo;
}
