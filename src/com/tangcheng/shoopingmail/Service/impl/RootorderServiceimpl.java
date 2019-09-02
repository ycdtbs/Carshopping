package com.tangcheng.shoopingmail.Service.impl;

import com.tangcheng.shoopingmail.Dao.OrderDao;
import com.tangcheng.shoopingmail.Dao.impl.OrderDaoimpl;
import com.tangcheng.shoopingmail.Service.RootcarService;
import com.tangcheng.shoopingmail.Service.RootorderService;

import java.util.List;
import java.util.Map;

public class RootorderServiceimpl  implements RootorderService {
    @Override
    public List<Map<String, Object>> rootshoworder() {
        OrderDao shoorder=new OrderDaoimpl();
        List<Map<String, Object>> showrootorder = shoorder.showrootorder();

        return showrootorder;
    }

    @Override
    public List<Map<String, Object>> rootshoworderbymohu(String orderid, String orderzhuangtai, String ordertime) {
        OrderDao rootshoworderbymohu=new OrderDaoimpl();
        List<Map<String, Object>> rootshoworderbymohu1 = rootshoworderbymohu.rootshoworderbymohu(orderid, orderzhuangtai, ordertime);
        return rootshoworderbymohu1;
    }

    @Override
    public List<Map<String, Object>> rootshoworderinf(String id) {
        OrderDao rootshoworderinf=new OrderDaoimpl();
        List<Map<String, Object>> showrootorderinf = rootshoworderinf.showrootorderinf(id);

        return showrootorderinf;
    }

    @Override
    public List<Map<String, Object>> paiming() {
        OrderDao paiming=new OrderDaoimpl();
        List<Map<String, Object>> paiming1 = paiming.paiming();
        return paiming1;
    }

    @Override
    public String getmoney() {
        OrderDao money=new OrderDaoimpl();
        String getmoney = money.getmoney();
        return getmoney;
    }
}
