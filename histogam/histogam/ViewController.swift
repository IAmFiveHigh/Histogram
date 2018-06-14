//
//  ViewController.swift
//  histogam
//
//  Created by 每天农资 on 2018/6/14.
//  Copyright © 2018年 我是五高你敢信. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var dataSource = [商品分析趋势每日数据]()
    
    private var collectionView: 商品分析趋势图!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView = 商品分析趋势图(frame: CGRect(x: 0, y: 80, width: screenWidth, height: 90))
        view.addSubview(collectionView)
        
        collectionView.dataSource = dataSource
    }

    

}

