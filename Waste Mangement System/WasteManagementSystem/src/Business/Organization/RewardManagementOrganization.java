/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Organization;

import Business.Role.Role;
import java.util.ArrayList;

import Business.Role.RewardManagerRole;
/**
 *
 * @author Kunal
 */
public class RewardManagementOrganization extends Organization{

    public RewardManagementOrganization() {
        super(Organization.Type.RewardManagement.getValue());
    }
    
    @Override
    public ArrayList<Role> getSupportedRole() {
        ArrayList<Role> roles = new ArrayList();
        roles.add(new RewardManagerRole());
        return roles;
    }
}
