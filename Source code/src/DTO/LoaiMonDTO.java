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
public class LoaiMonDTO {
    private String strMaLM;
    private String strTenLM;
    
    public LoaiMonDTO(){
        strMaLM= null;
        strTenLM= null;
    }
     public LoaiMonDTO(String strMaLM,String strTenLM){
        this.strMaLM= strMaLM;
        this.strTenLM= strTenLM;
     }

    /**
     * @return the strMaLM
     */
    public String getStrMaLM() {
        return strMaLM;
    }

    /**
     * @param strMaLM the strMaLM to set
     */
    public void setStrMaLM(String strMaLM) {
        this.strMaLM = strMaLM;
    }

    /**
     * @return the strTenLM
     */
    public String getStrTenLM() {
        return strTenLM;
    }

    /**
     * @param strTenLM the strTenLM to set
     */
    public void setStrTenLM(String strTenLM) {
        this.strTenLM = strTenLM;
    }

}
