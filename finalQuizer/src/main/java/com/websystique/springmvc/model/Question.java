package com.websystique.springmvc.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import org.hibernate.validator.constraints.NotEmpty;


@Entity
@Table(name = "question")
public class Question implements Serializable {
        
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
        private int id;
	
    
//many questions can belong to one quiz
//ManytoOne relationship
//    //@NotEmpty
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="quiz_id")
    private Quiz quiz;

    public Quiz getQuiz() {
        return quiz;
    }

    public void setQuiz(Quiz quiz) {
        this.quiz = quiz;
    }

    
    @NotEmpty
        @Column(name= "question_type", nullable = false)
        private String question_type;		//MCQ, True or False , numerical  
	
        
        @NotEmpty
    	@Column(name= "title", nullable = false)
        private String question_title;  	//question
        
        @NotEmpty
        @Column(name= "answer", nullable = false)
        private String answer;         //answer
	
        
        @Column(name= "opt1" , nullable = true)
        private String opt1;           //possible options
	
        
        @Column(name= "opt2" , nullable = true)
        private String opt2;
        
        
        @Column(name= "opt3" , nullable = true)
        private String opt3;           //possible options
	
        
        @Column(name= "opt4" , nullable = true)
        private String opt4;
        
        @NotEmpty
        @Column(name= "marks" , nullable = false)
        private int question_marks;           //marks
        
        

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQuestion_type() {
        return question_type;
    }

    public void setQuestion_type(String question_type) {
        this.question_type = question_type;
    }

    public String getQuestion_title() {
        return question_title;
    }

    public void setQuestion_title(String question_title) {
        this.question_title = question_title;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getOpt1() {
        return opt1;
    }

    public void setOpt1(String opt1) {
        this.opt1 = opt1;
    }

    public String getOpt2() {
        return opt2;
    }

    public void setOpt2(String opt2) {
        this.opt2 = opt2;
    }

    public String getOpt3() {
        return opt3;
    }

    public void setOpt3(String opt3) {
        this.opt3 = opt3;
    }

    public String getOpt4() {
        return opt4;
    }

    public void setOpt4(String opt4) {
        this.opt4 = opt4;
    }

    public int getQuestion_marks() {
        return question_marks;
    }

    public void setQuestion_marks(int question_marks) {
        this.question_marks = question_marks;
    }
            
        
        @Override
    public String toString() {
        return "Question{" + "id=" + id + ", question_title=" + question_title + 
                ", question_type=" + question_type + ", question_answer=" + answer
                + ", ans_option1=" + opt1 +", ans_option2=" + opt2+", ans_option3=" 
                + opt3 +", ans_option4=" + opt4 + ", question_marks=" + question_marks + '}';
    }
	
	
 
}
