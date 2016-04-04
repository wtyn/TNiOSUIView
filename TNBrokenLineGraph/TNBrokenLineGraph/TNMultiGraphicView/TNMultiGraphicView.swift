//
//  TNMultiGraphicView.swift
//  TNBrokenLineGraph
//
//  Created by wwy on 16/4/2.
//  Copyright © 2016年 wwy. All rights reserved.
//

// 该代理方法可以设置x轴的值
@objc protocol TNMultiLineChartViewDelegate: NSObjectProtocol {
    optional   func setXAxisValuesShow(view: TNMultiLineChartView) ->([NSString])
    optional   func setXValuePointShow(view: TNMultiLineChartView) ->([[NSString]])
}


import UIKit

class TNMultiLineChartView: UIScrollView {

    
    // 绘制线的模型
    var _brokenLineModelArr: [TNMultiLineChartContentModel] = []
    var brokenLineModelArr: [TNMultiLineChartContentModel] {
        get{
            return _brokenLineModelArr
        }
        
        set {
            _brokenLineModelArr = newValue
            if _brokenLineGraphView != nil {
                
                self.addBrokenLineGraphView()
            }
            
        }
    }
    
    // 代理
    weak var setXAxisValuesDelegate: TNMultiLineChartViewDelegate?
    
    // 动画显示时长,默认为1.5秒
    var annimationDuration: Double = 1.5
    
    // 是否显示值
    var showValues: Bool = false // 默认不显示
    
    // 单位
    var xAxisUnit: NSString?
    var yAxisUnit: NSString?


    // x轴坐标的个数
    var xValueCount: Int = 3
    // y轴坐标的个数
    var yValueCount: Int = 10
    
    // x,y 最大坐标值
    var xMaxValue: CGFloat?
    var yMaxValue: CGFloat?
    
    
    var _brokenLineGraphView: TNMultiLineChartContentView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        self.addBrokenLineGraphView()
    }
    
    
    // 添加绘制的视图
    func addBrokenLineGraphView() -> Void {
       

        var contentWidth = self.contentSize.width - 10
        if contentWidth < 10 {
            contentWidth = self.bounds.size.width - 10
        }
        let brokenLineGraphViewFrame = CGRectMake(0, 0,contentWidth, self.bounds.size.height)
        print(self.bounds.size.height)
        if _brokenLineGraphView == nil {
            _brokenLineGraphView = TNMultiLineChartContentView(frame: brokenLineGraphViewFrame)
            self.addSubview(_brokenLineGraphView)
        }else{
            _brokenLineGraphView.frame = brokenLineGraphViewFrame
        }
        _brokenLineGraphView.brokenLineModelArr = self.brokenLineModelArr
        _brokenLineGraphView.xValueCount = self.xValueCount
        _brokenLineGraphView.xMaxValue = self.xMaxValue
        _brokenLineGraphView.yValueCount = self.yValueCount
        _brokenLineGraphView.yMaxValue = self.yMaxValue
        _brokenLineGraphView.xAxisUnit = self.xAxisUnit
        _brokenLineGraphView.yAxisUnit = self.yAxisUnit
        _brokenLineGraphView.showValues = self.showValues
        if self.setXAxisValuesDelegate != nil {
            if  self.setXAxisValuesDelegate!.respondsToSelector(#selector(TNMultiLineChartViewDelegate.setXAxisValuesShow(_:))){
                _brokenLineGraphView.xAxisValuesArr = self.setXAxisValuesDelegate!.setXAxisValuesShow!(self)
            }
            
           if  self.setXAxisValuesDelegate!.respondsToSelector(#selector(TNMultiLineChartViewDelegate.setXValuePointShow(_:))){
                _brokenLineGraphView.xValuePointShowArr = self.setXAxisValuesDelegate!.setXValuePointShow!(self)
            }
            
        }
        _brokenLineGraphView.annimationDuration = self.annimationDuration
        _brokenLineGraphView.brokenLineModelArr = self.brokenLineModelArr
        
        
    }
    
    deinit{
        print("内存释放了1111")
    }
    
}
