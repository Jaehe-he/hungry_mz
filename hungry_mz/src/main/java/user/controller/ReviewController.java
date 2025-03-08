package user.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.naver.storage.NcpObjectStorageService;

import data.dto.ReviewDto;
import data.service.ReviewService;
import data.service.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/review")
public class ReviewController {
	final UserService userService;
	final ReviewService reviewService;
	final NcpObjectStorageService storageService;
	
	//버켓 이름
	private String bucketName = "bucketcamp148"; //원웅님꺼
	
	private String uploadFilename; //댓글에서 업로드한 파일명;
	
	@PostMapping("/reviewupload")
	public String upload(@RequestParam("upload") MultipartFile upload) {
		//사진 다시 올릴 경우 이전 사진 삭제
		if(uploadFilename !=null) {
			storageService.deleteFile(bucketName, "review", uploadFilename);
		}
		
		uploadFilename=storageService.uploadFile(bucketName, "review", upload);
		return uploadFilename;
	}
	
	@GetMapping("/reviewphotodel")
	public void photoDel(@RequestParam String fname) {
		storageService.deleteFile(uploadFilename, "review", fname);
		uploadFilename=null;
	}
	
	@PostMapping("/addreview")
	public void addReview(@RequestParam int restaurantId, @RequestParam String reviewContent,
			HttpSession session){
		//로그인한 아이디
		String username=(String)session.getAttribute("username");
		
		//클래스명.builder()로 시작하여 값 세팅 후 build() 호출하여 객체 생성
		ReviewDto dto=ReviewDto.builder()
				.restaurantId(restaurantId)
				.reviewContent(reviewContent)
				.username(username)
				.reviewImg(uploadFilename)
				.build();
		
		reviewService.insertReview(dto);
		uploadFilename=null;
		}
	
	@GetMapping("/reviewlist")
	public List<ReviewDto> getReviewList(@RequestParam int restaurantId){
		System.out.println("restaurantId="+restaurantId);
		List<ReviewDto> rlist = reviewService.getSelectReviews(restaurantId);
		for(int i=0;i<rlist.size();i++) {
			String nickname=userService.getSelectByUsername(rlist.get(i).getUsername()).getNickname();
			rlist.get(i).setNickname(nickname); //댓글 작성자 저장
		}
		return rlist;
	}
	
	@GetMapping("/reviewdel")
	public void reviewDelete(@RequestParam int reviewId) {
		//reviewId에 해당하는 이미지명 얻기
		String reviewPhoto = reviewService.getSelectData(reviewId).getReviewImg();
		//null이 아닐경우 스토리지에서 삭제
		if(reviewPhoto!=null) {
			storageService.deleteFile(bucketName, "review", reviewPhoto);
			
			//db에서 삭제
			reviewService.deleteReview(reviewId);
		}
	}
	
	@GetMapping("/reviewform")
	public String reviewForm() {
		System.out.println("1");
		return "review/reviewform";
	}
}