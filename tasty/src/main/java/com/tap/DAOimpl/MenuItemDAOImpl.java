package com.tap.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.MenuItemDAO;
import com.tap.model.MenuItem;
import com.tap.*;

public class MenuItemDAOImpl implements MenuItemDAO {

    private static final String GET_MENU_BY_RESTAURANT =
            "SELECT * FROM menu_items WHERE restaurant_id = ?";

    @Override
    public List<MenuItem> getMenuByRestaurantId(int restaurantId) {

        List<MenuItem> menuList = new ArrayList<>();

        try ( Connection con = DBconnectivity.getConnection();
            PreparedStatement pstmt = con.prepareStatement(GET_MENU_BY_RESTAURANT)) 
        {
            pstmt.setInt(1, restaurantId);
            ResultSet res = pstmt.executeQuery();

            while (res.next()) {
                MenuItem item = new MenuItem();
                item.setId(res.getInt("id"));
                item.setRestaurantId(res.getInt("restaurant_id"));
                item.setItemName(res.getString("item_name"));
                item.setPrice(res.getDouble("price"));
                item.setImage(res.getString("image"));

                menuList.add(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return menuList;
    }
}
