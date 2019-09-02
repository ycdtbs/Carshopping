package com.tangcheng.shoopingmail.Service.impl;

import com.tangcheng.shoopingmail.Dao.UserDao;
import com.tangcheng.shoopingmail.Dao.impl.UserDaoimpl;
import com.tangcheng.shoopingmail.Service.RootuserService;
import com.tangcheng.shoopingmail.Util.DBUtils;

import java.util.List;
import java.util.Map;

public class RootuserServiceimpl implements RootuserService {
    @Override
    public int loginselect(String username, String password) {
        UserDao loginselect= new UserDaoimpl();
        List<Map<String, Object>> loginselectdao = loginselect.loginselectdao(username, password);
        if(loginselectdao.isEmpty()){
            return 0;
        }
        return 1;
    }

    @Override
    public String selectusername(String username, String password) {
        UserDao loginselect= new UserDaoimpl();
        String realname=null;
        List<Map<String, Object>> loginselectdao = loginselect.loginselectdao(username, password);
        for (Map<String, Object> userrealname:loginselectdao
             ) {
            realname = userrealname.get("Username").toString();
        }
        return realname;
    }

    @Override
    public List<Map<String, Object>> showUser() {
        UserDao showuser=new UserDaoimpl();
        List<Map<String, Object>> userlist = showuser.showUser();
        return userlist;
    }

    @Override
    public int deluser(String delid) {
        UserDao deluser=new UserDaoimpl();
        int deluser1 = deluser.deluser(delid);
        return deluser1;
    }

    @Override
    public int update(String usernumber, String username, String usersex, String usertel, String userroly, String useraddress) {
        if(userroly.equals("销售")){
            userroly="2";
        }
        if(userroly.equals("主管")){
            userroly="3";
        }
        UserDao update=new UserDaoimpl();
        int updateresult = update.update(usernumber, username, usersex, usertel, userroly, useraddress);

        return updateresult;
    }

    @Override
    public int adduser(String usernumber, String username, String usersex, String usertel, String userroly, String useraddress) {
        UserDao adduser=new UserDaoimpl();
        int adduser1 = adduser.adduser(usernumber, username, usersex, usertel, userroly, useraddress);
        return adduser1;
    }

    @Override
    public int usernamecheck(String username) {
        UserDao checkusername=new UserDaoimpl();
        List<Map<String, Object>> usernamecheck = checkusername.usernamecheck(username);
        if(usernamecheck.isEmpty()){
            return 0;
        }
        return 1;
    }

    @Override
    public List<Map<String, Object>> selectbytiaojian(String usernumber, String username, String usersex, String usertel, String userroly, String useraddress) {
        UserDao select=new UserDaoimpl();
        List<Map<String, Object>> selectbytiaojian = select.selectbytiaojian(usernumber, username, usersex, usertel, userroly, useraddress);
        return selectbytiaojian;
    }
}
