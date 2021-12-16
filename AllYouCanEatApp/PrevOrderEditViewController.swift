//
//  PrevOrderEditViewController.swift
//  AllYouCanEatApp
//
//  Created by Sooraj Mohan on 2021-12-16.
//

import UIKit

class PrevOrderEditViewController: UIViewController {
    
    //View controller for Edit order Item. Quantity can be changed for order items here
    var order: PrevOrder!
    var orderList = PrevOrderList()
    var section: Int!
    
    
    @IBOutlet weak var labelItemName: UILabel!
    
    
    @IBOutlet weak var textViewQuantity: UITextField!
    
    
    @IBOutlet weak var totalPriceText: UILabel!
    
    
    @IBAction func reduceQty(_ sender: Any) {
        var quantity:Int? = Int(textViewQuantity.text!)
        if (quantity! > 0)
        {
            quantity = quantity! - 1
        }
        textViewQuantity.text = String(quantity!)
        
        let totalPrice = Float(quantity!) * order.unitPrice
        totalPriceText.text = "Total Price: C$ " + totalPrice.description
        
        totalPriceText.center.x = view.center.x
        totalPriceText.center.x -= view.bounds.width
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            self.totalPriceText.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    @IBAction func increaseQty(_ sender: Any) {
        var quantity:Int? = Int(textViewQuantity.text!)
        quantity = quantity! + 1
        textViewQuantity.text = String(quantity!)
        
        let totalPrice = Float(quantity!) * order.unitPrice
        totalPriceText.text = "Total Price: C$ " + totalPrice.description
        
        totalPriceText.center.x = view.center.x
        totalPriceText.center.x -= view.bounds.width
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            self.totalPriceText.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        
    }
    @IBAction func updateOrder(_ sender: Any) {
        /*order quantity is updated when update button is clicked. if all order items are removed from order,
         the section is removed*/
        order.setQuantity(quantity: Int(textViewQuantity.text!)!)
        orderList.changeQuantityFromName(order: order, section: section)
        orderList.deleteSectionIfNeeded(section: section)
        orderList.saveList()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        labelItemName.text = order.itemName + " (C$ " + order.unitPrice.description + " )"
        
        labelItemName.center.x = view.center.x
        labelItemName.center.x -= view.bounds.width
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            self.labelItemName.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        textViewQuantity.text = order.quantity.description
        
        let totalPrice = Float(order.quantity!) * order.unitPrice
        totalPriceText.text = "Total Price: C$ " + totalPrice.description
        
        totalPriceText.center.x = view.center.x
        totalPriceText.center.x -= view.bounds.width
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            self.totalPriceText.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "backToPbackToPrevOrder")
        {
            let dest = segue.destination as! PrevOrderTableViewController
            
                dest.prevOrder = orderList
        }
        
            
    }
    

}
