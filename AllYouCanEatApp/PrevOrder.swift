//
//  PrevOrder.swift
//  AllYouCanEatApp
//
//  Created by Sooraj Mohan on 2021-12-15.
//

import Foundation


class PrevOrder: NSObject, NSCoding{
    private (set) var itemName: String
    private (set) var quantity: Int!
    private (set) var unitPrice: Float!
    private (set) var orderId: Int!
    
    
    
//    encode method to map each paramter to the archiving object
    func encode(with coder: NSCoder) {
        coder.encode(itemName, forKey: "itemName")
        coder.encode(quantity, forKey: "quantity")
        coder.encode(unitPrice, forKey: "unitPrice")
        coder.encode(orderId, forKey: "orderId" )
    }
    
    //    //decoding object from archiving
    required init?(coder: NSCoder) {
        itemName = coder.decodeObject(forKey: "itemName") as! String
        quantity = coder.decodeObject(forKey: "quantity") as? Int
        unitPrice = coder.decodeObject(forKey: "unitPrice") as? Float
        orderId = coder.decodeObject(forKey: "orderId") as? Int
    }
    
    init(itemName: String){
        self.itemName = itemName
    }
    
    func setItemName(itemName: String)
    {
        self.itemName = itemName
    }
    
    func setQuantity(quantity: Int) {
        self.quantity = quantity
    }
    
    func setUnitPrice(unitPrice: Float)
    {
        self.unitPrice = unitPrice
    }
    
    func setOrderId(orderId: Int)
    {
        self.orderId = orderId
    }
    
}
