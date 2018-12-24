/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserInterface.ManufacturerRole;

import Business.EcoSystem;
import Business.Enterprise.Enterprise;
import Business.Network.Network;
import Business.Organization.ManufacturerOrganization;
import Business.Organization.OrderManagementOrganization;
import Business.Organization.Organization;
import Business.UserAccount.UserAccount;
import Business.WorkQueue.TrashOrderWorkRequest;
import java.awt.CardLayout;
import java.awt.Component;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

/**
 *
 * @author sumitjanawlekar
 */
public class OrderTrash extends javax.swing.JPanel {

    /**
     * Creates new form OrderTrash
     */
    private JPanel userProcessContainer;
    private ManufacturerOrganization organization;
    private Enterprise enterprise;
    private UserAccount userAccount;
    private EcoSystem business;
    public OrderTrash(JPanel userProcessContainer,  UserAccount userAccount, Enterprise enterprise, EcoSystem business) {
        initComponents();
        
        this.userProcessContainer = userProcessContainer;
        this.userAccount = userAccount;
        this.enterprise = enterprise;
        this.business = business;
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        requestTestJButton = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        txtQuantity = new javax.swing.JTextField();
        backJButton = new javax.swing.JButton();
        enterpriseLabel = new javax.swing.JLabel();
        cbxTrashType = new javax.swing.JComboBox<String>();
        jLabel2 = new javax.swing.JLabel();

        setBackground(new java.awt.Color(255, 255, 255));
        setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        requestTestJButton.setBackground(new java.awt.Color(255, 153, 0));
        requestTestJButton.setForeground(new java.awt.Color(255, 255, 255));
        requestTestJButton.setText("Request Trash");
        requestTestJButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                requestTestJButtonActionPerformed(evt);
            }
        });
        add(requestTestJButton, new org.netbeans.lib.awtextra.AbsoluteConstraints(348, 290, -1, -1));

        jLabel1.setFont(new java.awt.Font("Times New Roman", 0, 24)); // NOI18N
        jLabel1.setText("Quantity:");
        add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(41, 192, -1, -1));
        add(txtQuantity, new org.netbeans.lib.awtextra.AbsoluteConstraints(267, 195, 132, -1));

        backJButton.setBackground(new java.awt.Color(255, 153, 0));
        backJButton.setForeground(new java.awt.Color(255, 255, 255));
        backJButton.setText("<<Back");
        backJButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                backJButtonActionPerformed(evt);
            }
        });
        add(backJButton, new org.netbeans.lib.awtextra.AbsoluteConstraints(41, 290, -1, -1));

        enterpriseLabel.setFont(new java.awt.Font("Times New Roman", 0, 24)); // NOI18N
        enterpriseLabel.setText("Order Class");
        add(enterpriseLabel, new org.netbeans.lib.awtextra.AbsoluteConstraints(180, 50, 120, 30));

        cbxTrashType.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Plastic", "Paper", "Metal" }));
        add(cbxTrashType, new org.netbeans.lib.awtextra.AbsoluteConstraints(267, 128, 132, -1));

        jLabel2.setFont(new java.awt.Font("Times New Roman", 0, 24)); // NOI18N
        jLabel2.setText("Trash Type: ");
        add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(41, 125, -1, -1));
    }// </editor-fold>//GEN-END:initComponents

    private void requestTestJButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_requestTestJButtonActionPerformed
        if(txtQuantity.getText().isEmpty()){

            JOptionPane.showMessageDialog(null, "Fields Cannot be Empty");
        }
        else if(Integer.parseInt(txtQuantity.getText())<= 0){
            JOptionPane.showMessageDialog(null, "Invalid Input");
            return;
        }
      
      try{
           //Double.parseDouble(fctxt.getText());
          Integer.parseInt(txtQuantity.getText());
      }catch(NumberFormatException e){
           JOptionPane.showMessageDialog(null, "Weight Should be Numeric value");
           return;
      }
        
        String trashType = cbxTrashType.getSelectedItem().toString();
        String Quantity = txtQuantity.getText();
        
        TrashOrderWorkRequest request = new TrashOrderWorkRequest();
        request.setTrashType(trashType);
        request.setSender(userAccount);
        request.setStatus("Sent");
        request.setPickedUp("Not Pickedup");
        request.setQuantity(Quantity);

        Organization or = null;
        for(Network network : business.getNetworkList()){
            for(Enterprise enterprise : network.getEnterpriseDirectory().getEnterpriseList()){
                for(Organization org :  enterprise.getOrganizationDirectory().getOrganizationList()){
                    if(org instanceof OrderManagementOrganization){
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

        JOptionPane.showMessageDialog(null, "Successfull");

        //        Organization org = null;
        //        for (Organization organization : enterprise.getOrganizationDirectory().getOrganizationList()){
            //            if (organization instanceof CustomerOrganization){
                //                org = organization;
                //                break;
                //            }
            //        }
        //        if (org!=null){
            //            org.getWorkQueue().getWorkRequestList().add(request);
            //            userAccount.getWorkQueue().getWorkRequestList().add(request);
            //        }
            txtQuantity.setText("");
    }//GEN-LAST:event_requestTestJButtonActionPerformed

    private void backJButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_backJButtonActionPerformed

        userProcessContainer.remove(this);
        Component[] componentArray = userProcessContainer.getComponents();
        Component component = componentArray[componentArray.length - 1];
        ManufacturerWorkRequest dwjp = (ManufacturerWorkRequest) component;
        dwjp.populateRequestTable();
        CardLayout layout = (CardLayout)userProcessContainer.getLayout();
        layout.previous(userProcessContainer);
    }//GEN-LAST:event_backJButtonActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton backJButton;
    private javax.swing.JComboBox<String> cbxTrashType;
    private javax.swing.JLabel enterpriseLabel;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JButton requestTestJButton;
    private javax.swing.JTextField txtQuantity;
    // End of variables declaration//GEN-END:variables
}
