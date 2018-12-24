/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Enterprise;

import Business.Role.Role;
import java.util.ArrayList;

/**
 *
 * @author Kunal
 */
public class ManufacturerEnterprise extends Enterprise {
    
    public ManufacturerEnterprise(String name){
        super(name,EnterpriseType.Manufacturer);
    }
    @Override
    public ArrayList<Role> getSupportedRole() {
        return null;
    }
    
}
