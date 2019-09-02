package com.tangcheng.shoopingmail.Service;

import java.util.List;
import java.util.Map;

public interface RootcustomerService {
    public List<Map<String, Object>> customerlist();
    public int delbyid(String id);
    public int black(String id);
    public int removeblack(String id);
    public int repwd(String id);
    public List<Map<String, Object>> selectcustomerbytiaojian(String customername,String customeridcard,String customerrtel,String email);
    public List<Map<String, Object>> balckcustomerlist();
    public List<Map<String, Object>> selectclackcustomerbytiaojian(String customername,String customeridcard,String customerrtel,String email);

}
