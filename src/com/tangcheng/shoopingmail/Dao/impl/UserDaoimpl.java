package com.tangcheng.shoopingmail.Dao.impl;

import com.tangcheng.shoopingmail.Dao.UserDao;
import com.tangcheng.shoopingmail.Util.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class UserDaoimpl implements UserDao {
    @Override
    public List<Map<String, Object>> loginselectdao(String username,String password) {
        String sql="select * from user where Usernumber='"+username+"' and Password="+password+"";
        System.out.println(sql);
        List<Map<String, Object>> query = DBUtils.query(sql);

        return query;
    }

    @Override
    public List<Map<String, Object>> showUser() {
        String sql="select * from user where flag=1 and UserRoly !=1";
        List<Map<String, Object>> userlist = DBUtils.query(sql);
        return userlist;
    }

    @Override
    public int deluser(String deiid) {
        String sql="update `user` set flag='2' WHERE Usernumber='"+deiid+"'";
        int update = DBUtils.update(sql);
        return update;
    }

    @Override
    public int update(String usernumber, String username, String usersex, String usertel, String userroly, String useraddress) {
        String sql="update user set Username='"+username+"' ,Usersex='"+usersex+"',Usertel='"+usertel+"',UserRoly='"+userroly+"', Useraddress='"+useraddress+"' WHERE Usernumber='"+usernumber+"'";
        System.out.println(sql+"修改语句为");
        int update = DBUtils.update(sql);
        return update;
    }

    @Override
    public int adduser(String usernumber, String username, String usersex, String usertel, String userroly, String useraddress) {
        String sql="INSERT INTO user(Usernumber,Username,Usersex,Usertel,Useraddress,UserRoly) VALUES('"+usernumber+"','"+username+"','"+usersex+"','"+usertel+"','"+useraddress+"','"+userroly+"')";
        int update = DBUtils.update(sql);
        return update;
    }



    @Override
    public List<Map<String, Object>> usernamecheck(String username) {
        String sql="select * from user where Usernumber='"+username+"'";
        //System.out.println(sql);
        List<Map<String, Object>> query = DBUtils.query(sql);

        return query;
    }

    @Override
    public List<Map<String, Object>> selectbytiaojian(String usernumber, String username, String usersex, String usertel, String userroly, String useraddress) {

        String sql="select * from user where flag=1 and UserRoly>1";
        if(usernumber!=null&&usernumber.length()>0){
            sql=sql+" and Usernumber LIKE '%"+usernumber+"%' ";
        }
        if(username!=null&&username.length()>0){
            sql=sql+" and Username LIKE '%"+username+"%' ";
        }
        if(usersex!=null&&usersex.length()>0){
            sql=sql+" and Usersex LIKE '%"+usersex+"%' ";
        }
        if(usertel!=null&&usertel.length()>0){
            sql=sql+" and Usertel LIKE '%"+usertel+"%' ";
        }
        if(useraddress!=null&&useraddress.length()>0){
            sql=sql+" and Useraddress LIKE '%"+useraddress+"%' ";
        }
        if(userroly!=null&&userroly.length()>0){
            sql=sql+" and UserRoly LIKE '%"+userroly+"%' ";
        }
        System.out.println("查询的语句是"+sql);
        List<Map<String, Object>> query = DBUtils.query(sql);

        return query;
    }
}
