package com.tangcheng.shoopingmail.Service.impl;

import com.tangcheng.shoopingmail.Dao.CarDao;
import com.tangcheng.shoopingmail.Dao.CarbrandDao;
import com.tangcheng.shoopingmail.Dao.impl.CarDaoimpl;
import com.tangcheng.shoopingmail.Dao.impl.CarbrandDaoimpl;
import com.tangcheng.shoopingmail.Service.RootcarService;
import com.tangcheng.shoopingmail.Util.DBUtils;

import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

public class RootcarServiceimpl implements RootcarService {
    @Override
    public List<Map<String, Object>> showCarbrand() {
        CarbrandDao showCarband=new CarbrandDaoimpl();
        List<Map<String, Object>> maps = showCarband.showCarbrand();
        return maps;
    }

    @Override
    public int delCarbrand(String id) {
        CarbrandDao delCarbrand=new CarbrandDaoimpl();
        int i = delCarbrand.delCarbrand(id);
        return i;
    }

    @Override
    public int updatecarbrand(String carbrandkey, String carbrandname, String carbrandaddress) {
        CarbrandDao updatecarbrand=new CarbrandDaoimpl();
        int updatecarbrandresult = updatecarbrand.updatecarbrand(carbrandkey, carbrandname, carbrandaddress);
        return updatecarbrandresult;
    }

    @Override
    public int checkCarbrandkey(String Carbrandkey) {
        CarbrandDao checkcarbrand=new CarbrandDaoimpl();
        List<Map<String, Object>> maps = checkcarbrand.checkCarbrandkey(Carbrandkey);
        if (maps.isEmpty()){
            return 0;
        }
        return 1;
    }

    @Override
    public int addCarbrand(String carbrandkey, String carbrandname, String carbrandaddress) {
        CarbrandDao addcarbrand=new CarbrandDaoimpl();
        int i = addcarbrand.addCarbrand(carbrandkey, carbrandname, carbrandaddress);
        return i;
    }

    @Override
    public List<Map<String, Object>> showCarbrandbytiaojian(String carbrandkey, String carbrandname, String carbrandaddress) {
        CarbrandDao showcarbrand=new CarbrandDaoimpl();
        List<Map<String, Object>> maps = showcarbrand.showCarbrandbytiaojian(carbrandkey, carbrandname, carbrandaddress);
        return maps;
    }

    @Override
    public List<Map<String, Object>> showCarinf() {
        CarDao showcarinf=new CarDaoimpl();
        List<Map<String, Object>> maps = showcarinf.showCarinf();
        return maps;
    }

    @Override
    public String inputCarpage(Part part,String carpagename,String realpath) throws IOException {
        String name = part.getSubmittedFileName();//得到上传的文件名
        System.out.println(name+"输入的文件名为");
        String substring = name.substring(name.lastIndexOf(".") );//取出文件后缀名
        String newname=carpagename+substring;//得到新的文件名
        System.out.println("新的文件名为"+newname);
        String location = realpath + newname;//新的文件要存放的地址
        System.out.println(location);
        CarDao addcarpage=new CarDaoimpl();
        int addcarpictyre = addcarpage.addcarpictyre(carpagename, newname);
        InputStream inputStream = part.getInputStream();

        File file = new File(location);
        FileOutputStream outputStream = new FileOutputStream(file);
        byte b []=new byte[2048];
        int size=0;
        while ((size=inputStream.read(b))>-1){
            outputStream.write(b,0,size);
        }
        outputStream.flush();
        outputStream.close();
        inputStream.close();


        return newname;
    }

    @Override
    public int delcarinf(String carid) {
        CarDao del=new CarDaoimpl();
        int delcarinf = del.delcarinf(carid);
        return delcarinf;
    }

    @Override
    public int update(String carid, String carbrand, String carname, String caridcard) {
        CarDao updatecarinf=new CarDaoimpl();
        int update = updatecarinf.update(carid, carbrand, carname, caridcard);
        return update;
    }

    @Override
    public int checkCarnamekey(String carname) {
        CarDao checkcarname=new CarDaoimpl();
        List<Map<String, Object>> maps = checkcarname.checkCarnamekey(carname);
        if(maps.isEmpty()){
            return 0;
        }
        return 1;
    }

    @Override
    public int addcar(String carid, String carbrand, String carname, String caridcard) {
        CarDao addcar=new CarDaoimpl();
        int addcar1 = addcar.addcar(carid, carbrand, carname, caridcard);
        return addcar1;
    }

    @Override
    public List<Map<String, Object>> showcardetailedinf(String id) {
        CarDao showcarinf=new CarDaoimpl();
        List<Map<String, Object>> showcardetailedinf = showcarinf.showcardetailedinf(id);
        return showcardetailedinf;
    }

    @Override
    public int updatemoneyandtext(String carid, String money, String cartext) {
        CarDao updatemoneyandtext=new CarDaoimpl();
        int updatemoneyandtext1 = updatemoneyandtext.updatemoneyandtext(carid, money, cartext);
        return updatemoneyandtext1;
    }

    @Override
    public List<Map<String, Object>> showCarinfbytiaojian(String carnumber, String carbrandname, String carname, String caridcare, String carstatue) {
        CarDao showcarinfbytiaojian=new CarDaoimpl();
        List<Map<String, Object>> maps = showcarinfbytiaojian.showCarinfbytiaojian(carnumber, carbrandname, carname, caridcare, carstatue);
        return maps;
    }

    @Override
    public List<Map<String, Object>> showCaraddress() {
        CarbrandDao showCaraddress=new CarbrandDaoimpl();
        List<Map<String, Object>> maps = showCaraddress.showCaraddress();
        return maps;
    }

    @Override
    public List<Map<String, Object>> showCarname() {
        CarbrandDao showCaraddress=new CarbrandDaoimpl();
        List<Map<String, Object>> maps = showCaraddress.showCarbrandname();
        return maps;
    }

    @Override
    public int backcar(String id) {
    CarDao backcar=new CarDaoimpl();
        int backcar1 = backcar.backcar(id);
        return backcar1;
    }

    @Override
    public int sendcar(String id) {
        CarDao sendcar=new CarDaoimpl();
        int sendcar1 = sendcar.sendcar(id);
        return sendcar1;
    }

}

