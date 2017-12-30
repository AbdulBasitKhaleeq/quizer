/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.service;

import com.websystique.springmvc.dao.QuizDao;
import com.websystique.springmvc.dao.UserDao;
import com.websystique.springmvc.model.Quiz;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author a_bas
 */
@Service("quizService")
@Transactional
public class QuizServiceImpl implements QuizService{

    
    @Autowired
    private QuizDao dao;
    
    public Quiz findById(int id) {
    return dao.findById(id);
    }

    public void deleteById(int id) {
       dao.deleteById(id);
    }

    public List<Quiz> findAllQuiz() {
       return dao.findAllQuiz();
    }

    public void saveQuiz(Quiz quiz) {

        dao.saveQuiz(quiz);
    }

    public void updateQuiz(Quiz quiz) {
        Quiz entity = dao.findById(quiz.getId());
		if(entity!=null){
                        entity.setTitle(quiz.getTitle());
                        entity.setDescription(quiz.getDescription());
                        
               }
    }

    public List<Quiz> findAllQuizByUserId(int user_id) {
      return dao.findAllQuizByUserId(user_id);
    }
    
    
    
}
