//
//  HomeTableViewController.swift
//  swift新浪微博
//
//  Created by GG on 16/7/3.
//  Copyright © 2016年 GG. All rights reserved.
//

import UIKit

let kMenuViewShowORHide = "kMenuViewShowORHide"


class HomeTableViewController: BaseTableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.noLoginView?.setNoLoginViewIsHome(true, imageName: "visitordiscover_feed_image_house", text: "关注一些人 回这里看看有什么惊喜 莎娃迪卡思密达 奥尔卡公开")
        
            self.setNavigationBar()
        
        //监听菜单栏的消失与
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(HomeTableViewController.change), name: kMenuViewShowORHide, object: nil)
        
        }
    
    deinit{
        
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    func change() {
        
        let titleBtn = self.navigationItem.titleView as! TitleButton
        
        titleBtn.selected = !titleBtn.selected
        
    }
    
    //MARK:设置NavigationBar
        func setNavigationBar(){
        
        if userLogin == true {
            
            let btn = TitleButton(type: .Custom)
            btn.setTitle("尚小叶", forState: .Normal)
            btn.sizeToFit()
            btn.setTitleColor(UIColor.redColor(), forState: .Normal)
            self.navigationItem.titleView = btn
            btn.addTarget(self, action: #selector(HomeTableViewController.clickMidBtn(_:)), forControlEvents: .TouchUpInside)
            
            
            //设置登录后的两侧
            self.navigationItem.leftBarButtonItem = UIBarButtonItem().customeBarButtonItem("navigationbar_friendattention", target: self, selector: #selector(HomeTableViewController.clickLeftBtn))
            //
            self.navigationItem.rightBarButtonItem = UIBarButtonItem().customeBarButtonItem("navigationbar_pop", target: self, selector: #selector(HomeTableViewController.clickRighttBtn))
            
        }
            

    }
    
    func clickLeftBtn() {
        
        print("左侧")
        
        
    }
    

    func clickRighttBtn() {
        
        print("右侧")
        
        //name:storyBoard的名字
        let sb = UIStoryboard(name: "QRCodeViewController", bundle: nil)
        //选择要加载的控制器，storyBoard中带箭头的
        let QRCodeVC = sb.instantiateInitialViewController()
        
        self.presentViewController(QRCodeVC!, animated: true, completion: nil)

        
    }
    
    
    
    func clickMidBtn(sender:UIButton) {
//        sender.selected = !sender.selected
        
        let menuVC = MenuViewController()
        
//        menuVC.modalTransitionStyle = .CoverVertical
        
        //设置模态控制器的展现样式 、、 PS:如果不自定义，模态控制器会将当前控制器给移除，自定义以后，摸态视图会显示在当前控制器的上面
        menuVC.modalPresentationStyle = .Custom
        
        
        //因为在代理方法里面自定义，要挂代理 // CGRectMake(70, 57, 200, 300)
        menuVC.transitioningDelegate = self.poperAnimationC
        
        //跳出MenuViewController试图
        self.presentViewController(menuVC, animated: true, completion: nil)
        
    }
    
    
    //控制动画和展示样式的对象
    private var poperAnimationC : PoperAnimationController = {
        
        let vc = PoperAnimationController()
        vc.poperFrame = CGRectMake(70, 57, 200, 300)
        
        return vc
        
    }()
       
    
}

    
    
    
    
    








