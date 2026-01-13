package com.tap.DAO;

import java.util.List;
import com.tap.model.Restaurant;

public interface RestaurantDAO {
	
    List<Restaurant> getAllRestaurants();
    Restaurant getRestaurantById(int id);
}
