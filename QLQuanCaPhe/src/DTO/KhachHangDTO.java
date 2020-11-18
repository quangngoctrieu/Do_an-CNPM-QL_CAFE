/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author Vo The Hoc
 */
public class KhachHangDTO {
    private String strMaKH;
    private String strTenKH;
    private String strSDT;
    private String strGioiTinh;
    private String strCapTV;
    private String strEmail;
    private String strNgayCap;

    public KhachHangDTO(String strMaKH, String strTenKH, String strSDT, String strGioiTinh, String strCapTV, String strEmail, String strNgayCap) {
        this.strMaKH = strMaKH;
        this.strTenKH = strTenKH;
        this.strSDT = strSDT;
        this.strGioiTinh = strGioiTinh;
        this.strCapTV = strCapTV;
        this.strEmail = strEmail;
        this.strNgayCap = strNgayCap;
    }

    public KhachHangDTO(String strTenKH, String strSDT, String strGioiTinh, String strCapTV, String strEmail, String strNgayCap) {
        this.strTenKH = strTenKH;
        this.strSDT = strSDT;
        this.strGioiTinh = strGioiTinh;
        this.strCapTV = strCapTV;
        this.strEmail = strEmail;
        this.strNgayCap = strNgayCap;
    }

    public KhachHangDTO() {
    }

    public String getStrMaKH() {
        return strMaKH;
    }

    public String getStrTenKH() {
        return strTenKH;
    }

    public String getStrSDT() {
        return strSDT;
    }

    public String getStrGioiTinh() {
        return strGioiTinh;
    }

    public String getStrCapTV() {
        return strCapTV;
    }

    public String getStrEmail() {
        return strEmail;
    }

    public String getStrNgayCap() {
        return strNgayCap;
    }

    public void setStrMaKH(String strMaKH) {
        this.strMaKH = strMaKH;
    }

    public void setStrTenKH(String strTenKH) {
        this.strTenKH = strTenKH;
    }

    public void setStrSDT(String strSDT) {
        this.strSDT = strSDT;
    }

    public void setStrGioiTinh(String strGioiTinh) {
        this.strGioiTinh = strGioiTinh;
    }

    public void setStrCapTV(String strCapTV) {
        this.strCapTV = strCapTV;
    }

    public void setStrEmail(String strEmail) {
        this.strEmail = strEmail;
    }

    public void setStrNgayCap(String strNgayCap) {
        this.strNgayCap = strNgayCap;
    }
    
}
