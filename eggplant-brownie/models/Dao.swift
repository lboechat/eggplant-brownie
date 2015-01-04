//
//  Dao.swift
//  eggplant-brownie
//
//  Created by Luciano de Oliveira Boechat on 04/01/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import Foundation

class Dao {
    let mealsArchive: String
    let itemsArchive: String
    
    init() {
        let userDir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let dir = userDir[0] as String
        mealsArchive = "\(dir)/eggplant-brownie-meals"
        itemsArchive = "\(dir)/eggplant-brownie-items"
    }
    
    func save(meals: Array<Meal>) {
        NSKeyedArchiver.archiveRootObject(meals, toFile: mealsArchive)
        
    }
    
    func save(items: Array<Item>) {
        NSKeyedArchiver.archiveRootObject(items, toFile: itemsArchive)
        
    }
    
    func loadMeals() -> Array<Meal> {
        if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(mealsArchive) {
            return loaded as Array
        } else {
            return Array<Meal>()
        }
    }
    
    func loadItems() -> Array<Item> {
        if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(itemsArchive) {
            return loaded as Array
        } else {
            return Array<Item>()
        }
    }
}