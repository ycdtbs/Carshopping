package com.tangcheng.shoopingmail.Service.impl;

import com.tangcheng.shoopingmail.Dao.CarDao;
import com.tangcheng.shoopingmail.Dao.CustomerDao;
import com.tangcheng.shoopingmail.Dao.OrderDao;
import com.tangcheng.shoopingmail.Dao.impl.CarDaoimpl;
import com.tangcheng.shoopingmail.Dao.impl.CustomerDaoimpl;
import com.tangcheng.shoopingmail.Dao.impl.OrderDaoimpl;
import com.tangcheng.shoopingmail.Service.CustomerShoping;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

public class CustomerShopingimpl implements CustomerShoping {
    @Override
    public List<Map<String, Object>> searchbyalltable(String search) {
        CarDao searchbyalltable=new CarDaoimpl();
        List<Map<String, Object>> searchbyalltable1 = searchbyalltable.searchbyalltable(search);

        return searchbyalltable1;
    }

    @Override
    public int customerlogin(String name, String password) {
        CustomerDao login=new CustomerDaoimpl();
        List<Map<String, Object>> customerlogin = login.customerlogin(name, password);
        if(customerlogin.isEmpty()){
            return 0;
        }
        return 1;
    }

    @Override
    public String realname(String id) {
        CustomerDao realname=new CustomerDaoimpl();
        String realname1 = realname.realname(id);
        return realname1;
    }

    @Override
    public int customerinf(String realname, String password, String email, String telnumber, String idcard) {
        CustomerDao addcustomer=new CustomerDaoimpl();
        int customerinf = addcustomer.customerinf(realname, password, email, telnumber, idcard);
        return customerinf;
    }

    @Override
    public String addorder(String carid, String customerid, String starttime, String yajin, String money) {
        int random=(int)((Math.random()*9+1)*100000);
        long time = new Date().getTime();
        String orderid=String.valueOf(time+random);
        System.out.println(orderid);
        System.out.println("我进入了添加订单的order");
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date=sdf.format(d);
        OrderDao addorder=new OrderDaoimpl();
        int addorder1 = addorder.addorder(orderid, date, carid, customerid, starttime, yajin, money);
        if(addorder1>0){
            return  orderid;
        }
        return "0";
    }

    @Override
    public List<Map<String, Object>> showorderbycustomername(String customerid) {
        OrderDao showorderbycustomername=new OrderDaoimpl();
        List<Map<String, Object>> showpersonorder = showorderbycustomername.showpersonorder(customerid);
        return showpersonorder;
    }

    @Override
    public String selectidcard(String id) {
        CustomerDao showidcard=new CustomerDaoimpl();
        String selectidcard = showidcard.selectidcard(id);
        return selectidcard;
    }

    @Override
    public int backcar(String orderid,String money) {
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String date=sdf.format(d);
        OrderDao backcar=new OrderDaoimpl();
        int backcar1 = backcar.backcar(orderid, date,money);

        return backcar1;
    }
}
