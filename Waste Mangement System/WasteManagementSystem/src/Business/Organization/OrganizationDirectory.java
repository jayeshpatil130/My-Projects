/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Business.Organization;

import Business.Organization.Organization.Type;
import java.util.ArrayList;

/**
 *
 * @author Kunal
 */
public class OrganizationDirectory {
    
    private ArrayList<Organization> organizationList;

    public OrganizationDirectory() {
        organizationList = new ArrayList();
    }

    public ArrayList<Organization> getOrganizationList() {
        return organizationList;
    }
    
    public Organization createOrganization(Type type){
        Organization organization = null;
        if (type.getValue().equals(Type.Customer.getValue())){
            organization = new CustomerOrganization();
            organizationList.add(organization);
        }
        else if (type.getValue().equals(Type.RewardManagement.getValue())){
            organization = new RewardManagementOrganization();
            organizationList.add(organization);
        }
        else if (type.getValue().equals(Type.QualityCheck.getValue())){
            organization = new QualityCheckOrganization();
            organizationList.add(organization);
        }
        else if (type.getValue().equals(Type.Shipment.getValue())){
            organization = new ShipmentOrganization();
            organizationList.add(organization);
        }
        else if (type.getValue().equals(Type.OrderManagement.getValue())){
            organization = new OrderManagementOrganization();
            organizationList.add(organization);
        }
        else if (type.getValue().equals(Type.InventoryManagement.getValue())){
            organization = new InventoryManagementOrganization();
            organizationList.add(organization);
        }
         else if (type.getValue().equals(Type.Logistics.getValue())){
            organization = new LogisticsOrganization();
            organizationList.add(organization);
        }
         else if (type.getValue().equals(Type.Manufacturer.getValue())){
             organization = new ManufacturerOrganization();
             organizationList.add(organization);
         }
        return organization;
    }
    
}
