//
//  Alert.swift
//  eggplant-brownie
//
//  Created by Luciano de Oliveira Boechat on 03/01/15.
//  Copyright (c) 2015 Alura. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    let controller: UIViewController
    
    init(controller:UIViewController) {
        self.controller = controller
    }
    
    func show(message:String = "Unexpected error") {
        let details = UIAlertController(title: "Sorry",message: message,preferredStyle: UIAlertControllerStyle.Alert)
        let cancel = UIAlertAction(title:"Understood",style:UIAlertActionStyle.Cancel,handler: nil)
        
        details.addAction(cancel)
        
        controller.presentViewController(details,animated:true,completion:nil)
    }
    
}
