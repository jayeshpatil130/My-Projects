/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserInterface.orderManagementRole;

import Business.EcoSystem;
import Business.Enterprise.Enterprise;
import Business.Network.Network;
import Business.Organization.LogisticsOrganization;
import Business.Organization.OrderManagementOrganization;
import Business.Organization.Organization;
import Business.Organization.QualityCheckOrganization;
import Business.UserAccount.UserAccount;
import Business.WorkQueue.WorkRequest;
import Business.WorkQueue.trashCollectWorkRequest;
import java.awt.CardLayout;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author sumitjanawlekar
 */
public class OrderManagementCustomerWorkArea extends javax.swing.JPanel {

    /**
     * Creates new form OrderManagementCustomerWorkArea
     */
    private JPanel userProcessContainer;
    private EcoSystem business;
    private UserAccount userAccount;
    private OrderManagementOrganization orderManagementOrganization;
    private Enterprise enterprise;
    public OrderManagementCustomerWorkArea(JPanel userProcessContainer, UserAccount account, OrderManagementOrganization organization, Enterprise enterprise, EcoSystem business) {
        initComponents();
                
        this.userProcessContainer = userProcessContainer;
        this.userAccount = account;
        this.business = business;
        this.enterprise = enterprise;
        this.orderManagementOrganization = organization;
        
        populateTable();
    }
    
            public void populateTable(){
        DefaultTableModel model = (DefaultTableModel)workRequestJTable.getModel();
        
        model.setRowCount(0);
        
        for(WorkRequest request : orderManagementOrganization.getWorkQueue().getWorkRequestList()){
            if(request instanceof trashCollectWorkRequest){
                
            
            Object[] row = new Object[6];
            
            row[0] = ((trashCollectWorkRequest)request);
            row[1] = request.getSender().getEmployee().getName();
            row[2] = ((trashCollectWorkRequest)request).getPickedUp();
            row[3] = ((trashCollectWorkRequest)request).getDeliveryBoyName() == null ? "Not yet Assigned" : ((trashCollectWorkRequest)request).getDeliveryBoyName().getEmployee().getName();
            //row[3] = request.getReceiver() == null ? null : request.getReceiver().getEmployee().getName();
            row[4] = request.getStatus();
            row[5] = ((trashCollectWorkRequest)request).getQuantityFinalized() == "0" ? null :  ((trashCollectWorkRequest)request).getQuantityFinalized();
           
            
            
            model.addRow(row);
            }
        }
    }
            

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        workRequestJTable = new javax.swing.JTable();
        btnAssignLogistics = new javax.swing.JButton();
        processJButton = new javax.swing.JButton();
        refreshJButton = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jButton1 = new javax.swing.JButton();

