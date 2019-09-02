package com.tangcheng.shoopingmail.Dao.impl;

import com.tangcheng.shoopingmail.Dao.CarDao;
import com.tangcheng.shoopingmail.Util.DBUtils;

import java.util.List;
import java.util.Map;

public class CarDaoimpl implements CarDao {
    @Override
    public List<Map<String, Object>> showCarinf() {
        String sql = "SELECT car.Carnumber as Carnumber,\n" +
                "car.Carname as Carname ,\n" +
                "car.Caridcard as Caridcard,\n" +
                "carbrand.Carbrand as Carbrand,\n" +
                "car.Carpage as Carpage,\n" +
                "car.Carstatue as Carstatue\n" +
                "FROM car join carbrand on car.Carbrand=Carbrand.id  where car.flag='1'";
        System.out.println(sql);
        List<Map<String, Object>> query = DBUtils.query(sql);

        return query;
    }

    @Override
    public int addcarpictyre(String carkey, String carpagepath) {
        carpagepath = carpagepath.replaceAll("\\\\", "\\\\\\\\");
        String sql = "UPDATE car set Carpage='" + carpagepath + "' where Carnumber='" + carkey + "' ";
        int update = DBUtils.update(sql);
        return update;
    }

    @Override
    public int delcarinf(String carid) {
        String sql = "update car  set flag=2 where Carnumber='" + carid + "' ";
        int update = DBUtils.update(sql);
        return update;
    }

    @Override
    public int update(String carid, String carbrand, String carname, String caridcard) {
        String sql1 = "select id from Carbrand where Carbrand='" + carbrand + "'";
        List<Map<String, Object>> query = DBUtils.query(sql1);
        String brandid = null;
        for (Map<String, Object> id : query
        ) {
            brandid = id.get("id").toString();
        }
        if (brandid != null) {
            System.out.println("查到的品牌为" + brandid);
            String sql = "update  car set Carbrand='" + brandid + "',Carname='" + carname + "',Caridcard='" + caridcard + "' where Carnumber='" + carid + "' ";
            int update = DBUtils.update(sql);
            System.out.println("修改语句是" + sql);
        }

        return 3;
    }

    @Override
    public List<Map<String, Object>> checkCarnamekey(String carname) {
        String sql = "select * from car where Carnumber='" + carname + "'";
        System.out.println(sql + "检查重名语句");
        List<Map<String, Object>> query = DBUtils.query(sql);

        return query;
    }

    @Override
    public int addcar(String carid, String carbrand, String carname, String caridcard) {
        String sql1 = "select id from Carbrand where Carbrand='" + carbrand + "'";
        List<Map<String, Object>> query = DBUtils.query(sql1);
        String brandid = null;
        for (Map<String, Object> id : query
        ) {
            brandid = id.get("id").toString();
        }
        if (brandid != null) {
            String sql = " insert into car(Carnumber,Carname,Caridcard,Carbrand,CarIntroduction) values('" + carid + "','" + carname + "','" + caridcard + "','" + brandid + "','color=  **zaikerenshu=  **baigongliyouhao=  **pailiang=  **baoxian=  ')";
            System.out.println("插入语句" + sql);
            int update = DBUtils.update(sql);
            return update;
        }
        return 3;
    }

    @Override
    public List<Map<String, Object>> showcardetailedinf(String carid) {
        String sql = "SELECT\n" +
                "\tcar.Carnumber AS Carnumber,\n" +
                "\tcar.Carname AS Carname,\n" +
                " car.Caridcard AS Caridcard,\n" +
                "\tcarbrand.Carbrand AS Carbrand,\n" +
                "\tcar.Carpage AS Carpage,\n" +
                "\tcar.Carstatue AS Carstatue,\n" +
                "\tcar.CarIntroduction As Carinf,\n" +
                "\tcar.Carsendmoney As money\n" +
                "FROM\n" +
                "\tcar\n" +
                "JOIN carbrand ON car.Carbrand = Carbrand.id\n" +
                "WHERE\n" +
                "\tcar.Carnumber='" + carid + "'";
        List<Map<String, Object>> query = DBUtils.query(sql);
        return query;
    }

    @Override
    public int updatemoneyandtext(String carid, String money, String cartext) {
        String sql = "update car set Carsendmoney='" + money + "',CarIntroduction='" + cartext + "' where Carnumber='" + carid + "'";
        System.out.println("修改语句是"+sql);
        int update = DBUtils.update(sql);

        return update;
    }

    @Override
    public List<Map<String, Object>> showCarinfbytiaojian(String carnumber, String carbrandname, String carname, String caridcare, String carstatue) {
        String sql = "SELECT car.Carnumber AS Carnumber,car.Carname AS Carname,car.Caridcard AS Caridcard,carbrand.Carbrand AS Carbrand,car.Carpage AS Carpage,car.Carstatue AS Carstatue FROM car JOIN carbrand ON car.Carbrand = Carbrand.id WHERE car.flag = '1'  ";
        if (carnumber != null && carnumber.length() > 0) {
            sql = sql + " and Carnumber LIKE '%" + carnumber + "%'";
        }
        if (carbrandname != null && carbrandname.length() > 0) {
            sql = sql + " and Carbrand LIKE '%" + carbrandname + "%'";
        }
        if (carname != null && carname.length() > 0) {
            sql = sql + " and Carname LIKE '%" + carname + "%'";
        }
        if (caridcare != null && caridcare.length() > 0) {
            sql = sql + " and Caridcard LIKE '%" + caridcare + "%'";
        }
        if (carstatue != null && carstatue.length() > 0) {
            sql = sql + " and Carstatue LIKE '%" + carstatue + "%'";
        }
        System.out.println("条件查询语句是"+sql);
        List<Map<String, Object>> query = DBUtils.query(sql);
        return query;
    }

    @Override
    public List<Map<String, Object>> searchbyalltable(String search) {
        String sql="SELECT\n" +
                "\tcar.Carnumber AS Carnumber,\n" +
                "\tcar.Carname AS Carname,\n" +
                "\tcar.Caridcard AS Caridcard,\n" +
                "\tcarbrand.Carbrand AS Carbrand,\n" +
                "\tcar.Carpage AS Carpage,\n" +
                "\tcar.Carstatue AS Carstatue,\n" +
                "\tcarbrand.Adress AS Address,\n" +
                "\tcarbrand.Brandkey AS Brandkey,\n" +
                "\tcar.CarIntroduction AS Beizhu,\n" +
                "\tcar.Carsendmoney\n" +
                "FROM\n" +
                "\tcar\n" +
                "JOIN carbrand ON car.Carbrand = Carbrand.id\n" +
                "WHERE\n" +
                "\tcar.flag = '1' AND (Carnumber like '%"+search+"%' or Carname like '%"+search+"%' or Caridcard  like '%"+search+"%' or Carbrand.Carbrand like '%"+search+"%' or Carbrand.Adress  like '%"+search+"%'  or Brandkey  like '%"+search+"%'  or car.CarIntroduction like '%"+search+"%')";
        System.out.println("全表格查询语句"+sql);
        List<Map<String, Object>> query = DBUtils.query(sql);
        return query;
    }

    @Override
    public int backcar(String id) {
        String sql="update car set Carstatue='1' where Caridcard= '"+id+"'";
        int update = DBUtils.update(sql);
        return update;
    }

    @Override
    public int sendcar(String id) {
        String sql="update car set Carstatue='2' where Carnumber= '"+id+"'";
        int update = DBUtils.update(sql);
        return update;
    }


}
