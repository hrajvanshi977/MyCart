/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.MyCart.Entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "p_id")
    private int productId;
    
    @Column(name = "p_name")
    private String productName;
    
    @Column(length = 1500, name = "p_description")
    private String productDescription;
    
    @Column(name = "p_pic")
    private String productPic;
    
    @Column(name = "p_price")
    private int productPrice;
    
    @Column(name = "p_discount")
    private int productDiscount;
    
    @Column(name = "p_quantity")
    private int productQuantity;
    
    @ManyToOne  
    private Category category;

    public Product(int productId, String productName, String productDescription, String productPic, int productPrice, int productDiscount, int productQuantity) {
        this.productId = productId;
        this.productName = productName;
        this.productDescription = productDescription;
        this.productPic = productPic;
        this.productPrice = productPrice;
        this.productDiscount = productDiscount;
        this.productQuantity = productQuantity;
    }

    public Product(String productName, String productDescription, String productPic, int productPrice, int productDiscount, int productQuantity, Category category) {
        this.productName = productName;
        this.productDescription = productDescription;
        this.productPic = productPic;
        this.productPrice = productPrice;
        this.productDiscount = productDiscount;
        this.productQuantity = productQuantity;
        this.category = category;
    }

    public Product() {
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getProductPic() {
        return productPic;
    }

    public void setProductPic(String productPic) {
        this.productPic = productPic;
    }

    public int getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(int productPrice) {
        this.productPrice = productPrice;
    }

    public int getProductDiscount() {
        return productDiscount;
    }

    public void setProductDiscount(int productDiscount) {
        this.productDiscount = productDiscount;
    }

    public int getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(int productQuantity) {
        this.productQuantity = productQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
    @Override
    public String toString() {
        return "Product{" + "productId=" + productId + ", productName=" + productName + ", productDescription=" + productDescription + ", productPic=" + productPic + ", productPrice=" + productPrice + ", productDescount=" + productDiscount + ", productQuantity=" + productQuantity + '}';
    }
    
    // calculate price after discount
    public int getPriceAfterDiscount() {
        int offPrice = (int)((this.productPrice * this.getProductDiscount())/100.0);
        return this.productPrice - offPrice;
    }
}
