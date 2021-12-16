//
//  PrevOrderTableViewController.swift
//  AllYouCanEatApp
//
//  Created by Sooraj Mohan on 2021-12-16.
//

import UIKit

class PrevOrderTableViewController: UITableViewController {

    var prevOrder = PrevOrderList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return prevOrder.orderList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return prevOrder.orderList[section].count
    }

    @IBAction func deleteAllOrders(_ sender: Any) {
        
        prevOrder.deleteAll();
        prevOrder.saveList();
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prevOrder", for: indexPath)

        let order = prevOrder.orderList[indexPath.section][indexPath.row]
        
        let totalPrice = Float(order.quantity) * order.unitPrice
        cell.textLabel?.numberOfLines = 3
        cell.textLabel!.text = order.itemName + " (C$" + totalPrice.description + ")"
        cell.detailTextLabel!.text = "Quantity Selected: " + order.quantity.description

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Order Number:" + (section+1).description
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            prevOrder.deleteOrder(indexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
            prevOrder.deleteSectionIfNeeded(section: indexPath.section)
            prevOrder.saveList()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        tableView.reloadData()
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let dest = segue.destination as! PrevOrderEditViewController
        if let indexPath = tableView.indexPathForSelectedRow{
            let order = prevOrder.orderList[indexPath.section][indexPath.row]
            dest.order = order
            dest.orderList = prevOrder
            dest.section = indexPath.section
        }
    }
    

}
