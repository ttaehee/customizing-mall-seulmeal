package shop.seulmeal.service.domain;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@Data
public class User {
	private String userId;
	private String userName;
	private String password;
	private String role;
}
