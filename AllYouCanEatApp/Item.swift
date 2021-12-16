//
//  Item.swift
//  AllYouCanEatApp
//
//  Created by Sooraj Mohan on 2021-12-06.
//

import Foundation

//Class for all available item
class Item {
    var itemName: String
    var itemDescription: String
    var price: Float

    
    init(itemName: String, itemDescription: String, price: Float){
        self.itemName = itemName
        self.itemDescription = itemDescription
        self.price = price
    }

}
