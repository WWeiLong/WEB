package com.wwl.util;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.sql.*;
import java.util.ArrayList;

/**
 * 功能： 工具类
 * <p>
 * 作者：老吴
 * <p>
 * 时间：2022年8月8日
 * <p>
 * 版本：1.0
 * <p>
 * <p>
 * 1.工具类中的方法应该是静态的 2.加载驱动只需要一次 3.获得连接，操作一次就要获得一次连接 4.增删改的方法封装成一个 5.查询封装一个方法
 * 6.考虑关闭资源问题
 */
public class JDBCUtils {
    private static Connection ct;
    private static PreparedStatement ps;
    private static ResultSet rs;
    private static String driver = "com.mysql.jdbc.Driver";
    private static String url = "jdbc:mysql://43.142.105.36:3306/hrdb?useUnicode=true&characterEncoding=utf-8";
    private static String username = "root";
    private static String password = "123456";

    static {
        // 1.加载驱动
        try {
//			InputStream is = new FileInputStream("src/com/yueqian/jdbc工具类/db.properties");
//			Properties pro = new Properties();
//			pro.load(is);
//			driver = pro.getProperty("driver");
//			url = pro.getProperty("url");
//			username = pro.getProperty("username");
//			password = pro.getProperty("password");

            Class.forName(driver);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } // 反射加载驱动
    }

    // 2.封装一个获得连接的方法
    public static Connection getConnection() {

        // 2.建立与数据库的连接
        try {
            ct = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return ct;

    }

    //封装一个增删改的方法
    public static int executeUpdate(String sql, Object... obj) {
        // 获得链接
        ct = getConnection();
        try {
            // 3.获得执行sql语句的对象
            ps = ct.prepareStatement(sql);
            // 处理占位符
            if (obj != null) {
                for (int i = 0; i < obj.length; i++) {
                    ps.setObject(i + 1, obj[i]);
                }

            }
            // 增删改都是同一个方法
            int in = ps.executeUpdate();
            return in;
        } catch (Exception e) {
            e.printStackTrace();

        } finally {

            close();
        }

        return 0;

    }

    // 封装一个查询的方法
    public static ResultSet executeQuery(String sql, Object... obj) {
        // 获得链接
        ct = getConnection();
        try {
            ps = ct.prepareStatement(sql);
            // 处理占位符
            if (obj != null) {
                for (int i = 0; i < obj.length; i++) {
                    ps.setObject(i + 1, obj[i]);
                }

            }
            return ps.executeQuery();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }

    /**
     * 封装一个查询的方法，返回的是一个集合，直接将返回的结果封装成了对象，再返回集合
     *
     * @param <T> 指定的类型
     * @param sql sql语句
     * @param cl  类对象
     * @param obj 占位符
     * @return ArrayLsit集合
     */
    public static <T> ArrayList<T> executeQuery(String sql, Class<T> cl, Object... obj) {
        // 获得链接
        ct = getConnection();
        try {
            ps = ct.prepareStatement(sql);
            // 处理占位符
            if (obj != null) {
                for (int i = 0; i < obj.length; i++) {
                    ps.setObject(i + 1, obj[i]);
                }

            }
            ResultSet rs = ps.executeQuery();
            // 创建一个集合用来存放最终的数据
            ArrayList<T> list = new ArrayList<T>();
            Constructor<T> ct = cl.getDeclaredConstructor();
            while (rs.next()) {
                T t = ct.newInstance();
                t = selectObject(cl, t, rs);
                list.add(t);
            }
            return list;

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }

    /**
     * 将查询的结果封装成一个对象
     *
     * @param <T>
     * @param cl
     * @param t
     * @param rs
     * @return
     * @throws Exception
     */
    private static <T> T selectObject(Class<T> cl, T t, ResultSet rs) throws Exception {
        Method[] methods = cl.getDeclaredMethods();
        for (Method m : methods) {
            String name = m.getName();
            if (name.startsWith("set")) {
                // 调用set方法去设置值
//						截取字段名字
                String com = name.substring(3).toLowerCase();

                m.invoke(t, rs.getObject(com));
            }
        }
        return t;
    }


    // 封装一个关闭资源方法
    public static void close() {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        if (ct != null) {
            try {
                ct.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }

    // 封装一个关闭资源方法
    public static void close(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        if (ct != null) {
            try {
                ct.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }

    }

}
