/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.service;

import com.websystique.springmvc.model.Quiz;
import java.util.List;

/**
 *
 * @author a_bas
 */
public interface QuizService {
    
        Quiz findById(int id);

	void deleteById(int id);
	
	List<Quiz> findAllQuiz();
        
        void saveQuiz(Quiz quiz);
        
        void updateQuiz(Quiz quiz);
        
        List<Quiz> findAllQuizByUserId(int user_id);
    
}
