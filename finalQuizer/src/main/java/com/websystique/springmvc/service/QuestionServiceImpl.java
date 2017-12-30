/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.service;

import com.websystique.springmvc.dao.QuestionDao;
import com.websystique.springmvc.model.Question;
import com.websystique.springmvc.model.Quiz;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author a_bas
 */

@Service("questionService")
@Transactional
public class QuestionServiceImpl implements QuestionService{
    
    @Autowired
    QuestionDao dao;

    public Question findById(int id) {
    return dao.findById(id);
    }

    public void deleteById(int id) {
     dao.deleteById(id);
    }

    public List<Question> findAllQuestions() {
        return dao.findAllQuestion();
    }

    public void saveQuestion(Question question) {
        dao.saveQuestion(question);
    }

    public void updateQuestion(Question question) {
        Question entity = dao.findById(question.getId());
		if(entity!=null){
                        entity.setQuestion_title(question.getQuestion_title());
                        entity.setAnswer(question.getAnswer());
                        entity.setQuestion_marks(question.getQuestion_marks());
                        entity.setQuestion_type(question.getQuestion_type());
                        entity.setOpt1(question.getOpt1());
                        entity.setOpt2(question.getOpt2());
                        entity.setOpt3(question.getOpt3());
                        entity.setOpt4(question.getOpt4());
               }
    }

}
