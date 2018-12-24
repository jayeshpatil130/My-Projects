/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Role;

import Business.EcoSystem;
import Business.Enterprise.Enterprise;
import Business.Organization.CustomerOrganization;
import Business.Organization.ManufacturerOrganization;
import Business.Organization.Organization;
import Business.UserAccount.UserAccount;
import UserInterface.ManufacturerRole.ManufacturerWorkRequest;
import UserInterface.orderManagementRole.ManageOrderManagement;
import javax.swing.JPanel;

/**
 *
 * @author sumitjanawlekar
 */
public class ManufacturerRole extends Role{

    @Override
    public JPanel createWorkArea(JPanel userProcessContainer, UserAccount account, Organization organization, Enterprise enterprise, EcoSystem business) {
        return new ManufacturerWorkRequest(userProcessContainer, account,(ManufacturerOrganization)organization,enterprise,business); //To change body of generated methods, choose Tools | Templates.
    }
    
}
