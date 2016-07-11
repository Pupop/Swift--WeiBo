//
//  BaseTableViewController.swift
//  Swift--WeiBo
//
//  Created by YinMingpu on 16/7/5.
//  Copyright © 2016年 Mingpu. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {

    //当前用户是否登录
    var userLogin = true
    
    //没有登录的试图
    var noLoginView:NoLogin?
    
    override func loadView() {
        
        if userLogin == true {
            //调用父类的loadView加载控制器的试图
            super.loadView()
            
            
        }else{
            
            noLoginView = NoLogin()
            noLoginView!.backgroundColor = UIColor.yellowColor()
            self.view = noLoginView
            
            //登录注册
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .Plain, target: self, action: #selector(BaseTableViewController.clickLeft))
            
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .Plain, target: self, action: #selector(BaseTableViewController.clickRight))
            
        }
        
        
        
    }
    
    
     func clickLeft()  {
        
        print("注册")
        
    }
     func clickRight()  {
        
        print("登录")
        
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    
    
    
}
