package com.tap.model;

public class Restaurant {
	
		private int id;
	    private String name;
	    private String description;
	    private String location;
	    private String image;
	    
	    
		public Restaurant() {
			super();
			// TODO Auto-generated constructor stub
		}


		public Restaurant(int id, String name, String description, String location, String image) {
			super();
			this.id = id;
			this.name = name;
			this.description = description;
			this.location = location;
			this.image = image;
		}


		public int getId() {
			return id;
		}


		public String getName() {
			return name;
		}


		public String getDescription() {
			return description;
		}


		public String getLocation() {
			return location;
		}


		public String getImage() {
			return image;
		}


		public void setId(int id) {
			this.id = id;
		}


		public void setName(String name) {
			this.name = name;
		}


		public void setDescription(String description) {
			this.description = description;
		}


		public void setLocation(String location) {
			this.location = location;
		}


		public void setImage(String image) {
			this.image = image;
		}
	    
	    

}
