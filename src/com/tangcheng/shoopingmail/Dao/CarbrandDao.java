package com.tangcheng.shoopingmail.Dao;

import java.util.List;
import java.util.Map;

public interface CarbrandDao {
    public List<Map<String, Object>> showCarbrand();
    public int delCarbrand(String id);
    public int updatecarbrand(String carbrandkey,String carbrandname,String carbrandaddress);
    public List<Map<String, Object>> checkCarbrandkey(String Carbrandkey);
    public int addCarbrand(String carbrandkey,String carbrandname,String carbrandaddress);
    public List<Map<String, Object>> showCarbrandbytiaojian(String carbrandkey, String carbrandname, String carbrandaddress);
    public List<Map<String, Object>> showCaraddress();
    public List<Map<String, Object>> showCarbrandname();
    }
