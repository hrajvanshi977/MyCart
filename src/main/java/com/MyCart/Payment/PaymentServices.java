/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.MyCart.Payment;

import com.MyCart.Entities.Order;
import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import java.util.ArrayList;
import java.util.List;

public class PaymentServices {
      private static final String CLIENT_ID = "ASeFsoID81MtAosJxGXVycIaj0B9ZhEcIzFDymP7Db5A_jy8JeApiPyXUZE6W-zgw96_u-4KkxWxkdqA";
      private static final String CLIENT_SECRET = "EMosFmVfuGDWVW0PnfECXwLjo7ZyxCDgnyh9ha8O22QSVp348VQgwNkRvyNqdwDU3I79Xh8v7VcYRnW7";
      private static final String MODE = "sandbox";
      
      public String authorizePayment(Order order) throws PayPalRESTException{
          Payer payer = getPayerInformation();
          RedirectUrls redirectUrls = getRedirectURLs();
          List<Transaction> listTransaction =  getTransactionInformation(order);
          
          Payment requestPayment = new Payment();
          requestPayment.setTransactions(listTransaction);
          requestPayment.setRedirectUrls(redirectUrls);
          requestPayment.setPayer(payer);
          requestPayment.setIntent("authorize");
          
          APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
          Payment approvedPayment = requestPayment.create(apiContext);
          
          System.out.println(approvedPayment);
          return getApprovalLink(approvedPayment);
      }   
      
    private String getApprovalLink(Payment approvedPayment) {
        List<Links> listLinks = approvedPayment.getLinks();
        
        String approvalLink = null;
        
        for(Links link : listLinks) {
            if(link.getRel().equalsIgnoreCase("approval_url")) {
                approvalLink = link.getHref();
                 break;
            }
        }
        return approvalLink;
    }
        
    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/MyCart/cancel_order.jsp");
        redirectUrls.setReturnUrl("http://localhost:8080/MyCart/review_payment");
        return redirectUrls;
    }
    
    private List<Transaction> getTransactionInformation(Order order) {
        
        Details details = new Details();
        details.setShipping(order.getShipping());
        details.setSubtotal(order.getSubtotal());
        details.setTax(order.getTax());
        
        Amount amount = new Amount();
        amount.setCurrency("INR");
        amount.setTotal(order.getTotal());
        amount.setDetails(details);
        
        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription(order.getProductName());
        
        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();
        
        Item item = new Item();
        item.setCurrency("INR");
        item.setName(order.getProductName());
        item.setPrice(order.getSubtotal());
        item.setTax(order.getTax());
        item.setQuantity("1");
        
        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);
        
        List<Transaction> listTransaction = new ArrayList<>();
        listTransaction.add(transaction);
        
        return listTransaction;
    }
    
    public Payment paymentDetails(String paymentId) throws PayPalRESTException {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return Payment.get(apiContext, paymentId);
    }
    private Payer getPayerInformation() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");
        
        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName("Himanshu");
        payerInfo.setLastName("Rajvanshi");
        payerInfo.setEmail("mangodi.sodala@gmail.com");
        
        payer.setPayerInfo(payerInfo);
        
        return payer;
    }
}
