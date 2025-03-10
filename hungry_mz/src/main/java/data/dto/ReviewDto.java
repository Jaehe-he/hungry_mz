package data.dto;

import java.security.Timestamp;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Alias("ReviewDto")
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ReviewDto {
	private int reviewId;
	private int restaurantId;
	private int menuId;
	private String username;
	private String reviewContent;
	private String reviewImg;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm", timezone="Asia/Seoul")
	private Timestamp writeDate;
	private int star;
	private int user_id;
	private MultipartFile file;
	private String nickname;
}
