package com.wwl.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Field;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class BeanUtil {
    public static <T> T getBean(Class<T> cl, HttpServletRequest req, HttpServletResponse resp) {
        try {
            //获得对象的无参构造器
            T t = cl.getDeclaredConstructor().newInstance();
            //通过反射创建对象
            Field[] fields = cl.getDeclaredFields();
            for (Field f : fields) {
                //获得字段的名字
                String name = f.getName();
                //获得前端传过来的参数集合
                Map<String, String[]> map = req.getParameterMap();
                //转换为set集合
                Set<Map.Entry<String, String[]>> set = map.entrySet();
                //用迭代器遍历集合
                Iterator<Map.Entry<String, String[]>> it = set.iterator();
                while (it.hasNext()) {
                    //遍历
                    Map.Entry<String, String[]> next = it.next();
                    //得到key值
                    String key = next.getKey();
                    //得到value值
                    String[] value = next.getValue();
                    //反射暴力破解
                    f.setAccessible(true);
                    //如果前端传过来的的表单中的  name与实体类中的字段名  相等
                    if (key.equalsIgnoreCase(name)) {
                        //如果传过来的值的长度大于1,即前端传过来的是复选框的值
                        if (value.length > 1) {
                            //将字段的值set到构造器中
                            f.set(t, Arrays.toString(value));
                        } else {
                            //判断传来的类型是否是int或者Integer,因为map解析的数据是String,String[] 要转换类型
                            Class<?> type = f.getType();
                            if (type == int.class || type == Integer.class) {
                                int v = Integer.parseInt(value[0]);
                                //set值
                                f.set(t, v);
                            } else {
                                f.set(t, value[0]);
                            }
                        }
                    }
                }
            }
            return t;
        } catch (Exception e) {
            e.printStackTrace();

        }

        return null;
    }

    public static void main(String[] args) {
    }
}
