package com.model.service;

import com.entity.User;
import com.model.dao.UserDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Author:zhoufeng
 * @Date:2019/12/16
 */
@Service
public class UserService {
    @Resource //注入dao
    private UserDao userDao;

    public String userRegister(User user){
        if (userDao.getOneUserByName(user.getUsername())!=null){
            return "nameExist";
        }else {
            userDao.saveUser(user);
            return "success";
        }
    }

    public String loginCheck(User user){
        User user1 = userDao.getOneUserByName(user.getUsername());
        if (user1!=null){
            if (user.getPassword().equals(user1.getPassword())){
                return "ok";
            }else {
                return "passError";
            }
        }else {
            return "notExistName";
        }
    }
    public User getOneUserById(int id){
        return userDao.getOneUserById(id);
    }

    public User getOneUserByName(String name){
        return userDao.getOneUserByName(name);
    }
}
