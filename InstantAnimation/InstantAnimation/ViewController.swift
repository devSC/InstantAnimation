//
//  ViewController.swift
//  InstantAnimation
//
//  Created by Wilson Yuan on 2017/2/27.
//  Copyright © 2017年 Wilson Yuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animationVIew: JKAnimationView!
    
    @IBOutlet weak var leftAnimationView: JKAnimationView!
    
    @IBOutlet weak var rightAnimationView: JKAnimationView!
    
    var models = [AnimationModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let titles = ["动画绘制技巧", "音乐车祸现场", "一天一句歌词", "英国人的尴尬日常", "每天练一点瑜伽", "Google重返中国进展", "苹果新动向", "知乎热门钓鱼贴", "腾讯图片策划竞选", "历史上的今天"]
        
        for index in 1...20 {
            models.append(AnimationModel(title: titles[(index - 1)/2], imageName: "\(index).jpg"))
        }
        
        animationVIew.setModel(models[0])
        leftAnimationView.setModel(models[1])
        rightAnimationView.setModel(models[2])
    }

    @IBAction func changeButtonClicked(_ sender: UIButton) {
        
        let index = arc4random() % 18 + 1
        let leftIndex = arc4random() % 18 + 1
        let rightIndex = arc4random() % 18 + 1
        
        leftAnimationView.setModel(models[Int(leftIndex)])

        DispatchAfter(0.1) {
            self.animationVIew.setModel(self.models[Int(index)])
        }
        
        DispatchAfter(0.2) {
            self.rightAnimationView.setModel(self.models[Int(rightIndex)])
        }
    }
    
    
    func DispatchAfter(_ seconds:Double, block: @escaping (Void) -> Void) -> Void {
        let time = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time, execute: block)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

