package com.restaurant.controller;

import com.restaurant.service.RestaurantService;
import data.dto.RestaurantDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/restaurant")
public class RestaurantController {
    private final RestaurantService restaurantService;
    @GetMapping("")
    @ResponseBody
    public List<RestaurantDto>getRestaurantList(){
        return restaurantService.getRestaurantList();
    }
    @ResponseBody
    @GetMapping("/{restaurantId}")
    public RestaurantDto getRestaurantById(@PathVariable int restaurantId){
        return restaurantService.getRestaurantById(restaurantId);
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
