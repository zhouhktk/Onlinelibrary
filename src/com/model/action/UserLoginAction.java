package com.model.action;

import com.entity.User;
import com.model.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @Author:zhoufeng
 * @Date:2019/12/16
 */
@Controller//注解为控制器(Action)
@Scope("prototype")//注解作用范围
public class UserLoginAction extends ActionSupport {
    @Resource
    private UserService userService;
    private User user;

    public String login() {
        //登陆前清空所有Session
        Map<String, Object> session = ActionContext.getContext().getSession();
        session.clear();
        session.put("user", userService.getOneUserByName(user.getUsername()));
        return "success";
    }

    public String logout(){
        //退出清空所有Session
        Map<String, Object> session = ActionContext.getContext().getSession();
        session.clear();
        return "success";
    }

//    @Override
    public void validateLogin() {
        if (!"ok".equals(userService.loginCheck(user))) {
            if ("notExistName".equals(userService.loginCheck(user))) {
                addFieldError("name", "用户名不存在");
            }
            else if ("passError".equals(userService.loginCheck(user))) {
                addFieldError("pass", "密码错误");
            }
        }
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
