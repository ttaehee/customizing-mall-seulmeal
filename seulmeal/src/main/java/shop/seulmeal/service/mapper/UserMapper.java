package shop.seulmeal.service.mapper;

import org.apache.ibatis.annotations.Mapper;

import shop.seulmeal.service.domain.User;

@Mapper
public interface UserMapper {
	public int insertUser(User user);
	public User getUser(String userId);
}
