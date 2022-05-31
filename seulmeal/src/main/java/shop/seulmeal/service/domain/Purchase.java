package shop.seulmeal.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Purchase {
	private int purchaseNo;
	private User user;
	private int price;
	private int deliveryPrice;
	private String address;
	private String name;
	private String phone;
	private String message;
	private String purchaseStatus;
	private String reson;
	private String image;
	private String status;
	private Date regDate;
	private String paymentCondition;
	private String imp_uid;
	private int amount;
}
