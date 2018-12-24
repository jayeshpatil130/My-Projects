/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.WorkQueue;

import Business.UserAccount.UserAccount;

/**
 *
 * @author sumitjanawlekar
 */
public class trashCollectWorkRequest extends WorkRequest {
   // private String trashType;
    
    private String quantityFinalized;
    private int rewards;

    public int getRewards() {
        return rewards;
    }

    public void setRewards(int rewards) {
        this.rewards = rewards;
    }
    
    
    
    public String getQuantityFinalized() {
        return quantityFinalized;
    }

    public void setQuantityFinalized(String quantityFinalized) {
        this.quantityFinalized = quantityFinalized;
    }


    

    
    
}
