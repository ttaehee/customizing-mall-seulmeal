package shop.seulmeal.service.mapper;

import java.awt.Point;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import shop.seulmeal.service.domain.BlackList;
import shop.seulmeal.service.domain.User;

@Mapper
public interface UserMapper {

	public int insertUser(User user) throws Exception;
	
	public User getUser(String userId) throws Exception;
	
	public int updateUser(User user) throws Exception;
	
	public int daleteUser(User user) throws Exception;
	
	public List<User> getListUser(Search search) throws Exception;
	
	public int checkDuplicationUserId(String userId) throws Exception;
	
	public int checkDuplicationNickName(String nickName) throws Exception;
		
	public int getListUserTotalCount(int no) throws Exception;
	
	public int updateUserGrade(int no) throws Exception;
	
	public int updateUserTotalCount(int no) throws Exception;
	
	public int insertBlackList(BlackList blackList) throws Exception;
	
	public int updateBlackList(BlackList blackList) throws Exception;
	
	public List<BlackList> getListBlackList(Search search) throws Exception;
	
	public int insertPoint(Point point) throws Exception;
	
	public Point getPoint(Point point) throws Exception;
	
	public List<Point> getListPoint(Search search) throws Exception;
	
	public int getListPointTotalCount(int no) throws Exception;
	
	
	
}
