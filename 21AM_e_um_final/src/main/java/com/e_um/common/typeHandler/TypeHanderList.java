package com.e_um.common.typeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

public class TypeHanderList  implements TypeHandler<List<String>>{

	@Override
	public void setParameter(PreparedStatement ps, int i, List<String> parameter, JdbcType jdbcType)
			throws SQLException {
		// TODO Auto-generated method stub
		
		if(parameter!=null) {
			ps.setString(i, String.join(",", (String[])parameter.toArray()));
		} else {
			ps.setString(i,null);
		}
		
	}

	@Override
	public List<String> getResult(ResultSet rs, String columnName) throws SQLException {
		// TODO Auto-generated method stub
		return Arrays.asList(rs.getString(columnName).split(","));
	}

	@Override
	public List<String> getResult(ResultSet rs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		return Arrays.asList(rs.getString(columnIndex).split(","));
	}

	@Override
	public List<String> getResult(CallableStatement cs, int columnIndex) throws SQLException {
		// TODO Auto-generated method stub
		 return Arrays.asList(cs.getString(columnIndex).split(","));
	}


}
