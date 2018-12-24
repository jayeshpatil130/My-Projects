/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Organization;

import Business.Role.QualityCheckRole;
import Business.Role.Role;
import java.util.ArrayList;

/**
 *
 * @author Kunal
 */
public class QualityCheckOrganization extends Organization{

    public QualityCheckOrganization() {
        super(Organization.Type.QualityCheck.getValue());
    }
    
    @Override
    public ArrayList<Role> getSupportedRole() {
        ArrayList<Role> roles = new ArrayList();
        roles.add(new QualityCheckRole());
        return roles;
    }
    
}
