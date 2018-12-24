/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserInterface.orderManagementRole;

import Business.EcoSystem;
import Business.Enterprise.Enterprise;
import Business.Organization.ManufacturerOrganization;
import Business.Organization.OrderManagementOrganization;
import Business.Organization.Organization;
import Business.UserAccount.UserAccount;
import UserInterface.ManufacturerRole.ManufacturerWorkRequest;
import UserInterface.customerRole.requestTrashCollect;
import java.awt.CardLayout;
import javax.swing.JPanel;

/**
 *
 * @author sumitjanawlekar
 */
public class ManageOrderManagement extends javax.swing.JPanel {

    /**
     * Creates new form ManageOrderManagement
     */
    private JPanel userProcessContainer;
    private OrderManagementOrganization organization;
    private Enterprise enterprise;
    private UserAccount userAccount;
    private EcoSystem business;
    public ManageOrderManagement(JPanel userProcessContainer,  UserAccount userAccount,OrderManagementOrganization organization, Enterprise enterprise, EcoSystem business) {
        initComponents();
        this.userProcessContainer = userProcessContainer;
        this.userAccount = userAccount;
        this.enterprise = enterprise;
        this.business = business;
        this.organization = organization;
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnManageCustomerRequest = new javax.swing.JButton();
        btnManageManufacturerRequest = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();

        setBackground(new java.awt.Color(255, 255, 255));
        setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        btnManageCustomerRequest.setBackground(new java.awt.Color(255, 153, 0));
        btnManageCustomerRequest.setFont(new java.awt.Font("Times New Roman", 0, 16)); // NOI18N
        btnManageCustomerRequest.setForeground(new java.awt.Color(255, 255, 255));
        btnManageCustomerRequest.setText("Manage Customer Request");
        btnManageCustomerRequest.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnManageCustomerRequestActionPerformed(evt);
            }
        });
        add(btnManageCustomerRequest, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 115, 280, 40));

        btnManageManufacturerRequest.setBackground(new java.awt.Color(255, 153, 0));
        btnManageManufacturerRequest.setFont(new java.awt.Font("Times New Roman", 0, 16)); // NOI18N
        btnManageManufacturerRequest.setForeground(new java.awt.Color(255, 255, 255));
        btnManageManufacturerRequest.setText("Manage Manufacturer Request");
        btnManageManufacturerRequest.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnManageManufacturerRequestActionPerformed(evt);
            }
        });
        add(btnManageManufacturerRequest, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 189, 280, 50));

        jLabel1.setFont(new java.awt.Font("Lucida Grande", 1, 24)); // NOI18N
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("Manage Order Management");
        jLabel1.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 36, 551, -1));
    }// </editor-fold>//GEN-END:initComponents

    private void btnManageCustomerRequestActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnManageCustomerRequestActionPerformed
               // TODO add your handling code here:
        CardLayout layout = (CardLayout) userProcessContainer.getLayout();
        userProcessContainer.add("requestTrashCollect", new OrderManagementCustomerWorkArea(userProcessContainer, userAccount, organization, enterprise, business));
        layout.next(userProcessContainer);
    }//GEN-LAST:event_btnManageCustomerRequestActionPerformed

    private void btnManageManufacturerRequestActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnManageManufacturerRequestActionPerformed
        // TODO add your handling code here:
        CardLayout layout = (CardLayout) userProcessContainer.getLayout();
        userProcessContainer.add("requestTrashCollect", new OrderManagementManufacturerWorkArea(userProcessContainer, userAccount, organization, enterprise, business));
        layout.next(userProcessContainer);
    }//GEN-LAST:event_btnManageManufacturerRequestActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnManageCustomerRequest;
    private javax.swing.JButton btnManageManufacturerRequest;
    private javax.swing.JLabel jLabel1;
    // End of variables declaration//GEN-END:variables
}