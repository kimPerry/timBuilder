package com.trihydro.timCreator.dao;

import com.trihydro.timCreator.DBUtility;
import com.trihydro.timCreator.model.RSU;
import com.trihydro.timCreator.helpers.SQLNullHandler;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.PreparedStatement;

public class RSUService
{
	private Connection connection;

	public RSUService(){
		connection = DBUtility.getConnection();	
	}

	public List<RSU> selectAll(){
		List<RSU> rsus = new ArrayList<RSU>();
		try {
			// select all RSUs from RSU table
   		    Statement statement = connection.createStatement();
   			ResultSet rs = statement.executeQuery("select * from rsu");
   			while (rs.next()) {
			    RSU rsu = new RSU();
			    rsu.setRsuId(rs.getInt("rsu_id"));
			    rsu.setRsuTarget(rs.getString("url"));
			    rsu.setRsuUsername(rs.getString("rsu_username"));    
			    rsu.setRsuPassword(rs.getString("rsu_password"));
			    rsu.setSnmpUsername(rs.getString("snmp_username"));
			    rsu.setSnmpPassword(rs.getString("snmp_password"));
			    rsus.add(rsu);
   			}
  		} 
  		catch (SQLException e) {
   			e.printStackTrace();
  		}
  		return rsus;
	}

	public List<RSU> selectActiveRSUs(){
		List<RSU> rsus = new ArrayList<RSU>();
		try {
			// select all RSUs from RSU table
   		    Statement statement = connection.createStatement();
   			ResultSet rs = statement.executeQuery("select rsu.*, rsu_vw.latitude, rsu_vw.longitude from rsu inner join rsu_vw on rsu.deviceid = rsu_vw.deviceid where rsu_vw.status = 'Existing'");
   			while (rs.next()) {
			    RSU rsu = new RSU();
			    rsu.setRsuId(rs.getInt("rsu_id"));
			    rsu.setRsuTarget(rs.getString("url"));
			    rsu.setRsuUsername(rs.getString("rsu_username"));    
			    rsu.setRsuPassword(rs.getString("rsu_password"));
			    rsu.setSnmpUsername(rs.getString("snmp_username"));
			    rsu.setSnmpPassword(rs.getString("snmp_password"));
			    rsu.setLatitude(rs.getDouble("latitude"));
			    rsu.setLongitude(rs.getDouble("longitude"));
			    rsus.add(rsu);
   			}
  		} 
  		catch (SQLException e) {
   			e.printStackTrace();
  		}
  		return rsus;
	}

	public void addRSU(RSU rsu) {
		try {
			
			PreparedStatement preparedStatement = connection.prepareStatement("insert into rsu(url, rsu_username, rsu_password, snmp_username, snmp_password) values (?,?,?,?,?)");
	  
			SQLNullHandler.setStringOrNull(preparedStatement, 1, rsu.getRsuTarget());
			SQLNullHandler.setStringOrNull(preparedStatement, 2, rsu.getRsuUsername());
			SQLNullHandler.setStringOrNull(preparedStatement, 3, rsu.getRsuPassword());
			SQLNullHandler.setStringOrNull(preparedStatement, 4, rsu.getSnmpUsername());
			SQLNullHandler.setStringOrNull(preparedStatement, 5, rsu.getSnmpPassword());
					
			preparedStatement.executeUpdate();

	  } catch (SQLException e) {
	   e.printStackTrace();
	  }
    }

}