package com.tangcheng.shoopingmail.Service;

import java.util.List;
import java.util.Map;

public interface CustomerShoping {
    public List<Map<String, Object>> searchbyalltable(String search);
    public int customerlogin(String name,String password);
    public String realname(String id);
    public int customerinf(String realname,String password,String email,String telnumber,String idcard );
    public String addorder(String carid,String customerid,String starttime,String yajin,String money);
    public List<Map<String, Object>> showorderbycustomername(String customerid);
    public String selectidcard(String id);
    public int backcar(String orderid,String money);
}
