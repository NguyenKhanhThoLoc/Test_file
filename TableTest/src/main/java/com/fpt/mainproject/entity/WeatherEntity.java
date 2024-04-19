package com.fpt.mainproject.entity;


import jakarta.persistence.*;

@Entity
@Table(name = "weather")
public class WeatherEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
    private Long id;
    
   	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "location_id", referencedColumnName = "id")
    private Location location;
    
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "current_id", referencedColumnName = "id")
    private Current current;
    

	public Long getId() {
		return id;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public Current getCurrent() {
		return current;
	}

	public void setCurrent(Current current) {
		this.current = current;
	}
    
 
    
    
     //Constructor
    public WeatherEntity(Location location, Current current) {
        this.location = location;
        this.current = current;
    }

	public WeatherEntity() {

	}
}