//
//  Order.swift
//  AllYouCanEatApp
//
//  Created by Sooraj Mohan on 2021-12-06.
//

import Foundation


class Order: NSObject, NSCoding{
    private (set) var itemName: String
    private (set) var quantity: Int!
    private (set) var unitPrice: Float!
    
    
    
//    encode method to map each paramter to the archiving object
    func encode(with coder: NSCoder) {
        coder.encode(itemName, forKey: "itemName")
        coder.encode(quantity, forKey: "quantity")
        coder.encode(unitPrice, forKey: "unitPrice")
    }
    
    //    //decoding object from archiving
    required init?(coder: NSCoder) {
        itemName = coder.decodeObject(forKey: "itemName") as! String
        quantity = coder.decodeObject(forKey: "quantity") as? Int
        unitPrice = coder.decodeObject(forKey: "unitPrice") as? Float
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
}
