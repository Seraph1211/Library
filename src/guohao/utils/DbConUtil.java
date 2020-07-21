package guohao.utils;

import java.sql.*;

/**
 * MySQL连接工具类
 */
public class DbConUtil {
    private static final String URL = "jdbc:mysql://127.0.0.1:3306/library?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false";
    private static final String USER = "root";
    private static final String PASSWORD = "123456";
    private static final String DRIVERPATH = "com.mysql.cj.jdbc.Driver";

    private static Connection conn = null;

    static {
        try {
            Class.forName(DRIVERPATH);
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }
    }

    /**
     * 获取JDBC的Connection对象
     * @return
     */
    public static Connection getCon(){
        synchronized (DbConUtil.class){  //解决线程安全相关问题
            try {
                if(conn == null || conn.isClosed()){
                    synchronized (DbConUtil.class){
                        conn = DriverManager.getConnection(URL, USER, PASSWORD);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return conn;
    }

    /**
     * 关闭JDBC相关对象，释放资源
     * @param conn
     * @param pstmt
     * @param stmt
     * @param rs
     */
    public static void close(Connection conn, PreparedStatement pstmt, Statement stmt, ResultSet rs){

        try {
            if(rs != null){
                rs.close();
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try {
                if(stmt != null){
                    stmt.close();
                }
            }catch (SQLException e){
                e.printStackTrace();
            }finally {
                try {
                    if(pstmt != null){
                        pstmt.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

    }


}
