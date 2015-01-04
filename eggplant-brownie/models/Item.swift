//
//  Item.swift
//  eggplant-brownie
//
//  Created by Luciano de Oliveira Boechat on 27/12/14.
//  Copyright (c) 2014 Alura. All rights reserved.
//

import Foundation

class Item: Equatable {
    let name:String
    let calories:Double
    
    init(name:String, calories:Double){
        self.name = name
        self.calories = calories
    }
    
}

func ==(first:Item, second:Item) -> Bool {
    return first.name == second.name && first.calories == second.calories
}
