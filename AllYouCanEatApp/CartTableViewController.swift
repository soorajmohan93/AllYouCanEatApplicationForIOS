//
//  CartTableViewController.swift
//  AllYouCanEatApp
//
//  Created by Sooraj Mohan on 2021-12-15.
//

import UIKit

class CartTableViewController: UITableViewController {

   //Table view controller for cart. User can review order and delete order if needed and also place the order

    var orderList: OrderList!
    var prevOrderList = PrevOrderList()

    
    @IBOutlet weak var placeButtonOrderText: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //total order value is displayed on the button
        var totalOrderPrice:Float = 0.0
        for order in orderList.orderList {
            totalOrderPrice += Float(order.quantity!) * order.unitPrice
        }
        placeButtonOrderText.setTitle("Place Order (C$" + totalOrderPrice.description + ")", for: .normal)
    }
//
//    // MARK: - Table view data source
//
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
//
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return orderList.orderList.count
    }
//
    @IBAction func placeOrder(_ sender: Any) {
        let sectionForPrevOrder = prevOrderList.orderList.count
//        if (sectionForPrevOrder > 1)
//        {
//            sectionForPrevOrder = sectionForPrevOrder - 1
//        }
        
        if(!orderList.orderList.isEmpty)
        {
            prevOrderList.orderList.append([])
            //If the order is not empty then a new section is created in PrevOrderList object
            //Each order item is picked and added into the new section
            for order in orderList.orderList {
                let prevOrder =  PrevOrder(itemName: order.itemName)
                prevOrder.setUnitPrice(unitPrice: order.unitPrice)
                prevOrder.setQuantity(quantity: order.quantity)
                prevOrderList.addOrder(prevOrder: prevOrder, section: sectionForPrevOrder)
            }
            prevOrderList.saveList()
            
            //Once order is created, all the items in OrderList object is cleared for a fresh order
            orderList.deleteAll()
            orderList.saveList()
        }
    }
    //
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "items", for: indexPath)

        let order = orderList.orderList[indexPath.row]

        cell.textLabel?.numberOfLines = 3
        let totalPrice = Float(order.quantity) * order.unitPrice

        cell.textLabel!.text = order.itemName + " (C$" + totalPrice.description + ")"
        cell.detailTextLabel!.text = "Quantity Selected: " + order.quantity.description


        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            orderList.deleteOrder(indexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
            orderList.saveList()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        tableView.reloadData()
        viewWillAppear(true)
    }
//
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */

}
