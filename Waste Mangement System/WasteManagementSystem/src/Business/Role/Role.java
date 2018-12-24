/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Role;

import Business.EcoSystem;
import Business.Enterprise.Enterprise;
import Business.Organization.Organization;
import Business.UserAccount.UserAccount;
import javax.swing.JPanel;

/**
 *
 * @author Kunal
 */
public abstract class Role {
    
    public enum RoleType{
        Admin("Admin"),
        RewardManager("Reward Manager"),
        QualityCheck("Quality Check"),
        OrderManager("Order Manager"),
        InventoryManager("Invetory Manager"),
        Shipper("Shipper"),
        Customer("Customer");
        
        public static RoleType getAdmin() {
            return Admin;
        }

        public static RoleType getRewardManager() {
            return RewardManager;
        }

        public static RoleType getQualityCheck() {
            return QualityCheck;
        }

        public static RoleType getOrderManager() {
            return OrderManager;
        }

        public static RoleType getInventoryManager() {
            return InventoryManager;
        }

        public static RoleType getShipper() {
            return Shipper;
        }

        public static RoleType getCustomer() {
            return Customer;
        }

       
private String value;
        private RoleType(String value){
            this.value = value;
        }

        public String getValue() {
            return value;
        }

        @Override
        public String toString() {
            return value;
        }
    }
    
    public abstract JPanel createWorkArea(JPanel userProcessContainer, 
            UserAccount account, 
            Organization organization, 
            Enterprise enterprise, 
            EcoSystem business);

    @Override
    public String toString() {
        return this.getClass().getName();
    }
} 
