//
//  OrderList.swift
//  AllYouCanEatApp
//
//  Created by Sooraj Mohan on 2021-12-07.
//

import Foundation


class OrderList
{
    
//    declaring a URL here for archiving
    let orderURL: URL = {
       let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
       var documentDirectory = documentDirectories.first!
       return documentDirectory.appendingPathComponent("orderItems.archive")
    }()

    var orderList = [Order]()

    init(){
    //        //Extracting data using Unarchiver
        do{
            let data = try Data(contentsOf: orderURL)
            orderList = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [Order]
        }
        catch let error{
            print(error.localizedDescription)
        }
    }

    func saveList(){
        do{
            //saving data to the URL using archiver
            let data = try NSKeyedArchiver.archivedData(withRootObject: orderList, requiringSecureCoding: false)
            try data.write(to: orderURL)
        } catch let error{
            fatalError(error.localizedDescription)
        }
    }

    func deleteOrder(indexPath: IndexPath){
        orderList.remove(at: indexPath.row)
    }
    
    func deleteAll()
    {
        orderList.removeAll()
    }

    func addOrder(order: Order){
        orderList.append(order)
    }

    func changeQuantityFromName(order: Order){

        if let foundIndex = orderList.firstIndex(where: { $0.itemName == order.itemName })
        {
            let itemToChange = orderList[foundIndex]
            if (order.quantity > 0)
            {
                itemToChange.setQuantity(quantity: order.quantity)
            }
            else
            {
                orderList.remove(at: foundIndex)
            }
        }
        else
        {
            addOrder(order: order)
        }

        
    }

}
