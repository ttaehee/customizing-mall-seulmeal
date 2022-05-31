package shop.seulmeal.service.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Point {
	private int pointNo;
	private User user;
	private Purchase purchase;
	private String pointStatus;
	private int point;
	private Date regDate;
}
