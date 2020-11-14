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
public class ChiTietMonDTO {
    private String strMaM;
    private String strMaNL;
    private String strMaDV;
    private int iSoL;
    
    public ChiTietMonDTO(){
        strMaM= null;
        strMaNL= null;
        strMaDV= null;
        iSoL=0;
    }
     public ChiTietMonDTO(String strMaM,String strMaNL,String strMaDV, int iSoL){
        this.strMaM= strMaM;
        this.strMaNL= strMaNL;
        this.strMaDV= strMaDV;
        this.iSoL=iSoL;
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
     * @return the strMaNL
     */
    public String getStrMaNL() {
        return strMaNL;
    }

    /**
     * @param strMaNL the strMaNL to set
     */
    public void setStrMaNL(String strMaNL) {
        this.strMaNL = strMaNL;
    }

    /**
     * @return the strMaDV
     */
    public String getStrMaDV() {
        return strMaDV;
    }

    /**
     * @param strMaDV the strMaDV to set
     */
    public void setStrMaDV(String strMaDV) {
        this.strMaDV = strMaDV;
    }

    /**
     * @return the iSoL
     */
    public int getiSoL() {
        return iSoL;
    }

    /**
     * @param iSoL the iSoL to set
     */
    public void setiSoL(int iSoL) {
        this.iSoL = iSoL;
    }

}
