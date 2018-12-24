/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Organization;

import Business.Role.Role;
import Business.Role.ShipperRole;
import java.util.ArrayList;

/**
 *
 * @author Kunal
 */
public class ShipmentOrganization extends Organization{

    public ShipmentOrganization() {
        super(Organization.Type.Shipment.getValue());
    }
    
    @Override
    public ArrayList<Role> getSupportedRole() {
        ArrayList<Role> roles = new ArrayList();
        roles.add(new ShipperRole());
        return roles;
    }
}
