package shop.seulmeal.service.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class CustomParts {
	private int customPartsNo;
	private int customProductNo;
	private int gram;
	private int productPartsNo; //제외재료 
	private String productPartsName;
	private Parts parts; //추가재료 
	
}