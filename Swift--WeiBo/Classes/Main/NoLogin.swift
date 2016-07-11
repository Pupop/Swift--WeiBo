//
//  NoLogin.swift
//  Swift--WeiBo
//
//  Created by YinMingpu on 16/7/5.
//  Copyright © 2016年 Mingpu. All rights reserved.
//

import UIKit

class NoLogin: UIView {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //添加试图
        self.addSubview(self.markBGView)
        self.addSubview(self.circleView)
        self.addSubview(self.noteLabel)
        self.addSubview(self.iconView)
        
        self.addLayout()
        
}
    
    //MARK:留接口设置各模块
    func setNoLoginViewIsHome(isHome:Bool,imageName:String,text:String){
        
        self.circleView.hidden = !isHome
        self.iconView.image = UIImage(named:imageName)
        self.noteLabel.text = text
        
        if isHome == true {
            
            self.startAnimation()
        }
        
        
    }
    
    //开始动画
    func startAnimation() {
        //创建一种核心动画对象,keyPath指定什么样的动画
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        //设置动画的结束
        animation.duration = 5
        animation.toValue = 2*M_PI
        animation.repeatCount = MAXFLOAT
        //动画结束不移除
        animation.removedOnCompletion = false
        
        //将动画添加的某试图的layer层
        self.circleView.layer.addAnimation(animation, forKey: nil)
        
        
    }
    
    
    
    //MARK:添加约束
    func addLayout()  {
        
        //给子试图布局
        self.markBGView.snp_makeConstraints{ (make)in
            make.edges.equalTo(self).inset(0)
            
        }
        //
        self.circleView.snp_makeConstraints{ (make)in
            make.center.equalTo(self)
            
        }
        //
        self.noteLabel.snp_makeConstraints{ (make)in
            
            make.width.equalTo(244)
            make.top.equalTo(self.circleView.snp_bottom).offset(10)
            make.centerX.equalTo(circleView.snp_centerX)
        }
        //
        self.iconView.snp_makeConstraints{ (make)in
            make.center.equalTo(self)
            
        }
        
        
    }
    
    
    
    
    //MARK:懒加载背景试图  //闭包
    private lazy var markBGView:UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "visitordiscover_feed_mask_smallicon")
        
        return imageView
    }()
    
    
    //圈图
    private lazy var circleView:UIImageView = {
        
        let imageView = UIImageView(image: UIImage(named:"visitordiscover_feed_image_smallicon"))
        return imageView
    }()
    
    
    //label提示语
    private lazy var noteLabel:UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFontOfSize(15)
        label.textColor = UIColor.cyanColor()
        label.text = "奥尔卡公开 莎娃迪卡思密达 莎娃迪卡思密达 莎娃迪卡思密达 莎娃迪卡思密达 莎娃迪卡思密达 奥尔卡公开"
        label.numberOfLines = 0
        return label
        
    }()
    
    
    
    //模块icon试图
    private lazy var iconView:UIImageView = {
        
        let imageView = UIImageView(image: UIImage(named:"visitordiscover_feed_image_house"))
        return imageView
    }()
    
    
    //如果父类中有required构造的方法，子类一旦重写任何构方法。都必须实现父类中required修饰的方法
    //从xib加载视图时调用
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
     
    
    

}
