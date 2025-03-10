package data.mapper;

import data.dto.RestaurantDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface RestaurantMapper {
    RestaurantDto getRestaurantById(int id);
    List<RestaurantDto> getRestaurantList();
    void insertRestaurant(RestaurantDto dto);
    RestaurantDto getRestaurantByTitle(String title);
    int getCountByTitle(String title);
    int getTotalCount();
    @Select("SELECT restaurant_id as restaurantId, title, location, image FROM restaurant ORDER BY restaurant_id ASC LIMIT #{start}, #{perpage}")
    List<RestaurantDto> getPagingListOrderByIdAsc(int start, int perpage);
    List<RestaurantDto> getPagingListOrderByStarDesc(int startNum, int perPage);
}
