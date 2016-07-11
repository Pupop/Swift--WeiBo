//
//  MenuViewController.swift
//  Swift--WeiBo
//
//  Created by YinMingpu on 16/7/6.
//  Copyright © 2016年 Mingpu. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.cyanColor()
        
        
        self.layoutUI()
        
        
    }

    //MARK:布局试图
    func layoutUI() {
        
        let imageView = UIImageView()
        
        
        var image = UIImage(named: "popover_background")
        //上下拉伸,左右为0
        image = image?.resizableImageWithCapInsets(UIEdgeInsetsMake(image!.size.height/2, 0, image!.size.height/2, 0), resizingMode:.Stretch )
        
        imageView.image = image

        self.view.addSubview(imageView)
        imageView.snp_makeConstraints{ (make)in
            
            make.edges.equalTo(self.view).inset(0)
        }
        
        
        //tableView
        let tableView  = UITableView(frame: CGRectMake(0, 0, 0, 0))
        
        self.view.addSubview(tableView)
        
        tableView.snp_makeConstraints{ (make)in
            
            make.edges.equalTo(self.view).inset(20)
        }
        
        
        
    }
    
    

    
    

}
