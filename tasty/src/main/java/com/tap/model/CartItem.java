package com.tap.model;


public class CartItem {
   
	private int itemId;
    private String name;
    private double price;
    private String image;
    private int quantity;
    
	public CartItem() {}


	public CartItem(int itemId, String name, double price, String image, int quantity) {
		super();
		this.itemId = itemId;
		this.name = name;
		this.price = price;
		this.image = image;
		this.quantity = quantity;
	}


	public int getItemId() {
		return itemId;
	}


	public String getName() {
		return name;
	}


	public double getPrice() {
		return price;
	}


	public String getImage() {
		return image;
	}


	public int getQuantity() {
		return quantity;
	}


	public void setItemId(int itemId) {
		this.itemId = itemId;
	}


	public void setName(String name) {
		this.name = name;
	}


	public void setPrice(double price) {
		this.price = price;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	
    // getters & setters
    
    
}
