package com.tangcheng.shoopingmail.Service;

import java.util.List;
import java.util.Map;

public interface RootuserService {
    public int loginselect(String username, String password);
    public String selectusername(String username, String password);
    public List<Map<String, Object>> showUser();
    public int deluser(String delid);
    public int update(String usernumber,String username,String usersex,String usertel,String userroly,String useraddress);
    public int adduser(String usernumber,String username,String usersex,String usertel,String userroly,String useraddress);
    public int usernamecheck(String username);
    public List<Map<String, Object>> selectbytiaojian(String usernumber,String username,String usersex,String usertel,String userroly,String useraddress);

}
