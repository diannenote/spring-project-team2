package oracle.java.s20200502.room.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class RoomImgDaoImpl implements RoomImgDao {

	@Autowired
	private SqlSession session;

	DataSource dataSource;
	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;

	public RoomImgDaoImpl() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/OracleDB");
		} catch (Exception e) {
			System.out.println("생성자 dataSource-->" + e.getMessage());
			e.printStackTrace();
		}
	}
	
	@Override
	public int insert(List<String> pathList, int ro_num) {
		System.out.println("RoomImgDaoImpl insert Start...");
		String sql = "insert into roomImg values(?, i_seq.nextval, ?)";
		int result = 0;
		
		try {
			for(int i = 0; i < pathList.size(); i++) {
				con = dataSource.getConnection();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ro_num);
				pstmt.setString(2, pathList.get(i));
				result = pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return result;	
	}

	@Override
	public List<String> getRoomImg(int ro_num) {
		System.out.println("RoomImgDaoImpl getRoomImg Start...");
		
		return session.selectList("getRoomImg", ro_num);
	}

	@Override
	public int delete(int ro_num) {
		System.out.println("RoomImgDaoImpl delete Start...");
		return session.delete("deleteRoomImg", ro_num);
	}
}
