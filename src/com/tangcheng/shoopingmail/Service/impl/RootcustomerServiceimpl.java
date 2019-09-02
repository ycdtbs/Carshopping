package com.tangcheng.shoopingmail.Service.impl;

import com.tangcheng.shoopingmail.Dao.CarDao;
import com.tangcheng.shoopingmail.Dao.CustomerDao;
import com.tangcheng.shoopingmail.Dao.impl.CarDaoimpl;
import com.tangcheng.shoopingmail.Dao.impl.CustomerDaoimpl;
import com.tangcheng.shoopingmail.Service.RootcustomerService;

import java.util.List;
import java.util.Map;

public class RootcustomerServiceimpl implements RootcustomerService {

    @Override
    public List<Map<String, Object>> customerlist() {
        CustomerDao customerlist=new CustomerDaoimpl();
        List<Map<String, Object>> customerlist1 = customerlist.customerlist();

        return customerlist1;
    }

    @Override
    public int delbyid(String id) {
        int size=id.length();
        String newid = id.substring(8, size);
        CustomerDao delbyid=new CustomerDaoimpl();
        int delresult = delbyid.delbyid(newid);
        return delresult;
    }

    @Override
    public int black(String id) {
        int size=id.length();
        String newid = id.substring(8, size);
        CustomerDao delbyid=new CustomerDaoimpl();
        int delresult = delbyid.black(newid);
        return delresult;
    }

    @Override
    public int removeblack(String id) {
        int size=id.length();
        String newid = id.substring(8, size);
        CustomerDao delbyid=new CustomerDaoimpl();
        int delresult = delbyid.removeblack(newid);
        return delresult;

    }

    @Override
    public int repwd(String id) {
        int size=id.length();
        String newid = id.substring(8, size);
        CustomerDao delbyid=new CustomerDaoimpl();
        int delresult = delbyid.repwd(newid);
        return delresult;
    }

    @Override
    public List<Map<String, Object>> selectcustomerbytiaojian(String customername, String customeridcard, String customerrtel, String email) {
        CustomerDao selectcustomerbytiaojian=new CustomerDaoimpl();
        List<Map<String, Object>> selectresult = selectcustomerbytiaojian.selectcustomerbytiaojian(customername, customeridcard, customerrtel, email);

        return selectresult;
    }

    @Override
    public List<Map<String, Object>> balckcustomerlist() {
        CustomerDao balckcustomerlist=new CustomerDaoimpl();
        List<Map<String, Object>> balckcustomerlist1 = balckcustomerlist.balckcustomerlist();
        return balckcustomerlist1;
    }

    @Override
    public List<Map<String, Object>> selectclackcustomerbytiaojian(String customername, String customeridcard, String customerrtel, String email) {
        CustomerDao selectclackcustomerbytiaojian=new CustomerDaoimpl();
        List<Map<String, Object>> selectclackcustomerbytiaojian1 = selectclackcustomerbytiaojian.selectclackcustomerbytiaojian(customername, customeridcard, customerrtel, customeridcard);
        return selectclackcustomerbytiaojian1;
    }
}
