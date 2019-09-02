package com.tangcheng.shoopingmail.Dao;

import java.util.List;
import java.util.Map;

public interface CarDao {
    public List<Map<String, Object>> showCarinf();
    public int addcarpictyre(String carkey,String carpagepath);
    public int delcarinf(String carid);
    public int update(String carid,String carbrand,String carname,String caridcard);
    public List<Map<String, Object>> checkCarnamekey(String carname);
    public int addcar(String carid,String carbrand,String carname,String caridcard);
    public List<Map<String, Object>> showcardetailedinf(String cadid);
    public int updatemoneyandtext(String carid,String money,String cartext);
    public List<Map<String, Object>> showCarinfbytiaojian(String carnumber, String carbrandname, String carname, String caridcare, String carstatue) ;
    public List<Map<String, Object>> searchbyalltable(String search);
    public int backcar(String id);
    public int sendcar(String id);

    }
