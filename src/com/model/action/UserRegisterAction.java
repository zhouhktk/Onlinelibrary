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
public class UserRegisterAction extends ActionSupport {
    @Resource
    private UserService userService;
    private User user;
    private String checkpass;

    public String register(){
        Map<String, Object> session = ActionContext.getContext().getSession();
        session.clear();
        session.put("user", userService.getOneUserByName(user.getUsername()));
        return "success";
    }

    @Override
    public void validate() {
        if (!user.getPassword().equals(checkpass)){
            addFieldError("checkpass", "两次输入密码不一致");
        }else {
            String isReg = userService.userRegister(user);
            if (!"success".equals(isReg)) {
                if ("nameExist".equals(isReg)) {
                    addFieldError("name", "该用户名已存在");
                }
            }
        }
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getCheckpass() {
        return checkpass;
    }

    public void setCheckpass(String checkpass) {
        this.checkpass = checkpass;
    }
}
