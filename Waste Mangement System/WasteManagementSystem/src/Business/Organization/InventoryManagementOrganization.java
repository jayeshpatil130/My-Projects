/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Organization;

import Business.Role.InventoryManagerRole;
import Business.Role.Role;
import java.util.ArrayList;

/**
 *
 * @author Kunal
 */
public class InventoryManagementOrganization extends Organization{
    private InventoryDirectory inventoryList;

    public InventoryManagementOrganization() {
       
        super(Organization.Type.InventoryManagement.getValue());
         inventoryList = new InventoryDirectory();
    }

    public InventoryDirectory getInventoryList() {
        return inventoryList;
    }

    public void setInventoryList(InventoryDirectory inventoryList) {
        this.inventoryList = inventoryList;
    }
    
    
    
    @Override
    public ArrayList<Role> getSupportedRole() {
        ArrayList<Role> roles = new ArrayList();
        roles.add(new InventoryManagerRole());
        return roles;
    }
}
