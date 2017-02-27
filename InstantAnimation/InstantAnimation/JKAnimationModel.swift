//
//  JKAnimationModel.swift
//  InstantAnimation
//
//  Created by Wilson-Yuan on 2017/2/27.
//  Copyright © 2017年 Wilson Yuan. All rights reserved.
//

import Foundation

protocol JKAnimationModel {
    var title: String { get set }
    var imageName: String { get set }
}

struct AnimationModel: JKAnimationModel {
    var title: String = ""
    var imageName: String = ""
}
