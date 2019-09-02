package com.tangcheng.shoopingmail.Dao;

import java.util.List;
import java.util.Map;

public interface OrderDao {
    public int addorder(String Ordernumber,String cretedate, String carid, String customerid, String starttime,  String yajin, String money);
    public List<Map<String, Object>>  showpersonorder(String id);
    public int backcar(String id,String time,String money);
    public List<Map<String, Object>> showrootorder();
    public List<Map<String, Object>> rootshoworderbymohu(String orderid,String orderzhuangtai,String ordertime);
    public List<Map<String, Object>> showrootorderinf(String id);
    public List<Map<String, Object>> paiming();
    public String getmoney();
}


