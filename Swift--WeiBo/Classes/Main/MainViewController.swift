//
//  MainViewController.swift
//  swift新浪微博
//
//  Created by GG on 16/7/3.
//  Copyright © 2016年 GG. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //应用于tabBar栏的背景颜色
//        self.tabBar.barTintColor = UIColor.orangeColor()
        //应用于tabBarItem 字的颜色
        self.tabBar.tintColor = UIColor.orangeColor()
        
        self.addtabBarVC()
        
        
    }
    
    //MARK:重写viewWillAppear、建议在viewWillAppear中设置子控件的frame
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.addMidBtn()
    }
    
    
    //btn设为全局
    let btn = UIButton(type: .Custom)
    //MARK:添加中间按钮
    func addMidBtn() {
        
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), forState: .Normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), forState: .Highlighted)
        
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), forState: .Normal)
        btn.setImage((UIImage(named: "tabbar_compose_icon_add_highlighted")), forState: .Highlighted)
        
        
        let screenW = UIScreen.mainScreen().bounds.size.width
        let btnW = screenW / CGFloat((self.viewControllers?.count)!)
        
        let btnH:CGFloat = 49
        let btnX:CGFloat = 2*btnW
        let btnY:CGFloat = 0
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH)
        self.tabBar.addSubview(btn)
        
        
        btn.addTarget(self, action: #selector(MainViewController.clickBtn), forControlEvents: .TouchUpInside)
        
        
        
    }
    
    
    
    func clickBtn() {
        
        
        print("+")
    }
    
    //MARK:添加子控制器
    func addtabBarVC() {
        
        //调用方法
        self.addTabBarChildVC("HomeTableViewController", title: "首页", imageName: "tabbar_home")
        
        //message
        self.addTabBarChildVC("MessageTableViewController", title: "消息", imageName: "tabbar_message_center")
        
        //
        self.addTabBarChildVC("NewViewController", title: "", imageName: "")
        
        
        //
        self.addTabBarChildVC("DiscoverTableViewController", title: "发现", imageName: "tabbar_discover")
        //
        self.addTabBarChildVC("ProfileTableViewController", title: "我", imageName: "tabbar_profile")
        
        //        self.addTabBarChildVC("Double11TableViewController", title: "双十一", imageName: "tabbar_profile")
        
    }
    
    /*
     * 将字符串类名转化为类
     
     1、动态的获取命名空间
     2、拼接类名： 命名空间 + . + 类名
     3、将拼接好的类名转化为一个类
     4、指定是哪一种类
     5、利用该类创建对象
     */

    //MARK:
    private func addTabBarChildVC(tempVC:String,title:String,imageName:String){
        
        /*
          Swift将字符串类名转化为类
         */
        //获取命名空间：就是用来区分两个完全相同的类，，，，Swift--WeiBo和Test
        //as! String指定返回的是一字符串
        let namespace  = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        
        let className:AnyClass = NSClassFromString(namespace + "." + tempVC)!
        //指定className是一个控制器类型
        let claVC = className as!
            UIViewController.Type
        //用转化成的控制器的类创建一个对象
        let vc = claVC.init()
        
        
//        let vc = tempVC
        
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        let nav = UINavigationController(rootViewController: vc)
        
        self.addChildViewController(nav)
        
        
    }
    
}

/*
 PS：工程名中有中文的话，记得在product name修改成英文，设置为全英文，不能有空格
 
 OC打印一个类
 
 <ViewController: 0x7ff9ea79a450>
 
 UIViewController *VC =  [[NSClassFromString(@"UIViewController") alloc]init];
 
 swift打印一个类
 
 <swiftWeiBo.MainViewController: 0x7ff15a599e90>
 
 var claName:AnyClass =  NSClassFromString("swiftWeiBo" + "." + "UIViewController")!
 
 */




