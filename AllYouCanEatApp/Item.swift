//
//  Item.swift
//  AllYouCanEatApp
//
//  Created by Sooraj Mohan on 2021-12-06.
//

import Foundation


class Item {
    var itemName: String
    var itemDescription: String
    var price: Float!
//    private (set) var quantity: Int!
    
    

    
    
    
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
