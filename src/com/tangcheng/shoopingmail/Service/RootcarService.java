package com.tangcheng.shoopingmail.Service;

import javax.servlet.http.Part;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface RootcarService {
    public List<Map<String, Object>> showCarbrand();//展示车品牌
    public int delCarbrand(String id);//删除车辆品牌
    public int updatecarbrand(String carbrandkey,String carbrandname,String carbrandaddress);//修改车辆品牌信息
    public int checkCarbrandkey(String Carbrandkey);//检查重名
    public int addCarbrand(String carbrandkey,String carbrandname,String carbrandaddress);//添加品牌
    public List<Map<String, Object>> showCarbrandbytiaojian(String carbrandkey,String carbrandname,String carbrandaddress);//条件查询
    public List<Map<String, Object>> showCarinf();//展示车辆信息
    public String inputCarpage(Part part,String carpagename,String realpath) throws IOException;//上传车辆照片
    public int delcarinf(String carid);
    public int update(String carid,String carbrand,String carname,String caridcard);
    public int checkCarnamekey(String carname);
    public int addcar(String carid,String carbrand,String carname,String caridcard);
    public List<Map<String, Object>> showcardetailedinf(String carid);
    public int updatemoneyandtext(String carid,String money,String cartext);
    public List<Map<String, Object>> showCarinfbytiaojian(String carnumber,String carbrandname,String carname,String caridcare,String carstatue);
    public List<Map<String, Object>> showCaraddress();//展示车产地
    public List<Map<String, Object>> showCarname();//展示车品牌
    public int backcar(String id);//顾客还车
    public int sendcar(String id);//顾客借车
}
