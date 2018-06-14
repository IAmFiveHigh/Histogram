//
//  商品分析趋势图json.swift
//  clientManagement
//
//  Created by 每天农资 on 2018/6/8.
//  Copyright © 2018年 我是五高你敢信. All rights reserved.
//

import UIKit
import SwiftyJSON

class 商品分析趋势图json: NSObject {
    var code : String!
    var data : [商品分析趋势每日数据]!
    var message : String!
    
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json == nil{
            return
        }
        code = json["code"].stringValue
        data = [商品分析趋势每日数据]()
        let dataArray = json["data"].arrayValue
        for dataJson in dataArray{
            let value = 商品分析趋势每日数据(fromJson: dataJson)
            data.append(value)
        }
        message = json["message"].stringValue
    }
}

class 商品分析趋势每日数据{
    
    var date : String!
    var money : Double!
    var totalMoney : Double!
    
    
    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json == nil{
            return
        }
        date = json["date"].stringValue
        money = json["money"].doubleValue
        totalMoney = json["total_money"].doubleValue
    }
    
}

