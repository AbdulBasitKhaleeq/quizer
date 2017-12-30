package com.websystique.springmvc.model;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotEmpty;





@Entity
@Table(name="quiz")
public class Quiz {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
        private int id;
    
    @NotEmpty
    @Column(name = "title", nullable = false)
	private String title;

    
    //Quiz Teacher RelationShip
    //@NotEmpty
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
    
    

  public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }    


    @NotEmpty
    @Column(name = "description",  nullable = false)
        private String description;

    
    // Quiz Question RelationShip
    @OneToMany(mappedBy = "quiz")
    private List<Question> question;

    public List<Question> getQuestion() {
        return question;
    }

    public void setQuestion(List<Question> question) {
        this.question = question;
    }
    
    
    
    
    
    
    
    //Getter setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Quiz{" + "id=" + id + ", title=" + title + ", description=" + description + '}';
    }
    
    
    
    
}
