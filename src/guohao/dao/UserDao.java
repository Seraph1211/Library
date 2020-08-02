package guohao.dao;

import guohao.bean.Book;
import guohao.bean.Record;
import guohao.bean.User;
import guohao.utils.DbConUtil;
import org.omg.PortableServer.LIFESPAN_POLICY_ID;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class UserDao {

    private Connection conn = DbConUtil.getCon();

    /**
     * 向数据库中添加用户信息
     * @param user
     * @return
     */
    public boolean addUser(User user){
        String sql = "insert into user(user_name, pwd) values(?, ?)";

        PreparedStatement pstmt = null;
        int i = 0;

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getPwd());

            i = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DbConUtil.close(null, pstmt, null, null);  //释放资源
        }

        return i>0 ? true : false;
    }

    /**
     * 根据user_id删除用户信息
     * @param userId
     * @return
     */
    public boolean deleteUser(int userId) throws SQLException {
        if(userId <= 0){
            return false;
        }

        String sql = "delete from user where id=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, userId);

        return pstmt.executeUpdate()>0 ? true : false;
    }

    /**
     * 通过bean更新用户信息
     * @param user
     * @return
     * @throws SQLException
     */
    public boolean updateUser(User user) throws SQLException {
        if(user == null){
            return false;
        }

        String sql = "update user set user_name=?, pwd=? where user_id=?";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, user.getName());
        pstmt.setString(2, user.getPwd());
        pstmt.setInt(3, user.getId());

        return pstmt.executeUpdate()>0 ? true : false;
    }

    /**
     * 根据用户名查询用户信息，返回List
     * @param userName
     * @return
     * @throws SQLException
     */
    public List<User> queryUser(String userName) throws SQLException {
        if(userName.equals("") || userName==null){
            return null;
        }

        List<User> users = new ArrayList<>();

        String sql = "select * from user where user_name=?";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userName);

        ResultSet rs = pstmt.executeQuery();

        while (rs.next()){
            User user = new User();
            user.setId(rs.getInt("user_id"));
            user.setName(rs.getString("user_name"));
            user.setPwd(rs.getString("pwd"));
            user.setBorrowedBooks(queryBorrowedBooks(user.getId()));
            user.setReturnedBooks(queryReturnedBooks(user.getId()));

            users.add(user);
        }

        return users;
    }

    public List<User> queryAllUser() throws SQLException {
        List<User> userList = new ArrayList<>();

        String sql = "select * from user";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()){
            User user = new User();
            user.setId(rs.getInt("user_id"));
            user.setName(rs.getString("user_name"));
            user.setPwd(rs.getString("pwd"));

            userList.add(user);
        }

        return userList;
    }

    /**
     * 根据用户id查询用户的借书信息
     * @param userId
     * @return
     */
    public List<Book> queryBorrowedBooks(int userId){

        return null;
    }


    /**
     * 根据用户id查询用户的还书信息
     * @param userId
     * @return
     */
    public List<Book> queryReturnedBooks(int userId){
        return null;
    }




}
