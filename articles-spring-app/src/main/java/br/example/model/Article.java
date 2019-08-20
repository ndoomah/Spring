/**
 * 
 */
package br.example.model;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import java.io.Serializable;


@Entity
public class Article implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column
	private String title;
	
	@Column
	private String text;

	@Column
	private String status;

	@Column
	private String type;

	@Column
	private String location;
	
	public Article() {
		super();
		this.id = null;
		this.title = null;
		this.text = null;
		this.status = null;
		this.type = null;
		this.location = null;
	}
	
	public Article(String title, String text, String status, String type, String location) {
		this.id = null;
		this.title = title;
		this.text = text;
		this.location=location;
		this.status=status;
		this.type=type;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setText(String text) {
		this.text = text;
	}
	
}
