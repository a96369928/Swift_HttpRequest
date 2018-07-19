//
//  DMAPI.swift
//  HttpRequest
//
//  Created by 易金 on 2018/1/5.
//  Copyright © 2018年 jin. All rights reserved.
//  moya的一个具体的接口实现

import Foundation
import Moya

enum  DMAPI {
    ///搜索
    case search(kw: String ,pi: Int, pz: Int)
    
    ///其他接口...
    case other1(param: String)
    case other2

}

// 补全HttpRequest.swift中没有处理的参数 
extension DMAPI: TargetType {
    
    var path: String {
        switch self {
        case .search:
            return "search-ajaxsearch-searchall"
        case .other1:
            return ""
        case .other2:
            return ""
        }
    }
    
    var task: Task {
        var params: [String: Any] = [:]
        
        switch self {
        case let .search(kw ,pi, pz):
            params["kw"] = kw
            params["pi"] = pi
            params["pz"] = pz
            
        case let .other1(param):
            params["param"] = param
            
        default:
            //不需要传参数的接口走这里
            return .requestPlain
        }
        
        //Task是一个枚举值，根据后台需要的数据，选择不同的http task。
        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
    
}
