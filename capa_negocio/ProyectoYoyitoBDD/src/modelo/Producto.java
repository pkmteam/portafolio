/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author felip
 */
public class Producto {
    private String nomProd;
    private String price;
    private String img;
    private String fam;
    private String Vigencia;

    public Producto(){}
    
    public Producto(String nomProd, String price, String img, String fam, String Vigencia) {
        this.nomProd = nomProd;
        this.price = price;
        this.img = img;
        this.fam = fam;
        this.Vigencia = Vigencia;
    }

    public String getNomProd() {
        return nomProd;
    }

    public void setNomProd(String nomProd) {
        this.nomProd = nomProd;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getFam() {
        return fam;
    }

    public void setFam(String fam) {
        this.fam = fam;
    }

    public String getVigencia() {
        return Vigencia;
    }

    public void setVigencia(String Vigencia) {
        this.Vigencia = Vigencia;
    }
    
    
}
