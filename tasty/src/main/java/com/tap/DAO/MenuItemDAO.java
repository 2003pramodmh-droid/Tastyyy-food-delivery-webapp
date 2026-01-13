package com.tap.DAO;

import java.util.List;
import com.tap.model.MenuItem;

public interface MenuItemDAO {

    List<MenuItem> getMenuByRestaurantId(int restaurantId);
}
