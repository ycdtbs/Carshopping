package com.tangcheng.shoopingmail.Dao.impl;

import com.tangcheng.shoopingmail.Dao.OrderDao;
import com.tangcheng.shoopingmail.Util.DBUtils;

import java.util.List;
import java.util.Map;

public class OrderDaoimpl implements OrderDao {


    @Override
    public int addorder(String Ordernumber,String cretedate, String carid, String customerid, String starttime,  String yajin, String money) {
        String sql="INSERT INTO ordertable (Ordernumber,Ordertime,Orderstatus,Ordercar,Customer,Orderplantsendtime,onedaymoney,Orderyajin)VALUES('"+Ordernumber+"','"+cretedate+"','1','"+carid+"','"+customerid+"','"+starttime+"','"+money+"','"+yajin+"')";
        System.out.println("添加订单的id是"+sql);
        int update = DBUtils.update(sql);
        return update;
    }

    @Override
    public List<Map<String, Object>> showpersonorder(String id) {
        String sql="select \n" +
                "ordertable.Ordernumber as orderid,\n" +
                "ordertable.Ordertime as ordercreattime,\n" +
                "ordertable.Orderstatus as orderstatue,\n" +
                "ordertable.Ordercar as ordercarid,\n" +
                "ordertable.Orderplantsendtime as ordersendid,\n" +
                "ordertable.Orderbacktime as orderbacktime,\n" +
                "ordertable.Orderyajin as orderyajin,\n" +
                "ordertable.Orderstatus as zhuangtai,\n" +
                "ordertable.onedaymoney as danjia,\n" +
                "car.Carbrand as carbrand,\n" +
                "car.Carname as carname,\n" +
                "car.Caridcard as caridcard,\n" +
                "car.Carpage as carpage,\n" +
                "customer.Customeremail as customermail,\n" +
                "customer.Customertel as customertel,\n" +
                "customer.Customeridcardnumber as customerid\n" +
                "FROM ordertable\n" +
                "join car on car.Carnumber=ordertable.Ordercar\n" +
                "join customer on customer.Customeridcardnumber=ordertable.Customer\n" +
                "where customer.Customeridcardnumber='"+id+"'\n";
        List<Map<String, Object>> query = DBUtils.query(sql);
        return query;
    }

    @Override
    public int backcar(String id,String time,String money) {
        String sql="update ordertable set Orderstatus ='2',Orderbacktime='"+time+"' ,gemoney='"+money+"'where Ordernumber='"+id+"'";

        int update = DBUtils.update(sql);
        return update;
    }

    @Override
    public List<Map<String, Object>> showrootorder() {
        String sql="select * from ordertable";
        List<Map<String, Object>> query = DBUtils.query(sql);
        return query;
    }

    @Override
    public List<Map<String, Object>> rootshoworderbymohu(String orderid, String orderzhuangtai, String ordertime) {
        String sql="select * from ordertable where flag=1 ";
        System.out.println(orderid+orderzhuangtai+ordertime+"dao接收到的值");
        if (orderid != null && orderid.length() > 0) {
            sql = sql + " and Ordernumber LIKE '%" + orderid + "%'";
        }
        if (orderzhuangtai != null && orderzhuangtai.length() > 0) {
            sql = sql + " and Orderstatus LIKE '%" + orderzhuangtai + "%'";
        }
        if (ordertime != null && ordertime.length() > 0) {
            sql = sql + " and Ordertime LIKE '%" + ordertime + "%'";
        }
        System.out.println("条件查询语句"+sql);
        List<Map<String, Object>> query = DBUtils.query(sql);

        return query;
    }

    @Override
    public List<Map<String, Object>> showrootorderinf(String id) {
        String sql ="SELECT\n" +
                "\tordertable.*, car.*, customer.*\n" +
                "FROM\n" +
                "\tordertable\n" +
                "JOIN car ON car.Carnumber = ordertable.Ordercar\n" +
                "JOIN customer ON customer.Customeridcardnumber = ordertable.Customer\n" +
                "WHERE\n" +
                "\tordertable.Ordernumber = '"+id+"'";
        List<Map<String, Object>> query = DBUtils.query(sql);
        return query;
    }

    @Override
    public List<Map<String, Object>> paiming() {
        String sql="select COUNT(car.Carname) AS number ,car.Carname,ordertable.gemoney\n" +
                "from ordertable\n" +
                "join car on car.Carnumber=ordertable.Ordercar\n" +
                "GROUP BY Carname";
        List<Map<String, Object>> query = DBUtils.query(sql);
        return query;
    }

    @Override
    public String getmoney() {
        String sql="select SUM(ordertable.gemoney) as money\n" +
                "from ordertable ";
        List<Map<String, Object>> query = DBUtils.query(sql);
        String money=null;
        for (Map<String, Object> list: query
        ){
            money=list.get("money").toString();
        }
        return money;
    }
}
