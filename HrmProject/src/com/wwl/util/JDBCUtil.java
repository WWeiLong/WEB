package com.wwl.util;

import java.sql.*;

/**
 * 功能：jdbc自定义框架
 * <p>
 * 作者：老王
 * <p>
 * 时间：2022年8月15日
 * <p>
 * 版本：1.0
 */
public class JDBCUtil {

    private static Connection ct;
    private static PreparedStatement ps;
    private static ResultSet rs;
    private static String driver = "com.mysql.jdbc.Driver";
    private static String url = "jdbc:mysql://43.142.105.36:3306/demo1?useUnicode=true&characterEncoding=utf-8";
    private static String username = "root";
    private static String password = "123456";

    // 因为加载驱动只需要一次，所以直接放在静态代码块中
    static {
        // 1.加载驱动
        try {
//			通过配置文件读取信息
//			InputStream is = new FileInputStream("src/com/yueqian/jdbc工具类/db.properties");
//			Properties pro = new Properties();
//			pro.load(is);
//			driver = pro.getProperty("driver");
//			url = pro.getProperty("url");
//			username = pro.getProperty("username");
//			password = pro.getProperty("password");

            // 加载驱动
            Class.forName(driver);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 封装一个获得连接的方法
     *
     * @return 返回Connection
     */
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

    /**
     * 3.封装一个增删改的方法，
     *
     * @param sql sql语句
     * @param obj 占位符，可变参数
     * @return int类操作数据的条数
     */
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

    /**
     * 封装一个查询的方法,这个方法私有的，只能在本类中使用，比较灵活
     *
     * @param sql sql语句
     * @param obj 占位符，可变参数
     * @return ResuleSet 结果集
     */
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
//	public static <T> ArrayList<T> executeQuery(String sql, Class<T> cl, Object... obj) {
//		// 获得链接
//		ct = getConnection();
//		try {
//			ps = ct.prepareStatement(sql);
//			// 处理占位符
//			if (obj != null) {
//				for (int i = 0; i < obj.length; i++) {
//					ps.setObject(i + 1, obj[i]);
//				}
//
//			}
//			ResultSet rs = ps.executeQuery();
//			// 创建一个集合用来存放最终的数据
//			ArrayList<T> list = new ArrayList<T>();
//			Constructor<T> ct = cl.getDeclaredConstructor();
//			while (rs.next()) {
//				T t = ct.newInstance();
//				t = selectObject(cl, t, rs);
//				list.add(t);
//				System.out.println("");
//			}
//			return list;
//
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		return null;
//	}

    /**
     * 封装一个关闭资源方法
     */
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

    /**
     * 封装一个关闭资源方法，要求传入rs对象
     *
     * @param rs
     */
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

    /**
     * 创建一个数据表
     *
     * @param class1 类对象，会根据类对象创建相应的数据表
     */
//	public static int createTable(Class<?> class1) {
//		// sql ：create table person(number int,name varchar(255));
//		String sql = "create table if not EXISTS ";
//		// 获得表名字
//		String name = getClassName(class1);
//		sql = sql + name + "(";
//		// 获得所有字段的名字
//		Field[] fds = class1.getDeclaredFields();
//		for (Field f : fds) {
//			Table t = f.getAnnotation(Table.class);
//			sql = sql + t.columnName() + " " + t.type() + "(" + t.length() + ") " + t.checked() + ",";
//		}
//		// 去掉最后那个,
//		sql = sql.substring(0, sql.length() - 1) + ");";
//		System.out.println(sql);
//		// 去执行sql语句了
//		int i = executeUpdate(sql);
//
//		return i;
//
//	}
//
//	/**
//	 * 插入数据
//	 * 
//	 * @param object 是要插入的对象
//	 */
//	public static int insert(Object obj) {
//		// 定义好sql语句
//
//		String sql = "insert into ";
//		// 用反射获取class对象
//		Class<? extends Object> cl = obj.getClass();
//		// 获取类名字
//		String className = getClassName(cl);
//		sql = sql + className + "(";
//		// 要获得成员变量
//		Field[] fields = cl.getDeclaredFields();
//
//		for (Field f : fields) {
//			boolean b = checkedAuto(f);
//			if (!b) {
//				String name = f.getName();
//				sql = sql + name + ",";
//			}
//		}
//		// 删除最后一个逗号
//		sql = sql.substring(0, sql.length() - 1) + ")values(";
//		// 循环获取变量的值
//		for (Field f : fields) {
//			boolean b = checkedAuto(f);
//			if (!b) {
//				// 暴力反射
//				f.setAccessible(true);
//				try {
//
//					Object ostr = f.get(obj);
//					if (ostr instanceof Date) {
//
//						// 将时间转换成string类型
//						String str = new SimpleDateFormat("yyyy-MM-dd").format(ostr);
//
//						sql = sql + "'" + str + "',";
//					} else {
//
//						sql = sql + "'" + ostr + "',";
//					}
//
//				} catch (Exception e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//			}
//		}
//		// 去掉最后一个逗号
//		sql = sql.substring(0, sql.length() - 1) + ");";
//		System.out.println(sql);
//		// 去数据库添加
//		try {
//			return executeUpdate(sql);
//		} catch (Exception e) {
//			e.printStackTrace();
//			return -1;
//		}
//
//	}
//
//	/**
//	 * 通过主键修改数据，数据是一个对象，修改不为null或者不为0,0.0的字段
//	 * 
//	 * @param primarykey 主键
//	 * @param obj        就修改后的对象
//	 * @return 操作的数据条数
//	 */
//	public static int updateByPrimaryKey(String primarykey, Object obj) {
//		StringBuilder sql = new StringBuilder();
//		// 得到class对象
//		Class<? extends Object> cl1 = obj.getClass();
//		// sql语句
//		sql.append("update ").append(getClassName(cl1)).append(" set ");
//		// 获取字段及值
//		Field[] fields = cl1.getDeclaredFields();
//
//		for (Field f : fields) {
//			f.setAccessible(true);
//			// 获得字段
//			String name = f.getName();
//			Object o = null;
//			try {
//				o = f.get(obj);
//				if (o != null && !o.equals(0) && !o.equals(0.0)) {
//					sql.append(name).append("= '");
//					if (o instanceof Date) {
//						// 将时间转换成string类型
//						sql.append(new SimpleDateFormat("yyyy-MM-dd").format(o));
//					} else {
//						sql.append(o);
//					}
//					sql.append("' ,");
//				}
//
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//
//		}
//		// 刪除最後一個逗号
//		sql.delete(sql.length() - 1, sql.length());
//		sql.append(" where ").append(getPrimaryKey(cl1)).append("= '").append(primarykey).append("';");
//		// 操作数据库
//		return executeUpdate(sql.toString());
//
//	}
//
//	/**
//	 * 通过主键修改数据，修改全字段
//	 * 
//	 * @param primarykey 主键值
//	 * @param obj        修改的对象
//	 * @param flag       标志位，表示要修改全字段
//	 * @return
//	 */
//	public static int updateByPrimaryKey(String primarykey, Object obj, boolean flag) {
//		StringBuilder sql = new StringBuilder();
//		// 得到class对象
//		Class<? extends Object> cl1 = obj.getClass();
//		// sql语句
//		sql.append("update ").append(getClassName(cl1)).append(" set ");
//		// 获取字段及值
//		Field[] fields = cl1.getDeclaredFields();
//		String key = getPrimaryKey(cl1);
//
//		for (Field f : fields) {
//			f.setAccessible(true);
//			// 获得字段
//			String name = f.getName();
//			if (name.equals(key)) {
//				continue;// 如果是主键则跳过
//			}
//			Object o = null;
//			try {
//				o = f.get(obj);
//
//				sql.append(name).append("= '");
//				if (o instanceof Date) {
//					// 将时间转换成string类型
//					sql.append(new SimpleDateFormat("yyyy-MM-dd").format(o));
//				} else {
//
//					sql.append(o);
//				}
//				sql.append("' ,");
//
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//		}
//
//		// 刪除最後一個逗号
//		sql.delete(sql.length() - 1, sql.length());
//		sql.append(" where ").append(getPrimaryKey(cl1)).append("= '").append(primarykey).append("';");
//		// 操作数据库
//		return executeUpdate(sql.toString());
//	}
//
//	/**
//	 * 删除数据通过主键
//	 * 
//	 * @param primarykey
//	 * @param cl
//	 * @return
//	 */
//	public static int deleteByPrimaryKey(String primarykey, Class<?> cl) {
//		StringBuilder sb = new StringBuilder("delete from ");
//		sb.append(getClassName(cl)).append(" where ").append(getPrimaryKey(cl)).append("='" + primarykey + "';");
//		return executeUpdate(sb.toString());
//
//	}
//
//	/**
//	 * 查询一条数据
//	 * 
//	 * @param <T>
//	 * @param primarykey
//	 * @param cl
//	 * @return
//	 */
//	public static <T> T selectByPrimaryKey(String primarykey, Class<T> cl) {
//		try {
//			// 获得class对象
//			Constructor<T> ct = cl.getDeclaredConstructor();
//			T t = ct.newInstance();
//			StringBuilder sb = new StringBuilder("select * from ");
//			sb.append(getClassName(cl)).append(" where ").append(getPrimaryKey(cl)).append("='").append(primarykey)
//					.append("';");
//
////		去数据库查询
//			ResultSet rs = executeQuery(sb.toString());
//
//			if (rs.next()) {
//				t = selectObject(cl, t, rs);
//
//				System.out.println(t);
//				return t;
//
//			}
//
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			close(rs);
//		}
//
//		return null;
//	}
//
//	/**
//	 * 将查询的结果封装成一个对象
//	 * 
//	 * @param <T>
//	 * @param cl
//	 * @param t
//	 * @param rs
//	 * @return
//	 * @throws Exception
//	 */
//	private static <T> T selectObject(Class<T> cl, T t, ResultSet rs) throws Exception {
//		Method[] methods = cl.getDeclaredMethods();
//
//		Field[] fields = cl.getDeclaredFields();
//		for (Field f : fields) {
//			f.setAccessible(true);
//			char[] charArray = f.getName().toCharArray();
//			String setName = "set" + String.valueOf(charArray[0]).toUpperCase() + f.getName().substring(1);
//			String columnName = f.getAnnotation(Table.class).columnName();
//			Object object = rs.getObject(columnName);
//			if (object instanceof Date) {
//				Method md = cl.getDeclaredMethod(setName, f.getType());
//				String format = new SimpleDateFormat("yyyy-MM-dd").format(object);
//				md.invoke(t, format);
//				continue;
//			}
//			Method md = cl.getDeclaredMethod(setName, f.getType());
//			md.invoke(t, object);
//		}
////		for (Method m : methods) {
////			String name = m.getName();
////			if (name.startsWith("set")) {
////				// 调用set方法去设置值
//////						截取字段名字
////
////				m.invoke(t, rs.getObject(com));
////			}
////		}
//		return t;
//	}
//
//	/**
//	 * 将查询的结果封装成一个集合
//	 * 
//	 * @param <T>
//	 * @param c
//	 * @return
//	 */
//	public static <T> ArrayList<T> selectByArrays(Class<T> c) {
//		String sql = "select * from " + getClassName(c);
//		Constructor<T> ct = null;
//		try {
//			ct = c.getDeclaredConstructor();
//
//			// 创建一个集合用来存放查询到的数据
//			ArrayList<T> list = new ArrayList<T>();
////			去数据库查询
//			ResultSet rs = executeQuery(sql);
//			while (rs.next()) {
//				T t = ct.newInstance();
//				t = selectObject(c, t, rs);
//				list.add(t);
//			}
//			return list;
//
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} finally {
//			close(rs);
//		}
//
//		return null;
//	}
//
//	/**
//	 * 封装一个方法用来返回类名字
//	 * 
//	 * @param cl
//	 * @return
//	 */
//	private static String getClassName(Class<?> cl) {
//		ClassName an = cl.getAnnotation(ClassName.class);
//		String value = an.value();
//		return value;
//	}
//
//	/**
//	 * 或者主键的名字
//	 * 
//	 * @param cl
//	 * @return 主键名字
//	 */
//	private static String getPrimaryKey(Class<?> cl) {
//		Field[] fields = cl.getDeclaredFields();
//		for (Field f : fields) {
//			Table t = f.getAnnotation(Table.class);
//			String checked = t.checked();
//			if (checked.contains("primary key")) {
//				return t.columnName();
//			}
//		}
//
//		return "";
//	}
//
//	/**
//	 * 判断字段是否是自动增长
//	 * 
//	 * @param cl
//	 * @return true自动增长，false不是
//	 */
//	private static boolean checkedAuto(Field f) {
//		Table t = f.getAnnotation(Table.class);
//		// 先判断字段名是否相等
//		String checked = t.checked();
//		if (checked.contains("auto_increment")) {
//			return true;
//		}
//
//		return false;
//	}

//	// 查询数据
//	public static ResultSet executeQuery(String sql, Object... obj) {
//		// 获得链接
//		ct = getConnection();
//		try {
//			ps = ct.prepareStatement(sql);
//			// 处理占位符
//			if (obj != null) {
//				for (int i = 0; i < obj.length; i++) {
//					ps.setObject(i + 1, obj[i]);
//				}
//			}
//			return ps.executeQuery();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		return null;
//	}

}
