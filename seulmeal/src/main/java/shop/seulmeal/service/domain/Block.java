package shop.seulmeal.service.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Block {

	private int blockNo;
	private String userId;
	private String blockedUserId;

}
