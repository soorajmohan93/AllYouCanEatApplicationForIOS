//
//  AddItemTableViewController.swift
//  AllYouCanEatApp
//
//  Created by Sooraj Mohan on 2021-12-06.
//

import UIKit

class AddItemTableViewController: UITableViewController {

    //This view controller is for New Order Table View Controller - It shows all available items
    var itemList = ItemList()
    var orderList = OrderList()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemList.list.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemList", for: indexPath)
        

        let item = itemList.list[indexPath.row]
        
        cell.textLabel?.numberOfLines = 3
        cell.detailTextLabel?.numberOfLines = 4

        //If item quantity is added, then the title includes the quantity as well
        var textForTitle: String!
        if let foundIndex = orderList.orderList.firstIndex(where: { $0.itemName == item.itemName })
        {
            let itemInOrder = orderList.orderList[foundIndex]

            if (itemInOrder.quantity != nil && itemInOrder.quantity != 0)
                    {
                        textForTitle = "\nQuantity Selected: " + itemInOrder.quantity.description
                    }
        }
        
        if (textForTitle != nil)
        {
            cell.textLabel!.text = item.itemName + " (C$" + item.price.description + ")" + textForTitle
        }
        else
        {
            cell.textLabel!.text = item.itemName + " (C$" + item.price.description + ")"
        }
        
        cell.detailTextLabel!.text = item.itemDescription
        return cell
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
        //segue for table view item selection
        if (segue.identifier == "AddToCartView")
        {
            let dest = segue.destination as! AddOrderItemViewController
            if let indexPath = tableView.indexPathForSelectedRow{
                let item = itemList.list[indexPath.row]
                dest.item = item
                dest.orderList = orderList
            }
        }
        //segue for cart
        else if (segue.identifier == "cartTableView")
        {
            let dest = segue.destination as! CartTableViewController
            dest.orderList = orderList
            }
        }
}
    


