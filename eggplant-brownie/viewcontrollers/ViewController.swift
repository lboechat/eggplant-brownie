//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Luciano de Oliveira Boechat on 25/12/14.
//  Copyright (c) 2014 Alura. All rights reserved.
//

import UIKit

protocol AddAMealDelegate {
    func add(meal: Meal)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddAnItemDelegate {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var happinessField: UITextField!
    var delegate:AddAMealDelegate?
    
    var selected = Array<Item>()
    
    var items = [Item(name:"bla bla", calories: 1), Item(name:"blu blu", calories: 2), Item(name:"bsdfsdfsdf", calories: 5), Item(name:"blasdfsdf bla", calories: 100), Item(name:"dfdfdfdfdfd", calories: 10), Item(name:"etertrwtwert", calories: 100)]
    
    @IBOutlet var tableView: UITableView?
    
    func addNew(item:Item) {
        items.append(item)
        if let table = tableView {
            table.reloadData()
        } else {
            Alert(controller:self).show(message:"Unexpected error.")
        }
    }
    
    override func viewDidLoad() {
        let newItemButton = UIBarButtonItem(title: "New Item", style: UIBarButtonItemStyle.Plain , target: self, action: Selector("showNewItem"))
        navigationItem.rightBarButtonItem = newItemButton
    }
    

    func tableView(tableView: UITableView,numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        var cell = UITableViewCell(style: UITableViewCellStyle.Default,reuseIdentifier: nil)
        cell.textLabel?.text = item.name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if cell == nil {
            return
        }
        if (cell!.accessoryType == UITableViewCellAccessoryType.None) {
            cell!.accessoryType = UITableViewCellAccessoryType.Checkmark
            selected.append(items[indexPath.row])
        } else {
            cell!.accessoryType = UITableViewCellAccessoryType.None
            if let position = find(selected,items[indexPath.row]) {
                selected.removeAtIndex(position)
            }
        }
        
    }
    
    @IBAction func showNewItem() {
        let newItem = NewItemViewController(delegate:self)
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        } else {
            Alert(controller:self).show()
        }
        
        
    }
    
    func getMealFromForm() -> Meal? {
        
        if nameField == nil || happinessField == nil {
            return nil
        }
        let name = nameField.text
        let happiness = happinessField.text.toInt()
        if happiness == nil {
            return nil
        }
        let meal = Meal(name:name, happiness:happiness!)
        meal.items = selected
        
        println("eaten: \(meal.name) \(meal.happiness) \(meal.items)")
                
        return meal
    }
    
    @IBAction func add() {
       
        if let meal = getMealFromForm() {
            if let meals = delegate  {
                meals.add(meal)
                
                if let navigation = self.navigationController {
                    navigation.popViewControllerAnimated(true)
                } else {
                    Alert(controller: self).show(message: "Unexpected error, but the meal was added.")
                }
                return
            }
        }
        Alert(controller: self).show()
    }

}

