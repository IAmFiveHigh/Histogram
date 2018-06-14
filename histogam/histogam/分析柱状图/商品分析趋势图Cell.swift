//
//  商品分析趋势图Cell.swift
//  clientManagement
//
//  Created by 每天农资 on 2018/6/8.
//  Copyright © 2018年 我是五高你敢信. All rights reserved.
//

import UIKit

class 商品分析趋势图Cell: UICollectionViewCell {
    
    private let 柱子 = UIView()
    private let date = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = UIColor.white
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        let line1 = UIView.getLine(width: 1, superView: contentView)
        line1.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        let line2 = UIView.getLine(width: 1, superView: contentView)
        line2.snp.makeConstraints { (make) in
            make.left.right.equalTo(line1)
            make.top.equalToSuperview().offset(20)
        }
        
        let line3 = UIView.getLine(width: 1, superView: contentView)
        line3.snp.makeConstraints { (make) in
            make.left.right.equalTo(line1)
            make.top.equalToSuperview().offset(40)
        }
        
        let line4 = UIView.getLine(width: 1, superView: contentView)
        line4.snp.makeConstraints { (make) in
            make.left.right.equalTo(line1)
            make.top.equalToSuperview().offset(60)
        }
        
        date.setUI(font: 12, textColor: "919796")
        contentView.addSubview(date)
        
        柱子.backgroundColor = UIColor(hexColor: "3098CC")
        contentView.addSubview(柱子)
        
        柱子.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-30)
            make.width.equalTo(20.scale自适应W)
            make.height.equalTo(0)
        }
        
        date.snp.makeConstraints { (make) in
            make.top.equalTo(柱子.snp.bottom).offset(8)
            make.centerX.equalTo(柱子)
        }
    }
    
    func updateCellWithModel(_ model: 商品分析趋势每日数据, 最大值: CGFloat) {
        
        let dateArray = model.date.components(separatedBy: "-")
        if dateArray.count == 3 {
            date.text = dateArray[2] + "日"
        }

        柱子.layer.mask = nil
        
        if 最大值 != 0 {
            let height = CGFloat(model.money) / 最大值 * 60
            柱子.snp.updateConstraints { (make) in
                make.height.equalTo(height)
            }
            
            let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 20.scale自适应W, height: height), byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 2, height: 2))
            let layer = CAShapeLayer()
            layer.path = path.cgPath
            柱子.layer.mask = layer
        }else {
            
            柱子.snp.updateConstraints { (make) in
                make.height.equalTo(0)
            }
            
        }
        
        
        
    }
    
    
}
