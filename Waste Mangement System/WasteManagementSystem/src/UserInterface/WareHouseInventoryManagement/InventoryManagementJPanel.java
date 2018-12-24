/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserInterface.WareHouseInventoryManagement;

import Business.EcoSystem;
import Business.Employee.Employee;
import Business.Enterprise.Enterprise;
import Business.Network.Network;
import Business.Organization.Inventory;
import Business.Organization.InventoryManagementOrganization;
import Business.Organization.Organization;
import Business.UserAccount.UserAccount;
import Business.WorkQueue.InventoryWorkRequest;
import Business.WorkQueue.WorkRequest;
import java.awt.CardLayout;
import java.util.HashMap;
import javax.swing.JPanel;
import javax.swing.table.DefaultTableModel;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;

/**
 *
 * @author sumitjanawlekar
 */
public class InventoryManagementJPanel extends javax.swing.JPanel {

    /**
     * Creates new form InventoryManagementJPanel
     */
    private JPanel userProcessContainer;
    private UserAccount account;
    private InventoryManagementOrganization inventoryManagementOrganization;
    private Enterprise enterprise;
    private EcoSystem business;
    public InventoryManagementJPanel(JPanel userProcessContainer, UserAccount account, InventoryManagementOrganization organization, Enterprise enterprise, EcoSystem business) {
        initComponents();
        this.userProcessContainer = userProcessContainer;
        this.account = account;
        this.inventoryManagementOrganization = organization;
        this.enterprise = enterprise;
        this.business = business;
        populateInventory();
        populateTable();
    }
    public void populateInventory(){
       
        HashMap<String,Integer> mapInventory = new HashMap<>();
        int total  = 0;
        int temp = 0;

        for(WorkRequest request : inventoryManagementOrganization.getWorkQueue().getWorkRequestList()){
            if(((InventoryWorkRequest)request).getTrashType() != null){
                total += ((InventoryWorkRequest)request).getQuantity();
            }
            if(mapInventory.containsKey(((InventoryWorkRequest)request).getTrashType())){
                temp  = mapInventory.get(((InventoryWorkRequest)request).getTrashType());
                mapInventory.put(((InventoryWorkRequest)request).getTrashType(), temp + total);
            }
            else{
            mapInventory.put(((InventoryWorkRequest)request).getTrashType(),total);
            }
            total = 0;
        }
        inventoryManagementOrganization.getInventoryList().getInventoryDirectory().clear();
        for(String trash : mapInventory.keySet()){
            Inventory i = new Inventory();
            i.setTrashType(trash);
            i.setTotalQuantity(mapInventory.get(trash));
            inventoryManagementOrganization.getInventoryList().getInventoryDirectory().add(i);
        }
//        System.out.println("Trash   " + mapInventory.keySet() + "   Quantity    " +  mapInventory.values());
        
    }
    
    public void populateTable(){
        DefaultTableModel model = (DefaultTableModel)tblInventory.getModel();
        
        model.setRowCount(0);
        
        for(Inventory inventory : inventoryManagementOrganization.getInventoryList().getInventoryDirectory()){
            Object[] row = new Object[2];
            row[0] = inventory;
            row[1] = inventory.getTotalQuantity();

            model.addRow(row);
        }
    }
    
    public void piechar() {
       HashMap<String,Integer> map = new HashMap<>();
       float Plastic = 0;
       float Paper = 0;
       float Metal = 0;
       float total1 = 0;

       for (Network network : business.getNetworkList()) {
           for (Enterprise enterprise : network.getEnterpriseDirectory().getEnterpriseList()) {
               for (Organization org : enterprise.getOrganizationDirectory().getOrganizationList()) {
                   for (Employee emp : org.getEmployeeDirectory().getEmployeeList()) {

                           if (org instanceof  InventoryManagementOrganization) {

                               for(Inventory i :((InventoryManagementOrganization)org).getInventoryList().getInventoryDirectory() ){
                                           map.put(i.getTrashType(), i.getTotalQuantity() );
                                           total1 += i.getTotalQuantity();
                               }




                           }
                      }
               }
           }
       }


        System.out.println(map.keySet());
        System.out.println(map.values());
        System.out.println(total1);
         DefaultPieDataset pieDataset = new DefaultPieDataset();
        for(String intType : map.keySet()){

            pieDataset.setValue(intType, new Double((map.get(intType) / total1)*100));
        }




       JFreeChart chart = ChartFactory.createPieChart("Trash Types", pieDataset, true, true, true);
       PiePlot P = (PiePlot) chart.getPlot();
       ChartFrame frame = new ChartFrame("Trash Types", chart);
       frame.setVisible(true);
       frame.setSize(400, 300);
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
        tblInventory = new javax.swing.JTable();
        jLabel1 = new javax.swing.JLabel();
        btnAnalytics = new javax.swing.JButton();

        setBackground(new java.awt.Color(255, 255, 255));
        setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        tblInventory.setFont(new java.awt.Font("Times New Roman", 0, 18)); // NOI18N
        tblInventory.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Trash Type", "Quantity"
            }
        ));
        jScrollPane1.setViewportView(tblInventory);

        add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(105, 94, 375, 275));

        jLabel1.setFont(new java.awt.Font("Times New Roman", 0, 24)); // NOI18N
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("Inventory Work Area");
        add(jLabel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(15, 14, 544, -1));

        btnAnalytics.setBackground(new java.awt.Color(255, 153, 0));
        btnAnalytics.setForeground(new java.awt.Color(255, 255, 255));
        btnAnalytics.setText("View Analytics");
        btnAnalytics.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAnalyticsActionPerformed(evt);
            }
        });
        add(btnAnalytics, new org.netbeans.lib.awtextra.AbsoluteConstraints(199, 411, 209, -1));
    }// </editor-fold>//GEN-END:initComponents

    private void btnAnalyticsActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnAnalyticsActionPerformed
        // TODO add your handling code here:
        piechar();
        
    }//GEN-LAST:event_btnAnalyticsActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAnalytics;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable tblInventory;
    // End of variables declaration//GEN-END:variables
}
