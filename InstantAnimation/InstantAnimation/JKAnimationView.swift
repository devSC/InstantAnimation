//
//  JKAnimationView.swift
//  InstantAnimation
//
//  Created by Wilson-Yuan on 2017/2/27.
//  Copyright © 2017年 Wilson Yuan. All rights reserved.
//

import UIKit

@IBDesignable class JKAnimationView: UIView {
    
    internal let imageView = UIImageView()
    internal let topImageView = UIImageView()
    internal let imageContainer = UIView()
    internal let gradientView = UIView()
    
    internal let titleLabel = UILabel()
    internal let topTitleLabel = UILabel()
    internal let titleContainer = UIView()
    
    internal var showingImageView: UIImageView?
    internal var showingLabel: UILabel?
    
    internal var oldImageView: UIImageView?
    internal var oldLabel: UILabel?
    
    
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
        
        if showingImageView == nil {
            showingImageView = imageView
            showingLabel = titleLabel
        }
        else {
            if showingImageView == imageView {
                //should show top
                oldLabel = showingLabel
                oldImageView = showingImageView
                
                showingImageView = topImageView
                showingLabel = topTitleLabel
            }
            else {
                oldLabel = showingLabel
                oldImageView = showingImageView
                
                showingImageView = imageView
                showingLabel = titleLabel
            }
        }
        
        showingImageView?.image = UIImage(named: model.imageName)
        showingLabel?.text = model.title
        
        guard let height = showingImageView?.bounds.height,
            let titleHeight = showingLabel?.bounds.height else {
                return print("height is 0")
        }
        
        showingImageView?.transform = CGAffineTransform(translationX: 0, y: -height)
        showingLabel?.transform = CGAffineTransform(translationX: 0, y: -titleHeight)
        
        if oldLabel != nil {
            self.gradientView.alpha = 0;
        }
        
        //do animation
        UIView.animate(
            withDuration: 0.8,
            delay: 0,
            usingSpringWithDamping: 0.85,
            initialSpringVelocity: 0.6,
            options: [.beginFromCurrentState, .curveEaseIn], animations: {
                
                self.showingImageView?.transform = CGAffineTransform.identity
                self.showingLabel?.transform = CGAffineTransform.identity
                
                self.oldImageView?.transform = CGAffineTransform(translationX: 0, y: height)
                self.oldLabel?.transform = CGAffineTransform(translationX: 0, y: titleHeight)
                
                if self.oldLabel != nil {
                    self.gradientView.transform = CGAffineTransform(translationX: 0, y: height)
                    self.gradientView.alpha = 1;
                }
        }) { (finished) in
            if finished {
                self.gradientView.alpha = 0;
                self.gradientView.transform = CGAffineTransform.identity
                
            }
        }
    }
}

//MARK: Private method
extension JKAnimationView {
    
    internal func configureSubview() -> Void {
        //setframe
        titleLabel.font = UIFont.systemFont(ofSize: 12)
        titleLabel.textAlignment = .center
        topTitleLabel.font = UIFont.systemFont(ofSize: 12)
        topTitleLabel.textAlignment = .center
        
        imageView.layer.cornerRadius = 3
        topImageView.layer.cornerRadius = 3
        imageContainer.layer.cornerRadius = 3
        
        imageView.clipsToBounds = true
        topImageView.clipsToBounds = true
        imageContainer.clipsToBounds = true
        
        imageView.contentMode = .scaleAspectFill
        topImageView.contentMode = .scaleAspectFill
        
        titleContainer.clipsToBounds = true
        
        gradientView.layer.cornerRadius = 3;
        gradientView.clipsToBounds = true
        gradientView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        gradientView.alpha = 0
        
        layoutSubviewFrame()
        
        addSubview(imageContainer)
        imageContainer.addSubview(imageView)
        imageContainer.addSubview(topImageView)
        imageContainer.addSubview(gradientView)
        
        addSubview(titleContainer)
        titleContainer.addSubview(titleLabel)
        titleContainer.addSubview(topTitleLabel)
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
        gradientView.frame = self.imageContainer.bounds
        
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

