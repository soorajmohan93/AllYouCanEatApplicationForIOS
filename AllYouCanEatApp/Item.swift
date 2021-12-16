//
//  Item.swift
//  AllYouCanEatApp
//
//  Created by Sooraj Mohan on 2021-12-06.
//

import Foundation


class Item: NSObject, NSCoding{
    private (set) var itemName: String
    private (set) var itemDescription: String
    private (set) var price: Float!
//    private (set) var quantity: Int!
    
    
    //    encode method to map each paramter to the archiving object
        func encode(with coder: NSCoder) {
            coder.encode(itemName, forKey: "itemName")
//            coder.encode(quantity, forKey: "itemQuantity")
            coder.encode(price, forKey: "itemPrice")
            coder.encode(itemDescription, forKey: "itemDescription");
        }
        
    //      decoding object from archiving
        required init?(coder: NSCoder) {
            itemName = coder.decodeObject(forKey: "itemName") as! String
//            quantity = coder.decodeObject(forKey: "itemQuantity") as? Int
            price = coder.decodeObject(forKey: "itemPrice") as? Float
            itemDescription = coder.decodeObject(forKey: "itemDescription") as! String
        }
    
    
    
    init(itemName: String, itemDescription: String, price: Float){
        self.itemName = itemName
        self.itemDescription = itemDescription
        self.price = price
    }
    
    func setName( itemName: String)
    {
        self.itemName = itemName
    }
    
    func setDescription( itemDescription: String)
    {
        self.itemDescription = itemDescription
    }
    
    func setPrice( price: Float)
    {
        self.price = price
    }
    
//    func setQuantity( quantity: Int)
//    {
//        self.quantity = quantity
//    }
    
    
    
    
}
