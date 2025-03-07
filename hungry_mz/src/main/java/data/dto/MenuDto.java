package data.dto;

import lombok.Data;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@Data
@Alias("MenuDto")
@ToString
public class MenuDto {
    private int menuId;
    private int restaurantId;
    private String name;
    private String price;
    private String image;
    private String description;
    private Timestamp registeredDate;
    private int reviewCount;
}
