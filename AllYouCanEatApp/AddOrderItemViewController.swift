//
//  AddOrderItemViewController.swift
//  AllYouCanEatApp
//
//  Created by Sooraj Mohan on 2021-12-06.
//

import UIKit

class AddOrderItemViewController: UIViewController {

    //This is add to cart view controller, user can add or change quantity and add them to cart
    var item: Item!
    var orderList: OrderList!
    
    
    @IBOutlet weak var labelItemName: UILabel!
    
    @IBOutlet weak var labelItemDescription: UILabel!
    
    @IBOutlet weak var totalPriceText: UILabel!
    @IBAction func reduceQty(_ sender: Any) {
        //Button to reduce quantity
        var quantity:Int? = Int(textViewQuantity.text!)
        if (quantity! > 0)
        {
            quantity = quantity! - 1
        }
        textViewQuantity.text = String(quantity!)
        
        let totalPrice = Float(quantity!) * item.price
        totalPriceText.text = "Total Price: C$ " + totalPrice.description
        
        totalPriceText.center.x = view.center.x
        totalPriceText.center.x -= view.bounds.width
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            self.totalPriceText.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        
    }
    
    @IBAction func increaseQty(_ sender: Any) {
        //Button to increase quantity
        var quantity:Int? = Int(textViewQuantity.text!)
        quantity = quantity! + 1
        textViewQuantity.text = String(quantity!)
        
        let totalPrice = Float(quantity!) * item.price
        totalPriceText.text = "Total Price: C$ " + totalPrice.description
        
        totalPriceText.center.x = view.center.x
        totalPriceText.center.x -= view.bounds.width
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            self.totalPriceText.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        
    }
    
    @IBOutlet weak var textViewQuantity: UITextField!
    
    @IBAction func addItemOrder(_ sender: Any) {
        //add item button
        let order = Order(itemName: item.itemName)
        order.setUnitPrice(unitPrice: item.price)
        order.setQuantity(quantity: Int(textViewQuantity.text!)!)
//        item is added when the quanity is changed first time, then when quantity changes, the existing item is updated
        orderList.changeQuantityFromName(order: order)
        orderList.saveList()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        labelItemName.attributedText = NSAttributedString(string: item.itemName + " (C$ " + item.price.description + " )")
        labelItemName.center.x = view.center.x
        labelItemName.center.x -= view.bounds.width
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            self.labelItemName.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        labelItemDescription.attributedText = NSAttributedString(string: item.itemDescription)
        
        labelItemDescription.center.x = view.center.x
        labelItemDescription.center.x -= view.bounds.width
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            self.labelItemDescription.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)

        //If quantity was added before then it is populated in the quantity field
        if let foundIndex = orderList.orderList.firstIndex(where: { $0.itemName == item.itemName })
        {
            let itemInOrder = orderList.orderList[foundIndex]

            if (itemInOrder.quantity != nil && itemInOrder.quantity != 0)
                    {
                        textViewQuantity.text = itemInOrder.quantity.description
                    }
                    else
                    {
                        textViewQuantity.text = String("0")
                    }
        }
        else
        {
            textViewQuantity.text = String("0")
        }
        
        let totalPrice = Float(textViewQuantity.text!)! * item.price
        totalPriceText.text = "Total Price: C$ " + totalPrice.description
        
        totalPriceText.center.x = view.center.x
        totalPriceText.center.x -= view.bounds.width
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            self.totalPriceText.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
