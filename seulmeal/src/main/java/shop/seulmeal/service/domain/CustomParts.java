package shop.seulmeal.service.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class CustomParts {
	private int customPartsNo;
	private Parts parts;
	private int gram;
}
