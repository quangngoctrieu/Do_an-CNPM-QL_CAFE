/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.DTO;

/**
 *
 * @author doanv
 */
public class LuongNvDTO {
    public  int iTongGioLam , iTienLuong , iTrangThai;
    public LuongNvDTO() {
        iTienLuong = 0;
        iTongGioLam = 0;
        iTrangThai = 0;
    }
    public LuongNvDTO(int iTongGioLam,int iTienLuong , int iTrangThai) {
        this.iTienLuong = iTienLuong;
        this.iTongGioLam = iTongGioLam;
        this.iTrangThai = iTrangThai;
    }
    public int getiTongGioLam() {
        return iTongGioLam;
    }

    public void setiTongGioLam(int iTongGioLam) {
        this.iTongGioLam = iTongGioLam;
    }

    public int getiTienLuong() {
        return iTienLuong;
    }

    public void setiTienLuong(int iTienLuong) {
        this.iTienLuong = iTienLuong;
    }

    public int getiTrangThai() {
        return iTrangThai;
    }

    public void setiTrangThai(int iTrangThai) {
        this.iTrangThai = iTrangThai;
    }
    
    
}
