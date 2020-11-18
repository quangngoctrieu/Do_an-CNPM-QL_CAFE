/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;
import DTO.KhachHangDTO;
import ConnectDATABASE.SQLConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Vo The Hoc
 */
public class KhachHangModel {
    public List<KhachHangDTO> danhsach(){
        List<KhachHangDTO> list = new ArrayList<>();
        
        String sql = "SELECT * FROM khachhang";
        
        try (
                Connection conn = SQLConnect.openConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery();
                ) 
        {
            while (rs.next()) {
                KhachHangDTO Kh = new KhachHangDTO();
                Kh.setMaKhachHang(rs.getInt("MaKhachHang"));
                Kh.setTenKhachHang(rs.getString("TenKhachHang"));
                Kh.setSDT(rs.getString("SDT"));
                Kh.setDiaChi(rs.getString("DiaChi"));
                Kh.setEmail(rs.getString("Email"));
                Kh.setDiem(rs.getInt("Diem"));  
                list.add(Kh);
            }
        }
        catch(Exception ex){
            ex.getMessage();
        }
        return list;
    } 
}
