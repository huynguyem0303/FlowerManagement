/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import sample.dto.Plant;
import sample.utils.DBUtils;

/**
 *
 * @author Fang Long
 */
public class PlantDAO implements Serializable {

    public static ArrayList<Plant> getPlants(String keyword, String searchby) {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select PID, PName, Price, imgPath, description, status,Plants.CateID as 'CateID', CateName\n"
                        + "from Plants\n"
                        + "inner join Categories \n"
                        + "on Plants.CateID = Categories.CateID\n";

                if (searchby.equalsIgnoreCase("byname")) {
                    sql = sql + "where Plants.PName like ?";
                } else {
                    sql = sql + "where Categories.CateName like ?";
                }
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        Plant plant = new Plant(
                                rs.getInt("PID"),
                                rs.getString("PName"),
                                rs.getInt("Price"),
                                rs.getString("imgPath"),
                                rs.getString("description"),
                                rs.getInt("status"),
                                rs.getInt("CateID"),
                                rs.getString("CateName"));
                        list.add(plant);
                    }
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

    public static ArrayList<Plant> getPlants() {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select PID, PName, Price, imgPath, description, status,Plants.CateID as 'CateID', CateName\n"
                        + "from Plants\n"
                        + "inner join Categories \n"
                        + "on Plants.CateID = Categories.CateID\n";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        Plant plant = new Plant(
                                rs.getInt("PID"),
                                rs.getString("PName"),
                                rs.getInt("Price"),
                                rs.getString("imgPath"),
                                rs.getString("description"),
                                rs.getInt("status"),
                                rs.getInt("CateID"),
                                rs.getString("CateName"));
                        list.add(plant);
                    }
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

    public static Plant getPlant(int pid) {
        Connection cn = null;
        Plant plant = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "select PID, PName, Price, imgPath, description, status,Plants.CateID as 'CateID', CateName\n"
                        + "                        from Plants\n"
                        + "                        inner join Categories \n"
                        + "                        on Plants.CateID = Categories.CateID\n"
                        + "						where Plants.PID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, pid);
                ResultSet rs = pst.executeQuery();
                if (rs.next()) {
                    plant = new Plant(
                            rs.getInt("PID"),
                            rs.getString("PName"),
                            rs.getInt("Price"),
                            rs.getString("imgPath"),
                            rs.getString("description"),
                            rs.getInt("status"),
                            rs.getInt("CateID"),
                            rs.getString("CateName"));

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
        return plant;
    }

}
