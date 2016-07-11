//
//  PoperPresentationController.swift
//  Swift--WeiBo
//
//  Created by YinMingpu on 16/7/6.
//  Copyright © 2016年 Mingpu. All rights reserved.
//

import UIKit

class PoperPresentationController: UIPresentationController {
    
    var poperFrame:CGRect?
    
    
    //试图将要展示的时候调用
    override func containerViewWillLayoutSubviews() {
        
        //遮罩
        
        let view = UIView()
        view.backgroundColor = UIColor.blackColor()
        view.alpha = 0.1
        view.frame = UIScreen.mainScreen().bounds
        //插入容器试图
        self.containerView?.insertSubview(view, atIndex: 0)
        
        //在遮罩上添加手势
        let tap = UITapGestureRecognizer(target: self, action: #selector(PoperPresentationController.clickMaskView))
        
        view.addGestureRecognizer(tap)
        
        //将展示的试图、在容器试图上面
        self.presentedView()?.frame = poperFrame!

        
    }
    
    
    func clickMaskView() {
        
        
        //找到弹出的控制器。dismiss
        self.presentedViewController.dismissViewControllerAnimated(true, completion: nil)
        
    }

}
