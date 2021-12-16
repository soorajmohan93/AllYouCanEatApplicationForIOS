//
//  AddOrderItemViewController.swift
//  AllYouCanEatApp
//
//  Created by Sooraj Mohan on 2021-12-06.
//

import UIKit

class AddOrderItemViewController: UIViewController {

    var item: Item!
//    var itemList: ItemList!
    var orderList: OrderList!
    
    
    @IBOutlet weak var labelItemName: UILabel!
    
    @IBOutlet weak var labelItemDescription: UILabel!
    
    @IBOutlet weak var totalPriceText: UILabel!
    @IBAction func reduceQty(_ sender: Any) {
        
        var quantity:Int? = Int(textViewQuantity.text!)
        if (quantity! > 0)
        {
            quantity = quantity! - 1
        }
        textViewQuantity.text = String(quantity!)
        
        let totalPrice = Float(quantity!) * item.price
        totalPriceText.text = "Total Price: C$ " + totalPrice.description
        
    }
    
    @IBAction func increaseQty(_ sender: Any) {
        var quantity:Int? = Int(textViewQuantity.text!)
        quantity = quantity! + 1
        textViewQuantity.text = String(quantity!)
        
        let totalPrice = Float(quantity!) * item.price
        totalPriceText.text = "Total Price: C$ " + totalPrice.description
    }
    
    @IBOutlet weak var textViewQuantity: UITextField!
    
    @IBAction func addItemOrder(_ sender: Any) {
        
//        item.setQuantity(quantity: Int(textViewQuantity.text!)!)
//        itemList.changeQuantityFromName(itemName: item.itemName, toQuantity: item.quantity)
        let order = Order(itemName: item.itemName)
        order.setUnitPrice(unitPrice: item.price)
        order.setQuantity(quantity: Int(textViewQuantity.text!)!)
        orderList.changeQuantityFromName(order: order)
        orderList.saveList()
        
//        itemList.saveList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        labelItemName.text = item.itemName + " (C$ " + item.price.description + " )"
        labelItemDescription.attributedText = NSAttributedString(string: item.itemDescription)
//        if (item.quantity != nil)
//        {
//            textViewQuantity.text = item.quantity.description
//        }
//        else
//        {
//            textViewQuantity.text = String("0")
//        }
        
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
