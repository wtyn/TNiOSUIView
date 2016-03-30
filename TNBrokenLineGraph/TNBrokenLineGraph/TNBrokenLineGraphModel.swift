//
//  TNBrokenLineGraphModel.swift
//  TNBrokenLineGraph
//
//  Created by wwy on 16/3/30.
//  Copyright © 2016年 wwy. All rights reserved.
//

import UIKit

// 折线的属性模型
class TNBrokenLineGraphModel: NSObject {

    var lineColor: UIColor? // 线条的颜色
    var valueArr: [CGPoint]? // 线的值数组,存储点:[(10,20),(20,19)]
    var width: NSNumber? // 线宽
    var unitStr: NSString? // 单位
    
}
