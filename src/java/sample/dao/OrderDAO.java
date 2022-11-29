/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
import sample.dto.Account;
import sample.dto.CartItems;
import sample.dto.Order;
import sample.dto.OrderDetail;
import sample.utils.DBUtils;

/**
 *
 * @author Fang Long
 */
public class OrderDAO implements Serializable {

    public static ArrayList<Order> getOrders(String email) {
        Connection cn = null;
        ArrayList<Order> list = new ArrayList<>();

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "Select [OrderID], [OrdDate], [shipdate], Orders.[status], orders.[AccID]\n"
                        + "from Orders\n"
                        + "inner join Accounts \n"
                        + "on Orders.AccID = Accounts.accID\n"
                        + "Where email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    Order order = new Order(
                            rs.getInt("OrderID"),
                            rs.getString("OrdDate"),
                            rs.getString("shipdate"),
                            rs.getInt("status"),
                            rs.getInt("AccID"));
                    list.add(order);
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public static ArrayList<Order> getOrders() {
        Connection cn = null;
        ArrayList<Order> list = new ArrayList<>();

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "Select [OrderID], [OrdDate], [shipdate], Orders.[status], orders.[AccID]\n"
                        + "from Orders\n"
                        + "inner join Accounts \n"
                        + "on Orders.AccID = Accounts.accID\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    Order order = new Order(
                            rs.getInt("OrderID"),
                            rs.getString("OrdDate"),
                            rs.getString("shipdate"),
                            rs.getInt("status"),
                            rs.getInt("AccID"));
                    list.add(order);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public static ArrayList<Order> getOrdersByDate(String email, String from, String to) {
        Connection cn = null;
        ArrayList<Order> list = new ArrayList<>();

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "Select [OrderID], [OrdDate], [shipdate], Orders.[status], orders.[AccID]\n"
                        + "                        from Orders\n"
                        + "                        inner join Accounts \n"
                        + "                        on Orders.AccID = Accounts.accID\n"
                        + "                        Where Accounts.email = ? and OrdDate between ? and ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, from);
                pst.setString(3, to);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    Order order = new Order(
                            rs.getInt("OrderID"),
                            rs.getString("OrdDate"),
                            rs.getString("shipdate"),
                            rs.getInt("status"),
                            rs.getInt("AccID"));
                    list.add(order);
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public static ArrayList<Order> getOrdersByStatus(String email, int status) {
        Connection cn = null;
        ArrayList<Order> list = new ArrayList<>();

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "Select [OrderID], [OrdDate], [shipdate], Orders.[status], orders.[AccID]\n"
                        + "from Orders\n"
                        + "inner join Accounts \n"
                        + "on Orders.AccID = Accounts.accID\n"
                        + "Where email = ? and Orders.[status] = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setInt(2, status);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    Order order = new Order(
                            rs.getInt("OrderID"),
                            rs.getString("OrdDate"),
                            rs.getString("shipdate"),
                            rs.getInt("status"),
                            rs.getInt("AccID"));
                    list.add(order);
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public static boolean updateOderStatus(int orderID, int status) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update Orders\n"
                        + "set status = ? \n"
                        + "where OrderID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, status);
                pst.setInt(2, orderID);

                if (pst.executeUpdate() > 0) {
                    return true;
                }

            }

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return false;
    }

    public static ArrayList<OrderDetail> getOrderDetail(int orderID) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select DetailId, OrderID, FID, Plants.PName, Plants.price, Plants.imgPath, OrderDetails.quantity\n"
                        + "from OrderDetails\n"
                        + "inner join Plants\n"
                        + "on OrderDetails.FID = Plants.PID\n"
                        + "Where OrderID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderID);
                ResultSet rs = pst.executeQuery();
                while (rs.next()) {
                    OrderDetail orderDetail
                            = new OrderDetail(
                                    rs.getInt("DetailId"),
                                    rs.getInt("OrderID"),
                                    rs.getInt("FID"),
                                    rs.getString("PName"),
                                    rs.getInt("price"),
                                    rs.getString("imgPath"),
                                    rs.getInt("quantity"));

                    list.add(orderDetail);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return list;
    }

    public static boolean insertOrder(String email, HashMap<String, CartItems> cart) {
        Connection cn = null;
        boolean result = false;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                Account account = new AccountDAO().getAccountDetail(email);
                int accId = account.getAccId();
                int orderId = 0;
                cn.setAutoCommit(false);

                System.out.println("Account ID = " + accId);
                Date d = new Date(System.currentTimeMillis());
                System.out.println("order date:" + d);
                String sql = "insert Orders(OrdDate,status,AccID) values(?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setDate(1, d);
                pst.setInt(2, 1);
                pst.setInt(3, accId);
                pst.executeUpdate();

                sql = "select top 1 orderID from Orders order by orderId desc";
                pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    orderId = rs.getInt("orderid");
                }

                System.out.println("orderid:" + orderId);
                Set<String> pids = cart.keySet();
                for (String pid : pids) {
                    sql = "insert OrderDetails values(?,?,?)";
                    pst = cn.prepareStatement(sql);
                    pst.setInt(1, orderId);
                    pst.setInt(2, Integer.parseInt(pid.trim()));
                    pst.setInt(3, cart.get(pid).getQuantity());
                    pst.executeUpdate();
                    cn.commit();
                    cn.setAutoCommit(true);

                }
                return true;

            } else {
                System.out.println("k chen order dc");
            }

        } catch (Exception e) {
            try {
                if (cn != null) {
                    cn.rollback();;
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            result = false;

        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

}
