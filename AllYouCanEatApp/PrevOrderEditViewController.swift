//
//  PrevOrderEditViewController.swift
//  AllYouCanEatApp
//
//  Created by Sooraj Mohan on 2021-12-16.
//

import UIKit

class PrevOrderEditViewController: UIViewController {
    
    
    var order: PrevOrder!
    var orderList: PrevOrderList!
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
    }
    
    @IBAction func increaseQty(_ sender: Any) {
        var quantity:Int? = Int(textViewQuantity.text!)
        quantity = quantity! + 1
        textViewQuantity.text = String(quantity!)
        
        let totalPrice = Float(quantity!) * order.unitPrice
        totalPriceText.text = "Total Price: C$ " + totalPrice.description
    }
    
    
    @IBAction func updateOrder(_ sender: Any) {
        
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
        textViewQuantity.text = order.quantity.description
        
        let totalPrice = Float(order.quantity!) * order.unitPrice
        totalPriceText.text = "Total Price: C$ " + totalPrice.description
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
