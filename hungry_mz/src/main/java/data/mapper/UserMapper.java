package data.mapper;

import data.dto.UserDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserMapper {
	public int checkUsername(String username);
	public List<UserDto> getAllUsers();
	public void insertUser(UserDto dto);
	public int loginCheck(String username, String password);
	public void deleteUser(int user_id);
	public void updateUser(UserDto dto);
	public UserDto getSelectByUsername(String username);
}
