package com.fpt.mainproject.entity;

import jakarta.persistence.*;

@Entity
public class Location {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;

	private String name;
	private String region;
	private String country;
	private Double lat;
	private Double lon;
	private String tz_id;
	private Long localtime_epoch;
	private String local_time;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public Double getLat() {
		return lat;
	}
	public void setLat(Double lat) {
		this.lat = lat;
	}
	public Double getLon() {
		return lon;
	}
	public void setLon(Double lon) {
		this.lon = lon;
	}
	public String getTz_id() {
		return tz_id;
	}
	public void setTz_id(String tz_id) {
		this.tz_id = tz_id;
	}
	public Long getLocaltime_epoch() {
		return localtime_epoch;
	}
	public void setLocaltime_epoch(Long localtime_epoch) {
		this.localtime_epoch = localtime_epoch;
	}
	public String getLocal_time() {
		return local_time;
	}
	public void setLocal_time(String local_time) {
		this.local_time = local_time;
	}



}