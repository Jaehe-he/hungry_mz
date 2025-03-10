package com.menu.service;

import data.dto.MenuDto;
import data.mapper.MenuMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MenuService {
    @Autowired
    MenuMapper mapper;
    public void insertMenu(MenuDto dto){
        mapper.insertMenu(dto);
    }
    public List<MenuDto> getMenuListByRestaurantId(int restaurantId){
        return mapper.getMenuListByRestaurantId(restaurantId);
    }
    public MenuDto getMenuByMenuId(int menuId){
        return mapper.getMenuByMenuId(menuId);
    }
    public void deleteMenuByMenuId(int menuId){
        mapper.deleteMenuByMenuId(menuId);
    }
    public void updateMenu(MenuDto dto){
        mapper.updateMenu(dto);
    }
    public List<MenuDto> getMenuListOrderByPriceAsc(){
        return mapper.getMenuListOrderByPriceAsc();
    }
    public List<MenuDto> getMenuListOrderByPriceDesc(){
        return mapper.getMenuListOrderByPriceDesc();
    }
    public int getTotalCount(){
        return mapper.getTotalCount();
    }
    public List<MenuDto> getPagingListOrderByPriceDesc(int start, int perpage){
        return mapper.getPagingListOrderByPriceDesc(start, perpage);
    }
    public List<MenuDto> getPagingListOrderByPriceAsc(int start, int perpage){
        return mapper.getPagingListOrderByPriceAsc(start, perpage);
    }
}