package com.tap.model;

public class MenuItem {
	
	 	private int id;
	    private int restaurantId;
	    private String itemName;
	    private double price;
	    private String image;
	    
		public MenuItem() {
			super();
			// TODO Auto-generated constructor stub
		}

		public MenuItem(int id, int restaurantId, String itemName, double price, String image) {
			super();
			this.id = id;
			this.restaurantId = restaurantId;
			this.itemName = itemName;
			this.price = price;
			this.image = image;
		}

		public int getId() {
			return id;
		}

		public int getRestaurantId() {
			return restaurantId;
		}

		public String getItemName() {
			return itemName;
		}

		public double getPrice() {
			return price;
		}

		public String getImage() {
			return image;
		}

		public void setId(int id) {
			this.id = id;
		}

		public void setRestaurantId(int restaurantId) {
			this.restaurantId = restaurantId;
		}

		public void setItemName(String itemName) {
			this.itemName = itemName;
		}

		public void setPrice(double price) {
			this.price = price;
		}

		public void setImage(String image) {
			this.image = image;
		}
	    
	    

}
