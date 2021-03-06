/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserInterface.QualityCheckRole;

import Business.EcoSystem;
import Business.Enterprise.Enterprise;
import Business.Organization.InventoryManagementOrganization;
import Business.Organization.Organization;
import Business.Organization.QualityCheckOrganization;
import Business.UserAccount.UserAccount;
import Business.WorkQueue.InventoryWorkRequest;
import Business.WorkQueue.WorkRequest;
import Business.WorkQueue.trashCollectWorkRequest;
import java.awt.CardLayout;
import java.awt.Component;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

/**
 *
 * @author sumitjanawlekar
 */
public class ProcessTrashRequest extends javax.swing.JPanel {

    /**
     * Creates new form ProcessTrashRequest
     */
    
    private JPanel userProcessContainer;
    private EcoSystem business;
    private UserAccount userAccount;
    private QualityCheckOrganization qualityCheckOrganization;
    private Enterprise enterprise;
    private trashCollectWorkRequest request;
  
    
    public ProcessTrashRequest(JPanel userProcessContainer,UserAccount userAccount, trashCollectWorkRequest request,QualityCheckOrganization qualityCheckOrganization,Enterprise enterprise,EcoSystem business) {
        initComponents();
        this.userProcessContainer = userProcessContainer;
        this.request = request;
        this.qualityCheckOrganization = qualityCheckOrganization;
        this.business = business;
        this.enterprise = enterprise;
        this.userAccount = userAccount;
        
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        resultJTextField = new javax.swing.JTextField();
        submitJButton = new javax.swing.JButton();
        jLabel2 = new javax.swing.JLabel();
        backJButton = new javax.swing.JButton();

        setBackground(new java.awt.Color(255, 255, 255));
        setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jLabel1.setFont(new java.awt.Font("Times New Roman", 0, 24)); // NOI18N
        jLabel1.setText("Result");
        add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(57, 123, -1, -1));
        add(resultJTextField, new org.netbeans.lib.awtextra.AbsoluteConstraints(373, 126, 88, -1));

        submitJButton.setBackground(new java.awt.Color(255, 153, 0));
        submitJButton.setForeground(new java.awt.Color(255, 255, 255));
        submitJButton.setText("Submit Result");
        submitJButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                submitJButtonActionPerformed(evt);
            }
        });
        add(submitJButton, new org.netbeans.lib.awtextra.AbsoluteConstraints(373, 225, -1, -1));

        jLabel2.setFont(new java.awt.Font("Times New Roman", 0, 24)); // NOI18N
        jLabel2.setText("Process Trash Request");
        add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(163, 42, -1, -1));

        backJButton.setBackground(new java.awt.Color(255, 153, 0));
        backJButton.setFont(new java.awt.Font("Times New Roman", 0, 16)); // NOI18N
        backJButton.setForeground(new java.awt.Color(255, 255, 255));
        backJButton.setText("<<Back");
        backJButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                backJButtonActionPerformed(evt);
            }
        });
        add(backJButton, new org.netbeans.lib.awtextra.AbsoluteConstraints(90, 240, -1, -1));
    }// </editor-fold>//GEN-END:initComponents

    private void submitJButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_submitJButtonActionPerformed
       if(resultJTextField.getText().isEmpty() ){
            
            JOptionPane.showMessageDialog(null, "Fields Cannot be Empty");
        }
       else if(Integer.parseInt(resultJTextField.getText()) <= 0){

           JOptionPane.showMessageDialog(null, "Invalid Input");
           return;
       }
      try{
           //Double.parseDouble(fctxt.getText());
          Integer.parseInt(resultJTextField.getText());
      }catch(NumberFormatException e){
           JOptionPane.showMessageDialog(null, "Weight Should be Numeric value");
           return;
      }
        request.setQuantityFinalized(resultJTextField.getText());
        request.setStatus("Completed");
        if(request.getTrashType().equalsIgnoreCase("Plastic")){
            double plastic = 0.5;
            request.setRewards((int) (Double.parseDouble(request.getQuantityFinalized())*plastic));
        }
        else if(request.getTrashType().equalsIgnoreCase("Paper")){
            double plastic = 0.3;
            request.setRewards((int) (Double.parseDouble(request.getQuantityFinalized())*plastic));
        }
         else if(request.getTrashType().equalsIgnoreCase("Metal")){
            double plastic = 0.2;
            request.setRewards((int) (Double.parseDouble(request.getQuantityFinalized())*plastic));
        }
         else{
             double plastic = 0.8;
            request.setRewards((int) (Double.parseDouble(request.getQuantityFinalized())*plastic));
         }
        InventoryWorkRequest iRequest = new InventoryWorkRequest();
        iRequest.setTrashType(request.getTrashType());
        iRequest.setQuantity(Integer.parseInt(request.getQuantityFinalized()));
        
        
        
           Organization org = null;
            for (Organization organization : enterprise.getOrganizationDirectory().getOrganizationList()){
                if (organization instanceof InventoryManagementOrganization){
                    org = organization;
                    break;
                }
            }
            if (org!=null){
                org.getWorkQueue().getWorkRequestList().add(iRequest);
               
            
            }
            JOptionPane.showMessageDialog(null, "Successfull");
            resultJTextField.setText("");
    }//GEN-LAST:event_submitJButtonActionPerformed

    private void backJButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_backJButtonActionPerformed

        userProcessContainer.remove(this);
        Component[] componentArray = userProcessContainer.getComponents();
        Component component = componentArray[componentArray.length - 1];
        qualityCheckWorkArea dwjp = (qualityCheckWorkArea) component;
        dwjp.populateTable();
        CardLayout layout = (CardLayout)userProcessContainer.getLayout();
        layout.previous(userProcessContainer);
    }//GEN-LAST:event_backJButtonActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton backJButton;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JTextField resultJTextField;
    private javax.swing.JButton submitJButton;
    // End of variables declaration//GEN-END:variables
}
