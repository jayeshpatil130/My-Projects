/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Organization;

import Business.Role.ManufacturerRole;
import Business.Role.OrderManagerRole;
import Business.Role.Role;
import java.util.ArrayList;

/**
 *
 * @author sumitjanawlekar
 */
public class ManufacturerOrganization extends Organization{
    
    public ManufacturerOrganization(){
        super(Organization.Type.Manufacturer.getValue());
    }

    @Override
        public ArrayList<Role> getSupportedRole() {
        ArrayList<Role> roles = new ArrayList();
        roles.add(new ManufacturerRole());
        return roles;
    
}
}