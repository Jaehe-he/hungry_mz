package com.restaurant.controller;

import com.restaurant.service.RestaurantService;
import data.dto.MenuDto;
import data.dto.RestaurantDto;
import data.service.ReviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/restaurant")
public class RestaurantController {
    private final RestaurantService restaurantService;
    private final ReviewService reviewService;
    @GetMapping("/list")
    public String restaurantList(@RequestParam(value="pageNum", defaultValue = "1") int pageNum, Model model, @RequestParam String orderMethod){
        if (pageNum==0)
            pageNum=1;
        //페이징 처리
        int perPage=10;//한페이지당 출력할 글의 갯수
        int perBlock=10; //한 블럭당 출력할 페이지 갯수
        int totalCount;//전체 게시글 갯수
        int totalPage; //총 페이지수
        int startNum;//각 페이지에서 가져올 시작번호(mysql은 첫데이타가 0번,오라클은 1번)
        int startPage;//각 블럭에서 출력할 시작페이지
        int endPage;//각 블럭에서 출력할 끝페이지
        int no;//각페이지에서 출력할 시작번호
        List<RestaurantDto> list=null; //페이징에 필요한 데이타

        totalCount=restaurantService.getTotalCount();//총 글갯수
        //totalPage=totalCount/perPage+(totalCount%perPage>0?1:0);//총 페이지 갯수,나머지가 있으면 무조건 1페이지를 더한다
        totalPage=(int)Math.ceil((double)totalCount/perPage);//방법2,무조건 올림함수를 이용해서 구하는방법
        //시작페이지
        startPage=(pageNum-1)/perBlock*perBlock+1;//예:현재페이지가 7일경우 startPage 가 6(perBlock이5일경우)
        endPage=startPage+perBlock-1;//끝페이지
        //endPage 는 totalPage 를 넘을수 없다
        if(endPage>totalPage)
            endPage=totalPage;

        //각 페이지에서 불러올 시작번호
        startNum=(pageNum-1)*perPage; //mysql 은 첫글이 0번(오라클은 1번이므로 +1해야한다)
        if(orderMethod.equals("starDesc")){
            list=restaurantService.getPagingListOrderByStarDesc(startNum, perPage);
        }else if(orderMethod.equals("likeDesc")){
            list = restaurantService.getPagingListOrderByIdAsc(startNum, perPage);
        }
        //list = restaurantService.getPagingListOrderByIdAsc(startNum, perPage);
        for(RestaurantDto dto : list){
            System.out.println(dto);
        }
        //각페이지의 글앞에 출력할 시작번호(예:총글이 20개일경우 1페이지는 20,2페이이즌 15..)
        no=totalCount-(pageNum-1)*perPage;

        //request 에 저장
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("list", list);
        //페이지 출력에 필요한 모든 변수를 request 에 넣는다
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);
        model.addAttribute("no", no);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("totalPage", totalPage);
        model.addAttribute("orderMethod", orderMethod);
        System.out.println("orderMethod : "+orderMethod);
        System.out.println("startNum:"+startNum);
        System.out.println("perPage:"+perPage);
        return "food/restaurantList";
    }
    public List<RestaurantDto>getRestaurantList(){
        return restaurantService.getRestaurantList();
    }
    @ResponseBody
    @GetMapping("/{restaurantId}")
    public RestaurantDto getRestaurantById(@PathVariable int restaurantId){
        RestaurantDto dto = restaurantService.getRestaurantById(restaurantId);
        int reviewCount = reviewService.getRestaurantReviewCount(restaurantId);
        dto.setReviewCount(reviewCount);
        return dto;
    }
    @ResponseBody
    @GetMapping("/random")
    public RestaurantDto getRandomRestaurant(){
        int count = restaurantService.getTotalCount();
        int randomNum = (int)(Math.random()*count);
        System.out.println("count: "+count);
        System.out.println("randomNum : " + randomNum);
        return restaurantService.getRestaurantById(randomNum);
    }
}
