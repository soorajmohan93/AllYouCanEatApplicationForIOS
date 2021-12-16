//
//  PrevOrderList.swift
//  AllYouCanEatApp
//
//  Created by Sooraj Mohan on 2021-12-15.
//

import Foundation

class PrevOrderList
{
    
//    declaring a URL here for archiving
    let prevOrderURL: URL = {
       let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
       var documentDirectory = documentDirectories.first!
       return documentDirectory.appendingPathComponent("prevOrderItems.archive")
    }()

    var orderList = [[PrevOrder]]()

    init(){
    //        //Extracting data using Unarchiver
        do{
            let data = try Data(contentsOf: prevOrderURL)
            orderList = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [[PrevOrder]]
        }
        catch let error{
            print(error.localizedDescription)
        }
    }

    func saveList(){
        do{
            //saving data to the URL using archiver
            let data = try NSKeyedArchiver.archivedData(withRootObject: orderList, requiringSecureCoding: false)
            try data.write(to: prevOrderURL)
        } catch let error{
            fatalError(error.localizedDescription)
        }
    }

    func deleteOrder(indexPath: IndexPath){
        orderList.remove(at: indexPath.row)
    }

    func addOrder(prevOrder: PrevOrder, section: Int){
        orderList[section].append(prevOrder)
    }

    func changeQuantityFromName(order: PrevOrder, section: Int){

        if let foundIndex = orderList[section].firstIndex(where: { $0.itemName == order.itemName })
        {
            let itemToChange = orderList[foundIndex]
            if (order.quantity > 0)
            {
                itemToChange[section].setQuantity(quantity: order.quantity)
            }
            else
            {
                orderList.remove(at: foundIndex)
            }
        }
        else
        {
            addOrder(prevOrder: order, section: section)
        }

        
    }

}
