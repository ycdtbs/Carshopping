package com.tangcheng.shoopingmail.Dao;

import java.util.List;
import java.util.Map;

public interface UserDao {
    public List<Map<String, Object>> loginselectdao(String username, String password);
    public List<Map<String, Object>> showUser();
    public int deluser(String deiid);
    public int update(String usernumber,String username,String usersex,String usertel,String userroly,String useraddress);
    public int adduser(String usernumber,String username,String usersex,String usertel,String userroly,String useraddress);
    public List<Map<String, Object>> usernamecheck(String username);
    public List<Map<String, Object>> selectbytiaojian(String usernumber, String username, String usersex, String usertel, String userroly, String useraddress) ;




    }
