/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO;

/**
 *
 * @author TIEU MY
 */
public class MonDTO {
    private String strMaM;
    private String strTenM;
    private String strMaL;
    private String strAnh;
    private int iGiaBan;
    private int iTrangThai;
    
    public MonDTO(){
        strMaM= null;
        strTenM= null;
        strMaL=null;
        strAnh=null;
        iGiaBan=0;
        iTrangThai=0;
    }
     public MonDTO(String strMaM,String strTenM,String strMaL,String strAnh,int iGiaBan,int iTrangThai){
        this.strMaM= strMaM;
        this.strTenM= strTenM;
        this.strMaL=strMaL;
        this.strAnh=strAnh;
        this.iGiaBan=iGiaBan;
        this.iTrangThai=iTrangThai;
     }

    /**
     * @return the strMaM
     */
    public String getStrMaM() {
        return strMaM;
    }

    /**
     * @param strMaM the strMaM to set
     */
    public void setStrMaM(String strMaM) {
        this.strMaM = strMaM;
    }

    /**
     * @return the strTenM
     */
    public String getStrTenM() {
        return strTenM;
    }

    /**
     * @param strTenM the strTenM to set
     */
    public void setStrTenM(String strTenM) {
        this.strTenM = strTenM;
    }

    /**
     * @return the strMaL
     */
    public String getStrMaL() {
        return strMaL;
    }

    /**
     * @param strMaL the strMaL to set
     */
    public void setStrMaL(String strMaL) {
        this.strMaL = strMaL;
    }

    /**
     * @return the strAnh
     */
    public String getStrAnh() {
        return strAnh;
    }

    /**
     * @param strAnh the strAnh to set
     */
    public void setStrAnh(String strAnh) {
        this.strAnh = strAnh;
    }

    /**
     * @return the iGiaBan
     */
    public int getiGiaBan() {
        return iGiaBan;
    }

    /**
     * @param iGiaBan the iGiaBan to set
     */
    public void setiGiaBan(int iGiaBan) {
        this.iGiaBan = iGiaBan;
    }

    /**
     * @return the iTrangThai
     */
    public int getiTrangThai() {
        return iTrangThai;
    }

    /**
     * @param iTrangThai the iTrangThai to set
     */
    public void setiTrangThai(int iTrangThai) {
        this.iTrangThai = iTrangThai;
    }
}
