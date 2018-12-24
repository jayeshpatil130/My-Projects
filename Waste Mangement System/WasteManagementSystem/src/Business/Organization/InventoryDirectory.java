/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Organization;

import java.util.ArrayList;

/**
 *
 * @author sumitjanawlekar
 */
public class InventoryDirectory {
    private ArrayList<Inventory> inventoryDirectory;
    
    public InventoryDirectory(){
        inventoryDirectory = new ArrayList<>();
    }

    public ArrayList<Inventory> getInventoryDirectory() {
        return inventoryDirectory;
    }

    public void setInventoryDirectory(ArrayList<Inventory> inventoryDirectory) {
        this.inventoryDirectory = inventoryDirectory;
    }
    
    
}
