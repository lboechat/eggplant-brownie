//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by Luciano de Oliveira Boechat on 02/01/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import UIKit

protocol AddAnItemDelegate {
    func addNew(item:Item)
}

class NewItemViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var caloriesField: UITextField!
    
    let delegate:AddAnItemDelegate?
    
    init(delegate:AddAnItemDelegate) {
        self.delegate = delegate
        super.init(nibName:"NewItemViewController",bundle:nil)
    }
    
    required init (coder aDecoder:NSCoder) {
        super.init(coder:aDecoder)
    }
    
    @IBAction func addNewItem() {
        if nameField == nil || caloriesField == nil {
            return
        }
        let name = nameField!.text
        if caloriesField == nil {
            return
        }
        let calories = NSString(string: caloriesField!.text).doubleValue
        let item = Item(name: name, calories: calories)
        
        if delegate == nil {
            return
        }
        
        delegate!.addNew(item)
        
        if let navigation = navigationController {
            navigation.popViewControllerAnimated(true)
        }
        
    }
    
}
