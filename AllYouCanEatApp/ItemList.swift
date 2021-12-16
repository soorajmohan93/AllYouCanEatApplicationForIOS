//
//  ItemList.swift
//  AllYouCanEatApp
//
//  Created by Sooraj Mohan on 2021-12-06.
//

import Foundation


class ItemList{
    
    let itemURL: URL = {
       let documentDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
       var documentDirectory = documentDirectories.first!
       return documentDirectory.appendingPathComponent("itemsfile1.archive")
    }()
    
    
    var list = [Item]()
 
    
    init(){
        //Extracting data using Unarchiver
        do{
            let data = try Data(contentsOf: itemURL)
            list = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [Item]
        }
        catch let error{
            print(error.localizedDescription)
        }
        if(list.isEmpty)
        {
            createEntries()
            saveList()
        }
    }
    
    func createEntries()
    {
        list.append(Item(itemName: "English Breakfast", itemDescription: "English breakfast consists of fried eggs, sausages, back bacon, tomatoes, mushrooms, fried bread and often a slice of white or black pudding.", price: 10.00))
        list.append(Item(itemName: "Zesty Lemon Dip", itemDescription: "Creamy and lemony, this dip adds a fresh note to your dishes, perfect for the summer season!", price: 9.00))
        list.append(Item(itemName: "Breakfast Granola Cup", itemDescription: "Enjoy these delicious granola cups any time of day. They pair up really well with yogurt and fruit of all kinds. With so many possibilities, you’ll never fall into the “same old, same old” rut!", price: 8.00))
        list.append(Item(itemName: "Healthy porridge bowl", itemDescription: "Start your day right with this filling bowl of oats, berries, banana and seeds. It's healthy and packed with nutrients to fuel body and mind", price: 11.25))
        list.append(Item(itemName: "Curried broccoli & boiled eggs on toast", itemDescription: "Eating eggs for breakfast will not only help keep you fuller for longer, they are a great source of protein and vitamin A which helps improve skin quality", price: 11.75))
        list.append(Item(itemName: "Homemade muesli with oats, dates & berries", itemDescription: "Packed with oats, pecans, seeds, dates, puffed wheat and berries, this delicious breakfast muesli will help you to start your day the right way", price: 15.50))
    }
    
    func saveList(){
        do{
            //saving data to the URL using archiver
            let data = try NSKeyedArchiver.archivedData(withRootObject: list, requiringSecureCoding: false)
            try data.write(to: itemURL)
        } catch let error{
            fatalError(error.localizedDescription)
        }
    }
    
    func deleteItem(indexPath: IndexPath){
        list.remove(at: indexPath.row)
    }
    
    func addItem(item: Item){
        list.append(item)
    }
    
//    func changeQuantityFromName(itemName: String, toQuantity quantity: Int){
//
//        guard let foundIndex = list.firstIndex(where: { $0.itemName == itemName }) else { return }
//
//        let itemToChange = list[foundIndex]
//
//        itemToChange.setQuantity(quantity: quantity)
//    }
    
//    //methods for manipulating the table view - to match data in model with view
//    //delete row from table view
//    func deleteMovie (indexPath: IndexPath){
//        list[indexPath.section].remove(at: indexPath.row)
//    }
//
//    //add row to table view
//    @discardableResult func addMovie (title: String) -> Movie{
//        let movie = Movie(title: title)
//        list[1].append(movie)
//        return movie
//    }
//
//    //moving rows between table view
//    func moveMovie(fromIndexPath: IndexPath, toIndexPath: IndexPath){
//        let tmpMovie = list[fromIndexPath.section][fromIndexPath.row]
//        list[fromIndexPath.section].remove(at: fromIndexPath.row)
//        list[toIndexPath.section].insert(tmpMovie, at: toIndexPath.row)
//    }
//
//    func moveToComplete(fromIndexPath: IndexPath)
//    {
//        let tmpMovie = list[fromIndexPath.section][fromIndexPath.row]
//        list[fromIndexPath.section].remove(at: fromIndexPath.row)
//        list[2].append(tmpMovie)
//    }
//
//    func moveToRecommended(fromIndexPath: IndexPath)
//    {
//        let tmpMovie = list[fromIndexPath.section][fromIndexPath.row]
//        list[fromIndexPath.section].remove(at: fromIndexPath.row)
//        list[1].append(tmpMovie)
//    }
}
