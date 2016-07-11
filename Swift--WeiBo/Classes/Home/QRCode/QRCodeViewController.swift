//
//  QRCodeViewController.swift
//  Swift--WeiBo
//
//  Created by YinMingpu on 16/7/7.
//  Copyright © 2016年 Mingpu. All rights reserved.
//

import UIKit
import AVFoundation

class QRCodeViewController: UIViewController {

    //scanBGView的高
    @IBOutlet weak var scanBGViewHeight: NSLayoutConstraint!
    
    //扫描试图的顶
    @IBOutlet weak var scanLineTop: NSLayoutConstraint!

    //
    @IBOutlet weak var tabBar: UITabBar!
    
    //冲击波试图
    @IBOutlet weak var scanLineView: UIImageView!
    
    
    
    @IBAction func closeScan(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        
    }
    
    
    //动画要在试图完全显示的时候才开始
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.startAnimation()
        
        self.startScan()
        
    }
    
    //开始扫描
    func startScan() {
        
        //1.判断是否支持输入设备
        if self.session.canAddInput(self.inputDevice) == false {
            
            return
        }
        
        //2.判断是否支持输出设备
        if self.session.canAddOutput(self.output) == false {
            
            return
        }
        
        
        //3.添加输入设备
        self.session.addInput(self.inputDevice)
        
        //4.添加输出设备
        self.session.addOutput(self.output)
        
        
        //5.设置输出设备支持的类型
        output.metadataObjectTypes = output.availableMetadataObjectTypes
        
        //6.设置代理，用于获取扫描出的内容(协议AVCaptureMetadataOutputObjectsDelegate)
        output.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        
        //7.添加图层
        self.view.layer.insertSublayer(self.preViewLayer, atIndex: 0)
        
        //8.开始扫描
        self.session.startRunning()
        
        //9.
        
    }
    
    
    
    
    
    
    //开始动画
    private func startAnimation() {
        
        //先让冲击波处于扫描试图的上面
        self.scanLineTop.constant = -self.scanBGViewHeight.constant
        //更新约束
        self.view.layoutIfNeeded()
        
        
        UIView.animateWithDuration(3){
            
            //重复动画
            UIView.setAnimationRepeatCount(MAXFLOAT)
            
            //设置冲击波试图终点
            self.scanLineTop.constant = self.scanBGViewHeight.constant
            //更新约束
            self.view.layoutIfNeeded()
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.selectedItem = self.tabBar.items![0]
        
        
    }

    
    //MARK: -扫描的懒加载
    //获取扫描会话
    private lazy var session:AVCaptureSession = AVCaptureSession()
    
    //2.获取到输入设备
    private lazy var inputDevice:AVCaptureDeviceInput? = {
        
       let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        //模拟器不支持摄像头
        do{
            
            return try! AVCaptureDeviceInput(device: device)
            
        }catch{
            
            return nil
            
        }
        
    }()

    //3.获取到输出设备
    private lazy var output:AVCaptureMetadataOutput = AVCaptureMetadataOutput()
    
    
    //4.获取到预览图层
    private lazy var preViewLayer:AVCaptureVideoPreviewLayer = {
        
        let player = AVCaptureVideoPreviewLayer(session: self.session)
        
         player.frame = self.view.frame
        
        //5. 设置填充模式,不设置填充模式，4s可能会出现问题
        player.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        
        return player
    }()
    
    
    
    
    
    
}







//MARK:  UITabBarDelegate
extension QRCodeViewController:UITabBarDelegate,AVCaptureMetadataOutputObjectsDelegate{
    
    //点击tabBarItem时调用
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        self.scanBGViewHeight.constant = item.tag == 0 ? 300 : 300*0.5
        self.view.layoutIfNeeded()
        
        //点击后移除原有的
        self.scanLineView.layer.removeAllAnimations()
        
        //重新开始动画
        self.startAnimation()
        
    }
    
    
    //获取扫描结果
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        
        
        print(metadataObjects)
    }
    
    
    
}








