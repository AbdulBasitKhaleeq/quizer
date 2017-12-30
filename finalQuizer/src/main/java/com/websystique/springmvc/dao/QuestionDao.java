/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.Question;
import java.util.List;

/**
 *
 * @author a_bas
 */
public interface QuestionDao {
        
    	Question findById(int id);

	void deleteById(int id);
	
	List<Question> findAllQuestion();
        
        void saveQuestion(Question question);
}
