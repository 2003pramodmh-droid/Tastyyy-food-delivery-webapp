package com.tap.DAOimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.tap.DBconnectivity;
import com.tap.DAO.RestaurantDAO;
import com.tap.model.Restaurant;

public class RestaurantDAOImpl implements RestaurantDAO {

    @Override
    public List<Restaurant> getAllRestaurants() {
    	
        List<Restaurant> restaurants = new ArrayList<>();
        String query = "SELECT * FROM restaurants";

        try (Connection con = DBconnectivity.getConnection();
             PreparedStatement pstmt = con.prepareStatement(query);
             ResultSet res = pstmt.executeQuery()) {

            while (res.next()) {
//            	obejct of restaurant pojo class
                Restaurant r = new Restaurant();
                
//              setting all the restaurant details
                r.setId(res.getInt("id"));
                r.setName(res.getString("name"));
                r.setDescription(res.getString("description"));
                r.setLocation(res.getString("location"));
                r.setImage(res.getString("image"));
                
                restaurants.add(r);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return restaurants;
    }

    @Override
    public Restaurant getRestaurantById(int id) {
    	
    	
        Restaurant restaurant = null;
        String query1 = "SELECT * FROM restaurants WHERE id = ?";

        try (Connection con = DBconnectivity.getConnection();
             PreparedStatement pstmt1 = con.prepareStatement(query1)) {

            pstmt1.setInt(1, id);
            try (ResultSet res1 = pstmt1.executeQuery()) {
                if (res1.next()) {
                    restaurant = new Restaurant();
                    restaurant.setId(res1.getInt("id"));
                    restaurant.setName(res1.getString("name"));
                    restaurant.setDescription(res1.getString("description"));
                    restaurant.setLocation(res1.getString("location"));
                    restaurant.setImage(res1.getString("image"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return restaurant;
    }
}
