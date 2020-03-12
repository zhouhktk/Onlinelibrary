package com.model.dao;

import com.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author:zhoufeng
 * @Date:2019/12/16
 */
@Repository
public class UserDao {
    @Resource //注入会话工厂
    private SessionFactory sf;

    /**
     * 保存用户信息
     * @param user
     */
    public void saveUser(User user){
        Session session = sf.openSession();
        Transaction transaction = session.beginTransaction();
        user.setAdmin(0);
        session.save(user);
        transaction.commit();
        session.close();
    }

    public User getOneUserById(int id){
        Session session = sf.openSession();
        User user = session.get(User.class, id);
        session.close();
        if (user!=null){
            return user;
        }else {
            return null;
        }
    }

    public User getOneUserByName(String name){
        Session session = sf.openSession();
        Query query = session.createQuery("from User where username=?1");
        query.setParameter(1, name);
        List<User> users = query.list();
        session.close();
        if (users.size()!=0){
            return users.get(0);
        }else {
            return null;
        }
    }

}