        setBackground(new java.awt.Color(255, 255, 255));
        setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        workRequestJTable.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Trash Type", "Sender", "Pickup Status", "Delivery Boy Assigned", "Order Status", "Quantity", "Price"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.Object.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Object.class, java.lang.Object.class, java.lang.Object.class
            };
            boolean[] canEdit = new boolean [] {
                true, true, true, false, false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jScrollPane1.setViewportView(workRequestJTable);

        add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(15, 197, 853, 111));

        btnAssignLogistics.setBackground(new java.awt.Color(255, 153, 0));
        btnAssignLogistics.setFont(new java.awt.Font("Times New Roman", 0, 16)); // NOI18N
        btnAssignLogistics.setForeground(new java.awt.Color(255, 255, 255));
        btnAssignLogistics.setText("send to logistics");
        btnAssignLogistics.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAssignLogisticsActionPerformed(evt);
            }
        });
        add(btnAssignLogistics, new org.netbeans.lib.awtextra.AbsoluteConstraints(465, 384, -1, -1));

        processJButton.setBackground(new java.awt.Color(255, 153, 0));
        processJButton.setFont(new java.awt.Font("Times New Roman", 0, 16)); // NOI18N
        processJButton.setForeground(new java.awt.Color(255, 255, 255));
        processJButton.setText("Request to Quality Check");
        processJButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                processJButtonActionPerformed(evt);
            }
        });
        add(processJButton, new org.netbeans.lib.awtextra.AbsoluteConstraints(679, 384, -1, -1));

        refreshJButton.setBackground(new java.awt.Color(255, 153, 0));
        refreshJButton.setFont(new java.awt.Font("Times New Roman", 0, 16)); // NOI18N
        refreshJButton.setForeground(new java.awt.Color(255, 255, 255));
        refreshJButton.setText("Refresh");
        refreshJButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                refreshJButtonActionPerformed(evt);
            }
        });
        add(refreshJButton, new org.netbeans.lib.awtextra.AbsoluteConstraints(761, 134, -1, -1));

        jLabel1.setFont(new java.awt.Font("Lucida Grande", 1, 24)); // NOI18N
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("Order Management Customer Work Area");
        add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(15, 33, 853, -1));

        jButton1.setBackground(new java.awt.Color(255, 153, 0));
        jButton1.setFont(new java.awt.Font("Times New Roman", 0, 16)); // NOI18N
        jButton1.setForeground(new java.awt.Color(255, 255, 255));
        jButton1.setText("<<Back");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });
        add(jButton1, new org.netbeans.lib.awtextra.AbsoluteConstraints(63, 143, -1, -1));
    }// </editor-fold>//GEN-END:initComponents

    private void btnAssignLogisticsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAssignLogisticsActionPerformed

        int selectedRow = workRequestJTable.getSelectedRow();

        if (selectedRow < 0){
            JOptionPane.showMessageDialog(null, "Please select a row from the table first", "Warning", JOptionPane.WARNING_MESSAGE);
            return;
        }

        trashCollectWorkRequest request = (trashCollectWorkRequest)workRequestJTable.getValueAt(selectedRow, 0);
        if(request.getPickedUp().equalsIgnoreCase("Delivered")){
            JOptionPane.showMessageDialog(null, "Item already delivered");
        }
        
        else if(request.getStatus().equalsIgnoreCase("In Transit")){
            JOptionPane.showMessageDialog(null, "In Transit");
            
        }
        else{
            request.setStatus("In Transit");
               Organization or = null;
        for(Network network : business.getNetworkList()){
            for(Enterprise enterprise : network.getEnterpriseDirectory().getEnterpriseList()){
                for(Organization org :  enterprise.getOrganizationDirectory().getOrganizationList()){
                    if(org instanceof LogisticsOrganization){
                        or = org;
                        break;
                    }
                }
            }
        }
        if(or != null){
            or.getWorkQueue().getWorkRequestList().add(request);
            userAccount.getWorkQueue().getWorkRequestList().add(request);
        } 
        }
        populateTable();
    }//GEN-LAST:event_btnAssignLogisticsActionPerformed

    private void processJButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_processJButtonActionPerformed

        int selectedRow = workRequestJTable.getSelectedRow();

        if (selectedRow < 0){
            JOptionPane.showMessageDialog(null, "Please select a row from the table first", "Warning", JOptionPane.WARNING_MESSAGE);
            return;
        }
        

        trashCollectWorkRequest request = (trashCollectWorkRequest)workRequestJTable.getValueAt(selectedRow, 0);
        
        if(request.getStatus().equalsIgnoreCase("Sent to quality check")){
            JOptionPane.showMessageDialog(null, "With quality check");
            return;
            
        }
       else if (request.getStatus().equalsIgnoreCase("Completed")){
            JOptionPane.showMessageDialog(null, "Order Already Completed");
        }
        else if(request.getPickedUp().equalsIgnoreCase("Delivered")){
            request.setStatus("Sent to Quality Check");
            Organization org = null;
            for (Organization organization : enterprise.getOrganizationDirectory().getOrganizationList()){
                if (organization instanceof QualityCheckOrganization){
                    org = organization;
                    break;
                }
            }
            if (org!=null){
                org.getWorkQueue().getWorkRequestList().add(request);
                userAccount.getWorkQueue().getWorkRequestList().add(request);
            
            }
        }
        else{
            JOptionPane.showMessageDialog(null, "Item not yet delivered");
        }
        
        populateTable();

        //        ProcessLogisticsWorkRequestJPanel processLogisticsRequestJPanel = new ProcessLogisticsWorkRequestJPanel(userProcessContainer,request,userAccount,logisticsOrganization, enterprise, business);
        //        userProcessContainer.add("processLogisticsRequestJPanels", processLogisticsRequestJPanel);
        //        CardLayout layout = (CardLayout) userProcessContainer.getLayout();
        //        layout.next(userProcessContainer);
    }//GEN-LAST:event_processJButtonActionPerformed

    private void refreshJButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_refreshJButtonActionPerformed
        populateTable();
    }//GEN-LAST:event_refreshJButtonActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        // TODO add your handling code here:
         userProcessContainer.remove(this);
        CardLayout layout = (CardLayout) userProcessContainer.getLayout();
        layout.previous(userProcessContainer);
    }//GEN-LAST:event_jButton1ActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAssignLogistics;
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JButton processJButton;
    private javax.swing.JButton refreshJButton;
    private javax.swing.JTable workRequestJTable;
    // End of variables declaration//GEN-END:variables
}
