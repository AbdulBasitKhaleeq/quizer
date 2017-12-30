/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.Question;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 *
 * @author a_bas
 */
@Repository("questionDao")
public class QuestionDaoImpl extends AbstractDao<Integer, Question> implements QuestionDao{

    public Question findById(int id) {
        Question question = getByKey(id);
		if(question!=null){
			Hibernate.initialize(question.getQuestion_title());
                        Hibernate.initialize(question.getQuestion_type());
                        Hibernate.initialize(question.getQuestion_marks());
		}
		return question;
    }

    public void deleteById(int id) {
                Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("id", id));
		Question question = (Question)crit.uniqueResult();
		delete(question);
        
    }

    public List<Question> findAllQuestion() {
            Criteria criteria = createEntityCriteria().addOrder(Order.asc("title"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
		List<Question> question = (List<Question>) criteria.list();
		return question;
    }

    public void saveQuestion(Question question) {
        persist(question);
    }
    
}
