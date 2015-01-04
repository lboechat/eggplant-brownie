//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by Luciano de Oliveira Boechat on 28/12/14.
//  Copyright (c) 2014 Alura. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddAMealDelegate {

    var meals = [Meal(name: "Eggplant brownie",happiness: 5), Meal(name: "Zuccini Muffin", happiness: 3)]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let meal = meals [row]
        let longPress = UILongPressGestureRecognizer(target:self, action: Selector("showDetails:"))
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Default,reuseIdentifier: nil)
        cell.textLabel?.text = meal.name
        
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
    
    
    
    func showDetails(recognizer:UILongPressGestureRecognizer) {
        if recognizer.state == UIGestureRecognizerState.Began {
            let cell = recognizer.view as UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            if indexPath == nil {
                return
            }
            let row = indexPath!.row
            let meal = meals[row]
            
            RemoveMealController(controller: self).show(meal, { action in self.meals.removeAtIndex(row)
                self.tableView.reloadData() } )
            
            println("Long press on \(meal.name) \(meal.happiness)")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "addMeal" {
            let view = segue.destinationViewController as ViewController
            view.delegate = self
        }
    }
    
    func add(meal: Meal) {
        meals.append(meal)
        tableView.reloadData()
    }

}
