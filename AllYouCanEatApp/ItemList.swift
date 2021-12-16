//
//  ItemList.swift
//  AllYouCanEatApp
//
//  Created by Sooraj Mohan on 2021-12-06.
//

import Foundation


class ItemList{
    
    var list = [Item]()
 
    
    init(){
        
        list.append(Item(itemName: "English Breakfast", itemDescription: "English breakfast consists of fried eggs, sausages, back bacon, tomatoes, mushrooms, fried bread and often a slice of white or black pudding.", price: 10.00))
        list.append(Item(itemName: "Zesty Lemon Dip", itemDescription: "Creamy and lemony, this dip adds a fresh note to your dishes, perfect for the summer season!", price: 9.00))
        list.append(Item(itemName: "Breakfast Granola Cup", itemDescription: "Enjoy these delicious granola cups any time of day. They pair up really well with yogurt and fruit of all kinds. With so many possibilities, you’ll never fall into the “same old, same old” rut!", price: 8.00))
        list.append(Item(itemName: "Healthy porridge bowl", itemDescription: "Start your day right with this filling bowl of oats, berries, banana and seeds. It's healthy and packed with nutrients to fuel body and mind.", price: 11.25))
        list.append(Item(itemName: "Curried broccoli & boiled eggs on toast", itemDescription: "Eating eggs for breakfast will not only help keep you fuller for longer, they are a great source of protein and vitamin A which helps improve skin quality.", price: 11.75))
        list.append(Item(itemName: "Homemade muesli with oats, dates & berries", itemDescription: "Packed with oats, pecans, seeds, dates, puffed wheat and berries, this delicious breakfast muesli will help you to start your day the right way.", price: 15.50))
        list.append(Item(itemName: "Quick Salted Caramel Pie", itemDescription: "The filling of the Pie is sweetened condensed milk sprinkled lightly with sea salt and baked until thick and gooey, then chilled in a simple graham cracker crust.", price:9.25))
        list.append(Item(itemName: "Santa Maria-Style Barbecue", itemDescription: "Grilled beef that's served with beans, garlic bread, salad, macaroni salad, and chunky salsa.", price: 11.25))
        list.append(Item(itemName: "Dungeness Crab Cake", itemDescription: "Dungeness crabmeat with mayonnaise, red bell peppers, celery, onions, herbs, panko breadcrumbs, seasonings, and eggs, and then shaping the resulting mixture into round cakes.", price: 12.75))
        list.append(Item(itemName: "Amish Chicken", itemDescription: "Amish chicken is a traditional American poultry dish. It is made with a combination of chicken, flour, garlic powder, heavy cream, paprika, water, salt, and pepper.", price: 8.50))
        list.append(Item(itemName: "Navajo Tacos", itemDescription: "These tacos are made with Indian fry bread that's topped with a combination of ingredients such as ground beef, beans, shredded lettuce, cheddar cheese, sour cream, and tomatoes.", price: 5.50))
        list.append(Item(itemName: "Macaroni and Cheese", itemDescription: "Macaroni Pasta and Cheese mostly cheddar, with vegetables or meat.", price: 14.50))
        list.append(Item(itemName: "Croissant", itemDescription: "A puff pastry which will melt in your mouth with ingredients like butter, sugar, eggs, cream, and milk.", price: 11.50))
    }
}
