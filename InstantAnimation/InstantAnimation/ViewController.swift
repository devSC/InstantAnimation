//
//  ViewController.swift
//  InstantAnimation
//
//  Created by Wilson Yuan on 2017/2/27.
//  Copyright © 2017年 Wilson Yuan. All rights reserved.
//

import UIKit

protocol JKAnimationModel {
    var title: String { get set }
    var imageName: String { get set }
}

class JKAnimationView: UIView {
    
    internal let imageView = UIImageView()
    internal let topImageView = UIImageView()
    internal let imageContainer = UIView()
    
    internal let titleLabel = UILabel()
    internal let topTitleLabel = UILabel()
    internal let titleContainer = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureSubview()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutSubviewFrame()
    }
    
    func setModel(_ model: JKAnimationModel) -> Void {
            
    }
}

//MARK: Private method
extension JKAnimationView {
    
    internal func configureSubview() -> Void {
        //setframe
        imageContainer.clipsToBounds = true
        titleContainer.clipsToBounds = true
        
        layoutSubviewFrame()
    }
    
    internal func layoutSubviewFrame() -> Void {
        
        imageContainer.frame = CGRect(
            x: 0,
            y: 0,
            width: self.bounds.width,
            height: self.bounds.width
        )
        
        imageView.frame = self.imageContainer.bounds
        topImageView.frame = self.imageContainer.bounds
        
        titleContainer.frame = CGRect(
            x: 0,
            y: self.bounds.width,
            width: self.bounds.width,
            height: self.bounds.height - self.bounds.width
        )
        
        titleLabel.frame = self.titleContainer.bounds
        topTitleLabel.frame = self.titleContainer.bounds
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

