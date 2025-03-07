package data.service;

import java.util.List;

import org.springframework.stereotype.Service;

import data.dto.ReviewDto;
import data.mapper.ReviewMapper;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ReviewService {
	ReviewMapper reviewMapper;
	
	public void insertReview(ReviewDto dto) {
		reviewMapper.insertReview(dto);
	}
	
	public List<ReviewDto> getSelectReviews(int restaurantId){
		return reviewMapper.getSelectReviews(restaurantId);
	}
	
	public ReviewDto getSelectData(int reviewId) {
		return reviewMapper.getSelectData(reviewId);
	}
	
	public void deleteReview(int reviewId) {
		reviewMapper.deleteReview(reviewId);
	}
}
