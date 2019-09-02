package com.tangcheng.shoopingmail.Dao.impl;

import com.tangcheng.shoopingmail.Dao.CustomerDao;
import com.tangcheng.shoopingmail.Util.DBUtils;

import java.util.List;
import java.util.Map;


public class CustomerDaoimpl implements CustomerDao {


    @Override
    public List<Map<String, Object>> customerlist() {
        String sql="select * from  customer where flag=1";
        List<Map<String, Object>> query = DBUtils.query(sql);
        return query;
    }

    @Override
    public int delbyid(String id) {
        String sql="update customer set flag="+2+" where Customeridcardnumber='"+id+"'";
        int update = DBUtils.update(sql);
        return update;
    }

    @Override
    public int black(String id) {
        String sql="update customer set flag="+3+" where Customeridcardnumber='"+id+"'";
        int update = DBUtils.update(sql);
        return update;
    }

    @Override
    public int removeblack(String id) {
        String sql="update customer set flag="+1+" where Customeridcardnumber='"+id+"'";
        int update = DBUtils.update(sql);
        return update;

    }

    @Override
    public int repwd(String id) {
        String sql="update customer set Customerpassword='111111' where Customeridcardnumber='"+id+"' ";
        System.out.println(sql+"重置密码");
        int update = DBUtils.update(sql);
        return update;
    }

    @Override
    public List<Map<String, Object>> selectcustomerbytiaojian(String customername, String customeridcard, String customerrtel, String email) {
        String sql="select * from  customer where flag=1 ";
        if (customername != null && customername.length() > 0) {
            sql = sql + " and Customerrealname LIKE '%" + customername + "%'";
        }
        if (customeridcard != null && customeridcard.length() > 0) {
            sql = sql + " and Customeridcardnumber LIKE '%" + customeridcard + "%'";
        }
        if (customerrtel != null && customerrtel.length() > 0) {
            sql = sql + " and Customertel LIKE '%" + customerrtel + "%'";
        }
        if (email != null && email.length() > 0) {
            sql = sql + " and Customeremail LIKE '%" + email + "%'";
        }

        List<Map<String, Object>> query = DBUtils.query(sql);
        return query;
    }

    @Override
    public List<Map<String, Object>> balckcustomerlist() {
        String sql="select * from  customer where flag=3";
        List<Map<String, Object>> query = DBUtils.query(sql);
        return query;
    }

    @Override
    public List<Map<String, Object>> selectclackcustomerbytiaojian(String customername, String customeridcard, String customerrtel, String email) {
        String sql="select * from  customer where flag=3 ";
        if (customername != null && customername.length() > 0) {
            sql = sql + " and Customerrealname LIKE '%" + customername + "%'";
        }
        if (customeridcard != null && customeridcard.length() > 0) {
            sql = sql + " and Customeridcardnumber LIKE '%" + customeridcard + "%'";
        }
        if (customerrtel != null && customerrtel.length() > 0) {
            sql = sql + " and Customertel LIKE '%" + customerrtel + "%'";
        }
        if (email != null && email.length() > 0) {
            sql = sql + " and Customeremail LIKE '%" + email + "%'";
        }

        List<Map<String, Object>> query = DBUtils.query(sql);
        return query;

    }

    @Override
    public List<Map<String, Object>> customerlogin(String name, String password) {
        String sql="select * from customer where Customerpassword='"+password+"' And (Customeremail='"+name+"' or Customertel='"+name+"')";
        List<Map<String, Object>> query = DBUtils.query(sql);
        return query;
    }

    @Override
    public String realname(String id) {
        String realname=null;
        String sql="select Customerrealname from customer where Customeremail='"+id+"' or Customertel='"+id+"' ";
        List<Map<String, Object>> query = DBUtils.query(sql);
        for (Map<String, Object> realnamelist:query
             ) {
           realname= realnamelist.get("Customerrealname").toString();
        }
        return realname;
    }

    @Override
    public int customerinf(String realname, String password, String email, String telnumber, String idcard) {
        String sql="insert into customer(Customerrealname,Customerpassword,Customeridcardnumber,Customertel,Customeremail) VALUES('"+realname+"','"+password+"','"+email+"','"+telnumber+"','"+idcard+"')";
        int update = DBUtils.update(sql);
        return update;
    }

    @Override
    public String selectidcard(String id) {
        String sql="select  Customeridcardnumber from customer where Customeremail='"+id+"' or Customertel='"+id+"'";
        List<Map<String, Object>> query = DBUtils.query(sql);
        String idcar=null;
        for (Map<String, Object> idcardnumber: query
             ) {
            idcar=idcardnumber.get("Customeridcardnumber").toString();
        }
        return idcar;
    }
}
