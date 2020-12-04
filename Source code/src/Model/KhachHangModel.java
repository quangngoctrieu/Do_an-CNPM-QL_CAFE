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
    
    /*DANH SACH KHÁCH HÀNG XUẤT RA*/
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
                Kh.setStrMaKH(rs.getString("makh"));
                Kh.setStrTenKH(rs.getString("hoten"));
                Kh.setStrSDT(rs.getString("sdt"));
                Kh.setStrDiaChi(rs.getString("diachi"));
                Kh.setStrCapTV(rs.getString("thanhvien"));
                Kh.setStrEmail(rs.getString("email"));
                Kh.setStrGioiTinh(rs.getString("gioitinh"));
                Kh.setStrNgayCap(rs.getString("ngaycap"));  
                list.add(Kh);
            }
        }
        catch(Exception ex){
            ex.getMessage();
        }
        return list;
    }
    
    public boolean CapNhatThongTinKhachHang(KhachHangDTO KH) throws SQLException{
        String sql="update khachhang set hoten=?, sdt=?, diachi=?, email=?, thanhvien=? where makh=?";
        try(
                Connection con=SQLConnect.openConnection();
                PreparedStatement pstmt=con.prepareStatement(sql);
                ){
            pstmt.setString(1, KH.getStrTenKH());
            pstmt.setString(2, KH.getStrSDT());
            pstmt.setString(3, KH.getDiaChi());
            pstmt.setString(4, KH.getEmail());
            pstmt.setInt(5, KH.getDiem());
            pstmt.setInt(6, KH.getMaKhachHang());
            return pstmt.executeUpdate()>0;
            return:
            reutnr:
            werqwe:
  
        }
    }
}
