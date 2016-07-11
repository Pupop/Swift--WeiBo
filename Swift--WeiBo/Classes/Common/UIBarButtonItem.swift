//
//  UIBarButtonItem.swift
//  Swift--WeiBo
//
//  Created by YinMingpu on 16/7/6.
//  Copyright © 2016年 Mingpu. All rights reserved.
//

import Foundation
import UIKit

extension UIBarButtonItem{
    
    func customeBarButtonItem(imageName:String,target:AnyObject?,selector:Selector) -> UIBarButtonItem {
        
        let btn = UIButton(type: .Custom)
        btn.setBackgroundImage(UIImage(named: imageName), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: imageName+"_highlighted"), forState: .Highlighted)
        btn.frame = CGRectMake(0, 0, 40, 40)
        
        btn.addTarget(target, action: selector, forControlEvents: .TouchUpInside)
        
        return UIBarButtonItem(customView: btn)
        
    }
    
    
}