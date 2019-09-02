package com.tangcheng.shoopingmail.Service;

import java.util.List;
import java.util.Map;

public interface RootorderService {
    public List<Map<String, Object>> rootshoworder();
    public List<Map<String, Object>> rootshoworderbymohu(String orderid,String orderzhuangtai,String ordertime);
    public List<Map<String, Object>> rootshoworderinf(String id);
    public List<Map<String, Object>> paiming();
    public String getmoney();

}
