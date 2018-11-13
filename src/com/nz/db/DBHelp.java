package com.nz.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nz.db.rowmapper.RowMapper;

public class DBHelp {

	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql:///test?useUnicode=true&characterEncoding=utf-8";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "123456";
	
	/**
	 * 閸旂姾娴囨す鍗炲З
	 * @return Connection閿熸枻鎷烽敓鏂ゆ嫹
	 */
	public Connection getConnection() {
		Connection conn = null; 
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	
	/**
	 * 鎵ч敓鏂ゆ嫹inster update delete閿熸枻鎷烽敓锟�
	 * executeUpdate("delete from t_user where id = ?",12);
	 * @param sql inster update delete閿熸枻鎷烽敓锟�
	 * @param params 鍗犱綅閿熸枻鎷峰�奸敓鏂ゆ嫹閿熸枻鎷疯閿熼叺锝忔嫹閿熸枻鎷烽『閿熸枻鎷烽敓鏂ゆ嫹鍚�
	 */
	public void executeUpdate(String sql,Object...params) {
		Connection conn = getConnection();
		PreparedStatement stat = null;
		
		try {
			stat = conn.prepareStatement(sql);
			//閿熸枻鎷峰崰浣嶉敓鏂ゆ嫹閿熸枻鎷峰��
			for (int i = 0; i < params.length; i++) {
				stat.setObject(i+1, params[i]);
			}
			//鎵ч敓鏂ゆ嫹SQL閿熸枻鎷烽敓锟�
			stat.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stat,conn);
		}
		
	}

	/**
	 * 鎵ч敓鏂ゆ嫹select閿熸枻鎷烽敓鏂ゆ嫹鍙栧敮涓�閿熶茎璁规嫹閿熸枻鎷�
	 * @param sql selete閿熸枻鎷烽敓锟�
	 * @param rowMapper RowMapper閿熸帴鍙ｇ鎷峰疄閿熸枻鎷烽敓鏂ゆ嫹閿熸枻鎷烽敓锟�
	 * @param params 鍗犱綅閿熸枻鎷峰��
	 * @return
	 */
	public <T> T queryForObject(String sql,RowMapper<T> rowMapper,Object...params) {
		Connection conn = getConnection();
		PreparedStatement stat = null;
		ResultSet rs = null;
		T obj = null;
		
		try {
			stat = conn.prepareStatement(sql);
			//閿熸枻鎷峰崰浣嶉敓鏂ゆ嫹閿熸枻鎷峰��
			for (int i = 0; i < params.length; i++) {
				stat.setObject(i+1, params[i]);
			}
			//鎵ч敓鏂ゆ嫹SQL閿熸枻鎷烽敓锟�
			rs = stat.executeQuery();
			
			//閿熸枻鎷峰彇閿熸枻鎷疯閿熶茎鏂ゆ嫹閿燂拷
			if(rs.next()) {
				obj = rowMapper.mapRow(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,stat,conn);
		}
		
		return obj;
	}
	
	public <T> List<T> queryForList(String sql,RowMapper<T> rowMapper,Object... params) {
		Connection conn = getConnection();
		PreparedStatement stat = null;
		ResultSet rs = null;
		List<T> list = new ArrayList<T>();
		
		try {
			stat = conn.prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				stat.setObject(i+1, params[i]);
			}
			rs = stat.executeQuery();
			while(rs.next()) {
				T obj = rowMapper.mapRow(rs);
				list.add(obj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs,stat,conn);
		}
		
		return list;
	}
	
	
	
	
	
	
	

	private void close(ResultSet rs, PreparedStatement stat, Connection conn) {
		try {
			if(rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(stat != null) {
					stat.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(conn != null) {
						conn.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}


	private void close(PreparedStatement stat, Connection conn) {
		close(null,stat,conn);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
