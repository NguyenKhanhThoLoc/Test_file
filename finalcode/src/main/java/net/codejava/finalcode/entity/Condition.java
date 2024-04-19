package net.codejava.finalcode.entity;


import jakarta.persistence.*;

@Entity
@Table(name = "condition_table")
public class Condition {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
    private Long id;
    
    private String text;
    private String icon;
    private Integer code;
    
    
    public Long getId() {
		return id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	// Constructor
    public Condition(String text, String icon, Integer code) {
        this.text = text;
        this.icon = icon;
        this.code = code;
    }
    
    public Condition() {
    }
}
