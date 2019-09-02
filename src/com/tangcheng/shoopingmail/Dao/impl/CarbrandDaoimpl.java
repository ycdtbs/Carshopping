package com.tangcheng.shoopingmail.Dao.impl;

import com.mysql.cj.xdevapi.DbDoc;
import com.tangcheng.shoopingmail.Dao.CarbrandDao;
import com.tangcheng.shoopingmail.Util.DBUtils;

import java.util.List;
import java.util.Map;

public class CarbrandDaoimpl implements CarbrandDao {
    @Override
    public List<Map<String, Object>> showCarbrand() {
        String sql="select * from Carbrand where flag=1";
        List<Map<String, Object>> query = DBUtils.query(sql);
        return query;
    }

    @Override
    public int delCarbrand(String id) {
        String sql="update carbrand set flag='2' WHERE Brandkey='"+id+"'";
        System.out.println("删除语句"+sql);
        int update = DBUtils.update(sql);
        return update;

    }

    @Override
    public int updatecarbrand(String carbrandkey, String carbrandname, String carbrandaddress) {
        String sql="update carbrand set Carbrand='"+carbrandname+"',Adress='"+carbrandaddress+"' WHERE Brandkey='"+carbrandkey+"' ";

        int update = DBUtils.update(sql);
        return update;
    }

    @Override
    public List<Map<String, Object>> checkCarbrandkey(String Carbrandkey) {
        String sql="select * from Carbrand where Brandkey='"+Carbrandkey+"'";
        List<Map<String, Object>> query = DBUtils.query(sql);
        return query;
    }

    @Override
    public int addCarbrand(String carbrandkey, String carbrandname, String carbrandaddress) {
        String sql="INSERT into carbrand(carbrand,Adress,Brandkey) VALUES('"+carbrandname+"','"+carbrandaddress+"','"+carbrandkey+"')";
        int update = DBUtils.update(sql);
        return update;
    }

    @Override
    public List<Map<String, Object>> showCarbrandbytiaojian(String carbrandkey, String carbrandname, String carbrandaddress) {
        String sql="select * from Carbrand where flag=1";
        if(carbrandkey!=null&&carbrandkey.length()>0){
            sql=sql+" and Brandkey LIKE '%"+carbrandkey+"%' ";
        }
        if(carbrandname!=null&&carbrandname.length()>0){
            sql=sql+" and Carbrand LIKE '%"+carbrandname+"%' ";
        }
        if(carbrandaddress!=null&&carbrandaddress.length()>0){
            sql=sql+" and Adress LIKE '%"+carbrandaddress+"%' ";
        }
        System.out.println(sql+"条件查询语句是");
        List<Map<String, Object>> query = DBUtils.query(sql);
        return query;
    }

    @Override
    public List<Map<String, Object>> showCaraddress() {
        String sql="select Adress,Brandkey from Carbrand where flag=1 group by Adress";
        List<Map<String, Object>> query = DBUtils.query(sql);
        return query;

    }

    @Override
    public List<Map<String, Object>> showCarbrandname() {
        String sql="select Carbrand,Brandkey from Carbrand where flag=1 group by Carbrand";
        List<Map<String, Object>> query = DBUtils.query(sql);
        return query;
    }
}
