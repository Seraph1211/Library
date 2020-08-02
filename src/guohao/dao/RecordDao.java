package guohao.dao;

import guohao.bean.Record;
import guohao.utils.DbConUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RecordDao {
    private Connection conn = DbConUtil.getCon();

    /**
     * 插入一条新的借书记录
     * @param bookId
     * @param userId
     * @param isReturn
     * @return
     * @throws SQLException
     */
    public boolean addRecord(int bookId, int userId, boolean isReturn) throws SQLException {
        if(bookId<=0 || userId<=0){
            return false;
        }

        String sql = "insert into record(book_id, user_id, is_returned, borrowed_date, returned_date) values(?, ?, ?, ?, ?)";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, bookId);
        pstmt.setInt(2, userId);
        pstmt.setInt(3, isReturn ? 1 : 0);
        pstmt.setTimestamp(4, new Timestamp(new Date().getTime()));
        pstmt.setTimestamp(5, new Timestamp(new Date().getTime()+1209600));  //借书后14天内归还

        boolean result = pstmt.executeUpdate()>0 ? true : false;

        DbConUtil.close(null, pstmt, null, null);  //释放资源

        return result;
    }

    /**
     * 根据书籍id和用户id删除一条现有的借书记录
     * @param bookId
     * @param userId
     * @return
     * @throws SQLException
     */
    public boolean deleteRecord(int bookId, int userId) throws SQLException {
        if(bookId<=0 || userId<=0){
            return false;
        }

        String sql = "delete from record where book_id=? and user_id=?";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, bookId);
        pstmt.setInt(2, userId);

        boolean result = pstmt.executeUpdate()>0 ? true : false;

        DbConUtil.close(null, pstmt, null, null);  //释放资源

        return result;
    }

    /**
     * 根据书籍id和用户id更新借书记录
     * @param bookId
     * @param userId
     * @param isReturn
     * @return
     * @throws SQLException
     */
    public boolean updateRecord(int bookId, int userId, boolean isReturn) throws SQLException {
        if(bookId<=0 || userId<=0){
            return false;
        }

        String sql = "update record set is_returned=? where book_id=? and user_id=?";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, isReturn ? 1 : 0);
        pstmt.setInt(2, bookId);
        pstmt.setInt(3, userId);

        boolean result = pstmt.executeUpdate()>0 ? true : false;

        DbConUtil.close(null, pstmt, null, null);  //释放资源

        return result;
    }

    /**
     * 根据用户id查询借书记录
     * @param userId
     * @return
     * @throws SQLException
     */
    public List<Record> queryRecordByUserId(int userId) throws SQLException {
        if(userId <= 0){
            return null;
        }

        List<Record> recordList = new ArrayList<>();

        String sql = "select * from record where user_id=?";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, userId);

        ResultSet rs = pstmt.executeQuery();
        while (rs.next()){
            Record record = new Record();
            record.setBookId(rs.getInt("book_id"));
            record.setUserId(rs.getInt("user_id"));
            record.setReturned(rs.getInt("is_returned")==1 ? true : false);
            record.setBorrowedDate(rs.getTimestamp("borrowed_date"));
            record.setReturnedDate(rs.getTimestamp("returned_date"));

            recordList.add(record);
        }

        DbConUtil.close(null, pstmt, null, rs);  //释放资源

        return recordList;
    }

    /**
     * 根据书籍id查询借书信息
     * @param bookId
     * @return
     * @throws SQLException
     */
    public List<Record> queryRecordByBookId(int bookId) throws SQLException {
        if(bookId <= 0){
            return null;
        }

        List<Record> recordList = new ArrayList<>();

        String sql = "select * from record where book_id=?";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, bookId);

        ResultSet rs = pstmt.executeQuery();
        while (rs.next()){
            Record record = new Record();
            record.setBookId(rs.getInt("book_id"));
            record.setUserId(rs.getInt("user_id"));
            record.setReturned(rs.getInt("is_returned")==1 ? true : false);
            record.setBorrowedDate(rs.getTimestamp("borrowed_date"));
            record.setReturnedDate(rs.getTimestamp("returned_date"));

            recordList.add(record);
        }

        DbConUtil.close(null, pstmt, null, rs);  //释放资源

        return recordList;
    }

    public Record queryRecord(int bookId, int userId) throws SQLException{
        List<Record> recordList = new ArrayList<>();

        String sql = "select * from record where book_id=? and user_id=?";

        PreparedStatement pstmt = conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()){
            Record record = new Record();

            record.setBookId(rs.getInt("book_id"));
            record.setUserId(rs.getInt("user_id"));
            record.setBorrowedDate(rs.getTimestamp("borrowed_date"));
            record.setReturnedDate(rs.getTimestamp("returned_date"));
            record.setReturned(rs.getInt("is_returned")==1 ? true : false);

            recordList.add(record);
        }

        return recordList.get(0);
    }

    /**
     * 查询所有借书信息
     * @return
     */
    public List<Record> queryAllRecord() throws SQLException {
        List<Record> recordList = new ArrayList<>();

        String sql = "select * from record";

        PreparedStatement pstmt = conn.prepareStatement(sql);

        ResultSet rs = pstmt.executeQuery();
        while (rs.next()){
            Record record = new Record();
            record.setBookId(rs.getInt("book_id"));
            record.setUserId(rs.getInt("user_id"));
            record.setReturned(rs.getInt("is_returned")==1 ? true : false);
            record.setBorrowedDate(rs.getTimestamp("borrowed_date"));
            record.setReturnedDate(rs.getTimestamp("returned_date"));

            recordList.add(record);
        }

        DbConUtil.close(null, pstmt, null, rs);  //释放资源

        return recordList;
    }
}
