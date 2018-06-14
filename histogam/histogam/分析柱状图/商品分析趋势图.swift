//
//  商品分析趋势图.swift
//  clientManagement
//
//  Created by 每天农资 on 2018/6/8.
//  Copyright © 2018年 我是五高你敢信. All rights reserved.
//

import UIKit

class 商品分析趋势图: UIView {

    var dataSource = [商品分析趋势每日数据]() {
        didSet {
            let result = dataSource.reduce(0) { (result, item) -> CGFloat in
                let money = CGFloat(item.money)
                return result > money ? result : money
            }
            
            最大值 = result
            
            let y单位值 = 最大值 / 3
            
            y1.text = String(format: "%.1f", y单位值)
            y2.text = String(format: "%.1f", y单位值 * 2)
            y3.text = "\(最大值)"
            
            collectionView.reloadData()
        }
    }
    private var 最大值: CGFloat = 0
    
    private let 商品分析趋势图CellID = "商品分析趋势图CellID"
    
    private let y1 = UILabel()
    private let y2 = UILabel()
    private let y3 = UILabel()
    
    private lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 35.scale自适应W, height: 90)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        let cl = UICollectionView(frame: CGRect(x: 65.scale自适应W, y: 0, width: 300.scale自适应W, height: 90), collectionViewLayout: layout)
        cl.showsVerticalScrollIndicator = false
        cl.showsHorizontalScrollIndicator = true
        cl.backgroundColor = UIColor.white
        cl.delegate = self
        cl.dataSource = self
        return cl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        setupCollectionView()
        绘制y坐标()
        
    }
    
    private func setupCollectionView() {
        collectionView.register(商品分析趋势图Cell.self, forCellWithReuseIdentifier: 商品分析趋势图CellID)
        
        addSubview(collectionView)
    }
    
    private func 绘制y坐标() {
        let y0 = UILabel()
        y0.text = "0"
        y0.setUI(font: 12, textColor: "919796")
        addSubview(y0)
        
        
        y1.setUI(font: 12, textColor: "919796")
        y2.setUI(font: 12, textColor: "919796")
        y3.setUI(font: 12, textColor: "919796")
        
        y1.text = "0"
        y2.text = "0"
        y3.text = "0"
        
        addSubview(y1)
        addSubview(y2)
        addSubview(y3)
        
        y0.snp.makeConstraints { (make) in
            make.right.equalTo(collectionView.snp.left).offset(-10)
            make.centerY.equalTo(collectionView.snp.bottom).offset(-30)
        }
        
        y1.snp.makeConstraints { (make) in
            make.right.equalTo(y0)
            make.centerY.equalTo(y0.snp.centerY).offset(-20)
        }
        
        y2.snp.makeConstraints { (make) in
            make.right.equalTo(y0)
            make.centerY.equalTo(y1.snp.centerY).offset(-20)
        }
        
        y3.snp.makeConstraints { (make) in
            make.right.equalTo(y0)
            make.centerY.equalTo(y2.snp.centerY).offset(-20)
        }
    }
}

extension 商品分析趋势图: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: 商品分析趋势图CellID, for: indexPath) as! 商品分析趋势图Cell
        cell.updateCellWithModel(dataSource[indexPath.row], 最大值: 最大值)
        return cell
    }
    
}
