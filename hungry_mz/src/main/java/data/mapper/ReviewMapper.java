package data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.dto.ReviewDto;

@Mapper
public interface ReviewMapper {
	public void insertReview(ReviewDto dto);
	public List<ReviewDto> getSelectReviews(int restaurantId);
	public ReviewDto getSelectData(int reviewId);
	public void deleteReview(int reviewId);
}
