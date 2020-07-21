package guohao.service;

import guohao.bean.User;
import guohao.dao.UserDao;

import java.sql.SQLException;
import java.util.List;

/**
 * 用户的注册登录
 */
public class UserService {

    UserDao userDao = new UserDao();

    /**
     * 用户名是否已存在
     * 不存在则返回null
     * 存在则返回User对象
     * @param userName
     * @return
     */
    public User isUserNameExit(String userName) throws SQLException {
        List<User> userList = userDao.queryUser(userName);

        System.out.println("isUserNameExit:");
        System.out.println("userList==null? " + userList==null);
        System.out.println("userList.size()= " + userList.size());

        if(userList != null){
            for(User user : userList){
                System.out.println("[user_name="+user.getName()+", password="+user.getPwd()+"]");
            }
        }


        if(userList==null || userList.size()==0){
            return null;
        }


        return userList.get(0);
    }

    /**
     * 用户登录：检查用户信息是否正确，正确即可成功登录
     * @param userName
     * @param pwd
     * @return
     */
    public String login(String userName, String pwd) throws SQLException {
        User user = isUserNameExit(userName);

        if(user == null){
            return "用户名不存在！";
        }

        if(pwd.equals(user.getPwd())){
            return "success";
        }else {
            return "用户名或密码错误！";
        }
    }

    /**
     * 用户注册，检查用户名是否重复，不重复即注册成功
     * @param userName
     * @param pwd
     * @return
     * @throws SQLException
     */
    public String register(String userName, String pwd) throws SQLException{
        if(isUserNameExit(userName) != null){
            return "用户名已存在！";
        }

        userDao.addUser(new User(userName, pwd));

        return "success";
    }

}
