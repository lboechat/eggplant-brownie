//
//  RemoveMealController.swift
//  eggplant-brownie
//
//  Created by Luciano de Oliveira Boechat on 04/01/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import Foundation
import UIKit

class RemoveMealController {
    let controller:UIViewController
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    func show(meal:Meal, handler:(UIAlertAction!) -> Void) {
        
        let details = UIAlertController(title:meal.name, message: meal.details(), preferredStyle: UIAlertControllerStyle.Alert)
        let remove = UIAlertAction(title:"Remove",style: UIAlertActionStyle.Destructive,handler: handler)
        let cancel = UIAlertAction(title:"Cancel", style: UIAlertActionStyle.Cancel,handler:nil)
        
        details.addAction(remove)
        details.addAction(cancel)
        
        controller.presentViewController(details,animated:true,completion:nil)
    }
    
}
