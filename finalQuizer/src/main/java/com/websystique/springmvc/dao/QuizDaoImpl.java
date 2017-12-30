/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.Quiz;
import com.websystique.springmvc.model.User;
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
@Repository("quizDao")
public class QuizDaoImpl extends AbstractDao<Integer, Quiz> implements QuizDao {

    public Quiz findById(int id) {
    Quiz quiz = getByKey(id);
    return quiz;    
    }

    public void deleteById(int id) {
        Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("id", id));
		Quiz quiz = (Quiz)crit.uniqueResult();
		delete(quiz);

    }

    public List<Quiz> findAllQuiz() {
                
                Criteria criteria = createEntityCriteria().addOrder(Order.asc("title"));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
		List<Quiz> quizzes = (List<Quiz>) criteria.list();
		
		// No need to fetch userProfiles since we are not showing them on list page. Let them lazy load. 
		// Uncomment below lines for eagerly fetching of userProfiles if you want.
		/*
		for(User user : users){
			Hibernate.initialize(user.getUserProfiles());
		}*/
		return quizzes;    
    }

    public void saveQuiz(Quiz quiz) {
    
        persist(quiz);
    
    }

    public List<Quiz> findAllQuizByUserId(int user_id) {
        Criteria crit = createEntityCriteria().addOrder(Order.asc("title"));
        crit.add(Restrictions.eq("user_id", user_id));
        crit.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//To avoid duplicates.
	List<Quiz> quizzes = (List<Quiz>) crit.list();
        return quizzes;
    }

    
}
